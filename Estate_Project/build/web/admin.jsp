<%-- 
    Document   : admin
    Created on : Dec 9, 2019, 9:57:01 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <%@include file="admin_nav.jsp"%>

        <form action="MainController">
            <div class="south-search-area" style="padding-top: 12rem">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="advanced-search-form">
                                <!-- Search Title -->
                                <div class="search-title">
                                    <p>Admin Estate Search</p>
                                </div>
                                <!-- Search Form -->
                                <div class="row">
                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="provinces" id="provinces">
                                                <option value="0">All Provinces</option>
                                                <c:forEach var="provinces" items="${requestScope.PROVINCES}">
                                                    <option value="${provinces.id}">${provinces.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="catagories" id="catagories">
                                                <option value="0">All Catagories</option>
                                                <c:forEach var="categories" items="${requestScope.CATEGORIES}">
                                                    <option value="${categories.id}">${categories.type}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="owners" id="owners">
                                                <option value="0">All Owners</option>
                                                <c:forEach var="owners" items="${requestScope.OWNERS}">
                                                    <option value="${owners.id}">${owners.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-2">
                                        <div class="form-group">
                                            <select class="form-control" name="bedrooms" id="bedrooms">
                                                <option value="0">Bedrooms</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="6">5+</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="bathrooms" id="bathrooms">
                                                <option value="0">Bathrooms</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="6">5+</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="square" id="square">
                                                <option value="0">Square</option>
                                                <option value="1">0-50 sq. ft</option>
                                                <option value="2">50-100 sq. ft</option>
                                                <option value="3">100-200 sq. ft</option>
                                                <option value="4">200-500 sq. ft</option>
                                                <option value="5">500+ sq. ft</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="price" id="price">
                                                <option value="0">Price</option>
                                                <option value="1">< 500 000$</option>
                                                <option value="2">500 000$ - 1 000 000$</option>
                                                <option value="3">1 000 000$ - 2 000 000$</option>
                                                <option value="4">2 000 000$ - 5 000 000$</option>
                                                <option value="5">> 5 000 000$</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-2">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" name="InteriorChb" id="InteriorChb" value="checked">
                                            <label class="form-check-label" for="exampleCheck1">Interior</label>
                                        </div>
                                    </div>

                                    <div class="col-12 d-flex justify-content-center align-items-end">
                                        <!-- Submit -->
                                        <div class="form-group mb-0">
                                            <button type="submit" class="btn south-btn" name="action" value="Admin_Search_Estate">Search</button>
                                            <button type="submit" class="btn south-btn" name="action" value="Admin_Insert_New_Estate" style="background-color: #ff9999">Add new Estate</button>

                                            <input type="hidden" name="searchProvince" value="${requestScope.searchProvince}"/>
                                            <input type="hidden" name="searchCategory" value="${requestScope.searchCategory}"/>
                                            <input type="hidden" name="searchOwner" value="${requestScope.searchOwner}"/>
                                            <input type="hidden" name="searchBedroom" value="${requestScope.searchBedroom}"/>
                                            <input type="hidden" name="searchBathroom" value="${requestScope.searchBathroom}"/>
                                            <input type="hidden" name="searchPrice" value="${requestScope.searchPrice}"/>
                                            <input type="hidden" name="searchSquare" value="${requestScope.searchSquare}"/>
                                            <input type="hidden" name="searchInterior" value="${requestScope.searchInterior}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <c:if test="${requestScope.LISTPROPERTY != null}">
            <c:if test="${not empty requestScope.LISTPROPERTY}">
                <div>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">Address</th>
                                <th scope="col">Price</th>
                                <th scope="col">Square</th>
                                <th scope="col">Interior</th>
                                <th scope="col">Room</th>
                                <th scope="col">Toilet</th>
                                <th scope="col">Sold</th>
                                <th scope="col">Category</th>
                                <th scope="col">Province</th>
                                <th scope="col">Owner</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                                <th scope="col">Show Details</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" varStatus="counter" items="${requestScope.LISTPROPERTY}">
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${list.address}</td>
                                    <td>${list.salePrice}</td>
                                    <td>${list.square}</td>
                                    <td>
                                        <c:if test="${list.interior == true}">
                                            Yes
                                        </c:if>

                                        <c:if test="${list.interior == false}">
                                            No
                                        </c:if>
                                    </td>
                                    <td>${list.numberOfRoom}</td>
                                    <td>${list.numberOfToilet}</td>
                                    <td>${list.sold}</td>
                                    <td>${list.category}</td>
                                    <td>${list.province}</td>
                                    <td>${list.owner}</td>
                                    <td>
                                        <form action="MainController" method="POST" enctype="multipart/form-data">
                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-primary btn-sm" name="action" value="Admin_Edit_Estate">Update</button>
                                                <input type="hidden" name="propertyID" value="${list.propertyID}"/>
                                                <input type="hidden" name="address" value="${list.address}"/>
                                                <input type="hidden" name="price" value="${list.salePrice}"/>
                                                <input type="hidden" name="square" value="${list.square}"/>
                                                <input type="hidden" name="interior" value="${list.interior}"/>
                                                <input type="hidden" name="description" value="${list.description}"/>
                                                <input type="hidden" name="numberOfRoom" value="${list.numberOfRoom}"/>
                                                <input type="hidden" name="numberOfToilet" value="${list.numberOfToilet}"/>
                                                <input type="hidden" name="owner" value="${list.owner}"/>

                                                <input type="hidden" name="searchProvince" value="${requestScope.searchProvince}"/>
                                                <input type="hidden" name="searchCategory" value="${requestScope.searchCategory}"/>
                                                <input type="hidden" name="searchOwner" value="${requestScope.searchOwner}"/>
                                                <input type="hidden" name="searchBedroom" value="${requestScope.searchBedroom}"/>
                                                <input type="hidden" name="searchBathroom" value="${requestScope.searchBathroom}"/>
                                                <input type="hidden" name="searchPrice" value="${requestScope.searchPrice}"/>
                                                <input type="hidden" name="searchSquare" value="${requestScope.searchSquare}"/>
                                                <input type="hidden" name="searchInterior" value="${requestScope.searchInterior}"/>
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <c:if test="${list.sold == false}">
                                            <c:url var="delete_Estate" value="MainController">
                                                <c:param name="propertyID" value="${list.propertyID}"></c:param>
                                                <c:param name="action" value="Admin_Delete_Estate"></c:param>

                                                <c:param name="searchProvince" value="${requestScope.searchProvince}"></c:param>
                                                <c:param name="searchCategory" value="${requestScope.searchCategory}"></c:param>
                                                <c:param name="searchOwner" value="${requestScope.searchOwner}"></c:param>
                                                <c:param name="searchBedroom" value="${requestScope.searchBedroom}"></c:param>
                                                <c:param name="searchBathroom" value="${requestScope.searchBathroom}"></c:param>
                                                <c:param name="searchPrice" value="${requestScope.searchPrice}"></c:param>
                                                <c:param name="searchSquare" value="${requestScope.searchSquare}"></c:param>
                                                <c:param name="searchInterior" value="${requestScope.searchInterior}"></c:param>
                                            </c:url>
                                            <a href="${delete_Estate}" class="deleteLink">Delete</a>
                                        </c:if>
                                    </td>
                                    <td>
                                        <form action="MainController" method="POST">
                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-primary btn-sm" name="action" value="ShowDetails_Estate">Show Details</button>
                                                <input type="hidden" name="propertyID" value="${list.propertyID}"/>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </c:if>
        </c:if>

        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <script src="js/classy-nav.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

        <script>
            function myFunction(e) {
                if (!confirm('Do you really want to delete?'))
                {
                    e.preventDefault();
                }
            }
            const deleteLinks = document.querySelectorAll('.deleteLink');
            for (let link of deleteLinks) {
                link.addEventListener('click', e => {
                    myFunction(e);
                });
            }
        </script>
    </body>
</html>
