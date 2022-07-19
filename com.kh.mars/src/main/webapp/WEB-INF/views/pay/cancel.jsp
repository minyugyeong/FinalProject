<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.title{
		color: #eb6864;
	}
</style>

<div class="container w-100">
	
	<div class="row text-center mt-5 ">
		<div class="col">
			<h2 class="title">결제가 취소되었습니다.</h2>
		</div>
	</div>
	
	<div class="row mt-5"></div>
	
	<div class="row text-center">
		<div class="col">
			<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/member/ad?memberNo=${login}">
				신청 목록으로 돌아가기
			</a>
		</div>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>