<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FilmViet - Quên mật khẩu</title>
    <%@ include file="/views/common/head.jsp" %>
</head>

<body>
<%@ include file="/views/common/header.jsp" %>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg"
         data-setbg="views/template/user/img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Quên Mật Khẩu</h2>
                    <p>Chào Mừng Bạn Đến Blog Chính Thức Của FilmViet.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card-forgot card p-3 mb-4 rounded-0"
                     style="color: grey;">
                    <h3 class="mb-2" style="font-weight: 700; color: grey;">Quên
                        Mật Khẩu ?</h3>
                    <p class="mb-3">thay đổi mật khẩu của bạn trong ba bước đơn
                        giản. Điều này sẽ giúp bạn bảo mật mật khẩu của bạn.</p>

                    <div class="step_form" style="color: grey;">
                        <p>
                            <strong><Strong class="text-info">1</Strong> .Nhập địa
                                chỉ Email của bạn. Hệ thống của sẽ gửi cho bạn một mã OTP vào
                                email của bạn.</strong> <br> <Strong class="text-info">2</Strong>
                            .Nhập mã OTP đã nhận được ở email của bạn. <br> <Strong
                                class="text-info">3</Strong> .Tạo một mật khẩu mới.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-12 col-lg-12">
                <div class="card-forgot card p-3 rounded-0" style="color: grey;">
                    <div class="step_form" style="color: grey;">
                        <form onsubmit="return validateForgotPass()" action="forgotpass"
                              method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Địa chỉ email</label> <input
                                    type="email" class="form-control" name="email" id="email">
                                <small id="helpId" class="form-text text-muted">Nhập
                                    địa chỉ email bạn đã đăng ký. Sau đó hệ thống sẽ gửi cho bạn
                                    một mã OTP vào email</small>

                            </div>
                            <hr>
                            <button type="submit" id="submitForgotpass"
                                    class="btn btn-success rounded-0 p-2 ps-4 px-4 fw-bold text-white">
                                TIẾP TỤC
                            </button>
                            <a type="button" href="login"
                               class="btn btn-danger rounded-0 p-2 ps-4 px-4 fw-bold  text-white"
                               role="button">TRỞ LẠI</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Forgotpass Section End -->

<%@ include file="/views/common/footer.jsp" %>

<script type="text/javascript">
    function validateForgotPass() {
        var emailRegex = /\b[\w.%-]+@[-.\w]+\.[A-Za-z]{2,4}\b/;
        var email = document.getElementsByName("email")[0].value;

        if (email == "") {
            showSwalAlert('error', 'Vui lòng nhập địa chỉ Email !');
            return false;
        }

        if (!emailRegex.test(email)) {
            showSwalAlert('error', 'Địa chỉ Email không đúng định dạng !');
            return false;
        }

        document.getElementById("submitForgotpass").disabled = true;

        return true;
    }
</script>

<%
    if (session.getAttribute("existEmail") != null && (boolean) session.getAttribute("existEmail")) {
%>
<script>
    showCenterAlert('error', 'Thất bại !', 'Email không tồn tại trong cơ sở dữ liệu !');
</script>
<%
    }
    session.removeAttribute("existEmail");

    if (session.getAttribute("userFalse") != null && (boolean) session.getAttribute("userFalse")) {
%>
<script>
    showCenterAlert('error', 'Thất bại !', 'Email không hoạt động vui lòng liên hệ admin !');
</script>
<%
    }
    session.removeAttribute("userFalse");
%>

</body>

</html>