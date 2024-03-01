<%@ page contentType="text/html;charset=UTF-8" %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">User List</h6>
    </div>
    <div class="card-body">
        <form action="<c:url value="/user/add"/>" method="post">
            <div class="form-group flex-column">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="username"
                           placeholder="Username" name="username">
                    <input type="email" class="form-control form-control-user" id="email"
                       placeholder="Email Address" name="email">
                    <input type="password" class="form-control form-control-user"
                           id="password" placeholder="Password" name="password">
                    <button type="submit">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>