<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="/css/style.css" rel="stylesheet" />
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese:wght@400;700&display=swap"
                    rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <title>Update User</title>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>

                            <div class="container-fluid px-4" style="font-size: larger;">

                                <ol class="breadcrumb mb-4">
                                    <p>Dashboard</p>
                                    <p>/ Update User</p>
                                </ol>

                            </div>
                            <div class="container mt-5" style="margin-left: 50px;">
                                <h2>Update User</h2>

                                <form:form method="post" action="/admin/user/update" modelAttribute="newUser"
                                    enctype="multipart/form-data">

                                    <div class="mb-3" style="display: none;">
                                        <label class="form-label">Id:</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Email:</label>
                                        <form:input type="email" class="form-control" path="email" disabled="true" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Phone number:</label>
                                        <form:input type="text" class="form-control" path="phone" />
                                    </div>
                                    <div class="mb-3">
                                        <c:set var="errorfullName">
                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                        </c:set>
                                        <label class="form-label">Full Name:</label>
                                        <form:input type="text"
                                            class="form-control ${not empty errorfullName ? 'is-invalid' : ''}"
                                            path="fullName" />
                                        ${errorfullName}
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Address:</label>
                                        <form:input type="text" class="form-control" path="address" />
                                    </div>
                                    <div class="form-group">
                                        <label for="role">Role</label>
                                        <form:select path="role.id" class="form-control" id="role">
                                            <form:options items="${roles}" itemValue="id" itemLabel="name" />
                                        </form:select>
                                    </div>
                                    <div class="form-group mt-5">
                                        <label for="avatar">Avatar</label>
                                        <input type="file" class="form-control" id="avatar" name="hStoreFile" />
                                    </div>
                                    <div class="d-flex align-items-center mt-5">
                                        <button type="submit" class="btn btn-warning">Update</button>
                                        <a href="/admin/user" class="btn btn-success ms-2 mt-0">Back</a>
                                    </div>

                                </form:form>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>

                </div>
                </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/script.js"></script>
            </body>

            </html>