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
                <style>
                    .form-container {
                        max-width: 1000px;
                        /* Đặt chiều rộng tối đa của form */
                        width: 100%;
                    }

                    .form-row {
                        margin-bottom: 1rem;
                    }

                    .form-button-container {
                        display: flex;
                        justify-content: flex-end;
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
                                <ol class="breadcrumb mb-4" style="font-size: larger;">
                                    <p>Dashboard</p>
                                    <p>/ Create Product</p>
                                </ol>
                                <div class="d-flex justify-content-center">
                                    <div class="row w-100">
                                        <div class="col-md-10 form-container">
                                            <h2>Create Product</h2>
                                            <hr>
                                            <form:form method="post" action="/admin/product/create"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
                                                <div class="row mb-3">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorDetailDesc">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorShortDesc">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="col-md-6">

                                                        <form:label path="name" class="form-label">Tên</form:label>
                                                        <form:input path="name"
                                                            class="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                                                        ${errorName}

                                                    </div>
                                                    <div class="col-md-6">
                                                        <form:label path="price" class="form-label">Giá</form:label>
                                                        <form:input path="price"
                                                            class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                            type="number" />
                                                        ${errorPrice}

                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-md-4">
                                                        <form:label path="quantity" class="form-label">Số lượng
                                                        </form:label>
                                                        <form:input path="quantity"
                                                            class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                            type="number" />
                                                        ${errorQuantity}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <form:label path="factory" class="form-label">Hãng sản xuất
                                                        </form:label>
                                                        <form:select path="factory" class="form-select">
                                                            <form:option value="APPLE">Apple (MacBook)</form:option>
                                                            <form:option value="ASUS">Asus</form:option>
                                                            <form:option value="LENOVO">Lenovo</form:option>
                                                            <form:option value="DELL">Dell</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="ACER">Acer</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <form:label path="target" class="form-label">Target</form:label>
                                                        <form:select path="target" class="form-select">
                                                            <form:option value="GAMING">Gaming</form:option>
                                                            <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                            </form:option>
                                                            <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                            </form:option>
                                                            <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                            <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <form:label path="shortDesc" class="form-label">Mô tả ngắn gọn
                                                    </form:label>
                                                    <form:textarea path="shortDesc"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}" />
                                                    ${errorShortDesc}
                                                </div>
                                                <div class="mb-3">
                                                    <form:label path="detailDesc" class="form-label">Mô tả chi tiết
                                                    </form:label>
                                                    <form:textarea path="detailDesc"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                        rows="5" />
                                                    ${errorDetailDesc}
                                                </div>
                                                <div class="mb-3">
                                                    <label for="avatarFile" class="form-label">Image:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="hStoreFile" />
                                                </div>
                                                <div class="form-button-container d-flex justify-content-center">
                                                    <button type="submit" class="btn btn-primary">Create
                                                        Product</button>
                                                    <a href="${pageContext.request.contextPath}/admin/product"
                                                        class="btn btn-secondary" style="margin-left: 20px;">Cancel</a>
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