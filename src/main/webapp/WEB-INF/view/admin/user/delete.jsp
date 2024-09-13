<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="/css/style.css" rel="stylesheet" />
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese:wght@400;700&display=swap"
                rel="stylesheet">
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Delete User </title>
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
                                <p>/ Delete User</p>
                            </ol>

                        </div>
                        <div class="container mt-5" style="margin-left: 50px;">
                            <div class="col-12 mx-auto">
                                <h2>Delete User ID: ${user.id}</h2>
                                <p>Are you sure to delete this user?</p>
                                <form action="${pageContext.request.contextPath}/admin/user/delete" method="post">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <button type="submit" class="btn btn-danger">Confirm</button>
                                    <a href="${pageContext.request.contextPath}/admin/user"
                                        class="btn btn-secondary">Cancel</a>
                                </form>
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