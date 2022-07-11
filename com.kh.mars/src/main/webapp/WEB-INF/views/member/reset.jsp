<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-fluid mt-5" style="width:40%!important;">
	<form action="reset" method="post">
	<input type="hidden" name="cert" value="${cert}">
 	<input type="hidden" name="memberEmail" value="${param.memberEmail}">
        <div class="card">
            <div class="card-body">
            <h5 class="card-title text-center mt-5">비밀번호 재설정</h5>
            <p class="card-text text-center text-muted mt-3">비밀번호는 영문 대/소문자, 특수문자, 숫자가 반드시 포함된 8~16자로 입력해야합니다</p>
            <div class="row form-floating mb-3">
                <input type="password" class="form-control" id="floatingInput" placeholder="name@example.com" name="memberPassword">
                <label for="floatingInput">새 비밀번호</label>
            </div>
            <div class="row form-floating mb-3">
                <input type="password" class="form-control" id="floatingInput" placeholder="name@example.com" name="memberPasswordCheck">
                <label for="floatingInput">새 비밀번호 다시입력</label>
            </div>
            <div class="text-center">
            <button class="btn btn-primary">비밀번호 재설정</button>
            </div>
            </div>
        </div>
    </form>
</div>

<script>

</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>