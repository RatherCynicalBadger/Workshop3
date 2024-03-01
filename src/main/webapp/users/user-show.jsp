<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">User details</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="user-show">
                <thead>
                User details
                </thead>
                <tbody>
                <tr>
                    <td>ID</td>
                    <td>${sessionScope.user.id}</td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td>${sessionScope.user.username}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>${sessionScope.user.email}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer py-3">
        <a href="${pageContext.request.contextPath}/user/list">Return to list</a>
    </div>
</div>