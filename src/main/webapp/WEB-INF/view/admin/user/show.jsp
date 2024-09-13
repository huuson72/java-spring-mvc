<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="/css/style.css" rel="stylesheet" />

                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese:wght@400;700&display=swap"
                    rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese:wght@400;700&display=swap"
                    rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <title>Document</title>
                <style>
                    .avatar-container {
                        width: 100px;
                        height: 100px;
                        border-radius: 50%;
                        overflow: hidden;
                        border: 2px solid #ddd;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        margin-right: 15px;
                    }

                    .avatar-container img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        /* Đảm bảo ảnh lấp đầy khung */
                        object-position: center;
                        /* Căn giữa ảnh trong khung */
                    }

                    .avatar-section {
                        display: flex;
                        align-items: center;
                    }

                    .avatar-label {
                        font-weight: bold;
                        margin-right: 10px;
                    }

                    .user-info-item {
                        display: flex;
                        align-items: center;
                    }
                </style>


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
                                    <p>/ Show User</p>
                                </ol>

                            </div>
                            <div class="container mt-5 " style="margin-left: 50px;">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>User Detail ID: ${id}</h3>
                                        </div>
                                        <hr>
                                        <div class="card" style="width: 60%;">
                                            <div class="card-header">
                                                User Information
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item user-info-item">

                                                    <div class="avatar-container">
                                                        <img src="${pageContext.request.contextPath}/images/avatar/${user.avatar}"
                                                            alt="User Image">
                                                    </div>
                                                    <div>
                                                        <div class="avatar-label">${user.fullName}</div>

                                                    </div>

                                                </li>
                                                <li class="list-group-item">ID: ${user.id}</li>
                                                <li class="list-group-item">Email: ${user.email}</li>
                                                <li class="list-group-item">FullName:${user.fullName}</li>
                                                <li class="list-group-item">Address: ${user.address}</li>
                                                <li class="list-group-item">Phone Number: ${user.phone}</li>
                                                <li class="list-group-item">Password: ${user.password}</li>


                                            </ul>
                                        </div>
                                        <a href="/admin/user " class="btn btn-success mt-3">Back </a>
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