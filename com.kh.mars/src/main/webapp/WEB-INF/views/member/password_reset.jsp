<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<form action="password_reset" method="post">
<div class="container-fluid " style="width:60%!important;">
        <div class="card  ">
            <div class="card-body">
                <div class="text-center mt-3 mb-3">
                <i class="fa-solid fa-lock fa-4x"></i>
                </div>
            <h5 class="card-title text-center">로그인에 문제가 있나요?</h5>
            <p class="card-text text-center text-muted">이메일 주소를 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다.</p>
            <div class="row form-floating mb-3">
                <input type="email" class="form-control member-email" id="floatingInput" placeholder="name@example.com" name="memberEmail">
                <label for="floatingInput">이메일 주소</label>
            </div>
            <div class="text-center">
            <button type="submit" class="btn btn-primary">로그인 링크 보내기</button>
            </div>
            </div>
            <div class="card-footer text-muted text-center">
            <a href="login">로그인으로 돌아가기</a>
            </div>
        </div>
    </div>
</form>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>