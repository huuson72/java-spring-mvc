<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="/css/style.css" rel="stylesheet" />
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese:wght@400;700&display=swap"
                    rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <title>Document</title>

                <style>
                    .form-container {
                        max-width: 1000px;
                        /* Đặt chiều rộng tối đa của form */
                        width: 100%;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">

                                <ol class="breadcrumb mb-4" style="font-size: larger; ">
                                    <p>Dashboard</p>
                                    <p>/ Create User</p>
                                </ol>
                                <div class=" d-flex justify-content-center ">
                                    <div class="row w-100">
                                        <div class="col-md-10 form-container">
                                            <h2>Create User</h2>
                                            <hr>
                                            <!-- <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser">
                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email</label>
                                                        <form:input type="email" class="form-control" path="email" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Password</label>
                                                        <form:input type="password" class="form-control"
                                                            path="password" />
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Phone Number</label>
                                                        <form:input type="tel" class="form-control" path="phone" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Full Name</label>
                                                        <form:input type="text" class="form-control" path="fullName" />
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Role</label>
                                                        <form:select path="role" class="form-control">
                                                            <option value="ADMIN">ADMIN</option>
                                                            <option value="USERS">USERS</option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Avatar</label>
                                                        <input type="file" class="form-control" />
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </form:form> -->

                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser" class="row" enctype="multipart/form-data">
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Email:</label>
                                                    <form:input type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        path="email" />
                                                    ${errorEmail}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Password:</label>
                                                    <form:input type="password"
                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        path="password" />
                                                    ${errorPassword}


                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Phone number:</label>
                                                    <form:input type="text" class="form-control" path="phone" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorFullName">
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Full Name:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                        path="fullName" />
                                                    ${errorFullName}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Address:</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Role:</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="hStoreFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview" />
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                    <a href="${pageContext.request.contextPath}/admin/user"
                                                        class="btn btn-secondary">Cancel</a>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/script.js"></script>
            </body>


            </html>