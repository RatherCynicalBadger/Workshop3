<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<%@include file="header.jsp"%>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@include file="sidebar.jsp"%>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%@ include file="toolbar.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
                        <a href="<c:url value="/user/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Add user</a>
                    </div>

                    <c:choose>
                        <c:when test="${sessionScope.action == 'add'}">
                            ${sessionScope.remove("action")}
                            <%@include file="user-add.jsp"%>
                        </c:when>
                        <c:when test="${sessionScope.action == 'show'}">
                            ${sessionScope.remove("action")}
                            <%@include file="user-show.jsp"%>

                        </c:when>
                        <c:when test="${sessionScope.action == 'edit'}">
                            ${sessionScope.remove("action")}
                            <%@include file="user-edit.jsp"%>
                        </c:when>
                        <c:otherwise>
                            <%@include file="table.jsp"%>
                            <!--Zwalnianie pamięci w sesji. Nie wiem, czy optymalizuje to wydajność,
                            czy ciągłe usuwanie i tworzenie na nowo jest niewskazane.-->
                            <c:if test="${not empty sessionScope.user}">
                                ${sessionScope.remove("user")}
                            </c:if>
                            ${sessionScope.remove("users")}
                        </c:otherwise>
                    </c:choose>
                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <%@ include file="footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <%@include file="scripts.jsp"%>

</body>

</html>
