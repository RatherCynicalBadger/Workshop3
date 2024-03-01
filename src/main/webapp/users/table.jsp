<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">User List</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="entry" items="${sessionScope.users}">
                    <tr>
                        <td>${entry.id}</td>
                        <td>${entry.username}</td>
                        <td>${entry.email}</td>
                        <td>
                            <a href="<c:url value="/user/show"/>?id=${entry.id}">Show</a>
                            <a href="<c:url value="/user/edit"/>?id=${entry.id}">Edit</a>
                            <a href="<c:url value="/user/delete"/>?id=${entry.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>