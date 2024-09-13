<!-- <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Vietnamese:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Latest compiled JavaScript -->
<!-- <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp"/>
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp"/>
        <div id="layoutSidenav_content">
            <main>
                
                <div class="container-fluid px-4 mt-3">
                   
                    <ol class="breadcrumb mb-4">
        
                        <a href="/admin" style="text-decoration: none; color: black;">Dashboard </a> 
                        <a href="/admin/user" style="text-decoration: none; color: black;"> / User </a> 

                    </ol>
                </div>
                <div class="container mt-5">
                    <div class="col-12 mx-auto">
                    <div class="d-flex justify-content-between">
                        <h2>Table user</h2>
                        <a href="user/create" class="btn btn-primary">Create table</a>
                    </div>
                    
                <table class="table mt-3">
                    <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users1}">
                            
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.email}</td>
                                <td>${user.fullName}</td>
                                <td>
                                    <a href="/admin/user/${user.id}" class="btn btn-info btn-sm">View</a>
                                    <a href="/admin/user/update/${user.id}" class="btn btn-warning btn-sm">Update</a>
            
                                    <form action="${pageContext.request.contextPath}/admin/user/delete" method="get" style="display:inline;">
                                        <input type="hidden" name="id" value="${user.id}">
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                    
            
                                </td>
                            </tr>
                          
                        </c:forEach>
                   
                    </tbody>
                </table>
            </main>
            
            <jsp:include page="../layout/footer.jsp"/>
        </div>
        
         </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="/js/script.js"></script>
</body>
   

</html> --> -->