<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-fluid " style="width:60%!important;">
	<div class="card">
       <div class="card-body">
            <h5 class="card-title text-center">이메일 전송됨</h5>
            <p class="card-text text-center text-muted">계정에 다시 로그인할 수 있는 링크가 포함된 이메일을 보내드렸습니다. 이메일을 확인해주세요.</p>
            
            <div class="text-center">
            <a href="login">확인</a>
            </div>
            
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>