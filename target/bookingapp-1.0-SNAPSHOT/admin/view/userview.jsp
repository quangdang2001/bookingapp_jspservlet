<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../common/header.jsp"/>
<body>
<c:import url="../common/sidebar.jsp"/>

<div class="mobile-menu-overlay"></div>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>DataTable</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                        <div class="dropdown">

                        </div>
                    </div>
                </div>
            </div>
            <!-- Simple Datatable start -->
            <div class="card-box mb-30">
                <div class="pd-20">
                    <h4 class="text-green h4">User</h4>
                </div>
                <div class="pb-20">
                    <table class="data-table table stripe hover nowrap">
                        <thead>
                        <tr>
                            <th class="table-plus datatable-nosort">ID</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th class="datatable-nosort">Action</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="user" items="${users}">

                            <tr>
                                <td class="table-plus">${user.id}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.email}</td>
                                <td>${user.password}</td>
                                <td>${user.role}</td>
                                <td>
                                    <div class="dropdown">
                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                           href="#" role="button" data-toggle="dropdown">
                                            <i class="dw dw-more"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                <%--                                            <a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>--%>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/adminPage/user?id=${user.id}&action=update"><i class="dw dw-edit2"></i> Edit</a>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/adminPage/user?id=${user.id}&action=delete"><i class="dw dw-delete-3"></i> Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="pd-20 card-box mb-30">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4 class="text-blue h4">Form add user</h4>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/adminPage/user" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">First name:</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="firstname" class="form-control" type="text" value="${user.firstName}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Last name:</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="lastname" class="form-control" type="text" value="${user.lastName}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Email:</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="email" class="form-control" type="text" value="${user.email}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Password:</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="password" class="form-control" type="text" value="${user.password}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Role:</label>
                        <div class="col-md-6">
                            <div class="form-group">
                                <select class="custom-select2 form-control" name="role"
                                        style="width: 100%; height: 38px;">
                                    <optgroup>
                                            <option value="ROLE_USER">User</option>
                                            <option value="ROLE_ADMIN">Admin</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                    </div>

                    <input type="submit" class="btn btn-primary " value="Save">
                </form>

            </div>
        </div>

        <c:import url="../common/footer.jsp"/>
    </div>

</div>
<!-- js -->
<c:import url="../common/library.jsp"/>
</body>
</html>