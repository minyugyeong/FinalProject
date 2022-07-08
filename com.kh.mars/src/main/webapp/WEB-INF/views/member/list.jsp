<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.title{
    font-size: xx-large;
    color: #eb6864;
    text-align: center;
    font-weight: bold;
  }
  
  .btn-primary {
    color: #fff;
    background-color: #eb6864;
    border-color: #eb6864;
    width: 120px;
	}
	
	.btn-secondary {
    color: #fff;
    background-color: #aaa;
    border-color: #aaa;
    width: 120px;
	}
	
	.aLink{
		text-decoration: none;
		color: black;
		display: block;
	}
	

</style>

<div class="container" style="width: 1000px;">
	
	<div class="row-mt-5 mt-2">
		<div class="col-md-6 offset-md-3">
			<div class="title">회원 관리</div>
		</div>
	</div>
	
	<div class="row mb-5"></div>
	
	<!-- 검색 영역 -->
	<form method="get">
		
		<fieldset>
			<div class="row">
				
				<div class="col">
					<input type="text" name="memberNick" placeholder="닉네임" class="form-control" autocomplete="off">
				</div>
				
				<div class="col">
					<input type="text" name="memberEmail" placeholder="이메일" class="form-control" autocomplete="off">
				</div>
				
				<div class="col">
					<input type="text" name="memberName" placeholder="이름" class="form-control" autocomplete="off">
				</div>
				
				<div class="col">
					<input type="text" name="memberPhone" placeholder="전화번호" class="form-control" autocomplete="off">
				</div>
				
				<div class="col">
					<select name="memberGender" class="form-select">
						<option value="none" class="form-select" style="display:none;">성별</option>
						<option value="0">남성</option>
						<option value="1">여성</option>
					</select>
				</div>
				
				<div class="col">
					<select name="memberInterest" class="form-select">
						<option value="none" style="display:none;">관심사</option>
						<option value="예술">예술</option>
						<option value="패션">패션</option>
						<option value="요리">요리</option>
						<option value="스포츠">스포츠</option>
						<option value="뷰티">뷰티</option>
						<option value="여행">여행</option>
					</select>
				</div>
				
				<div class="col">
					<select name="memberGrade" class="form-select">
						<option value="none" class="form-select" style="display:none;">등급</option>
						<option value="일반회원">일반회원</option>
						<option value="비즈니스회원">비즈니스회원</option>
						<option value="관리자">관리자</option>
					</select>
				</div>
				
				<div class="col">
					<input type="submit" value="검색" class="btn btn-primary">
				</div>
				
			</div>
		</fieldset>
		
		<div class="row mb-3"></div>
		
	</form>
	
	<!-- 리스트 영역 -->
	<div class="row-mt-5">
		<div class="col">
			<table class="table table-hover border" style="width: 100%;">
			
				<thead>
					<tr class="text-center">
						<th>번호</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>관심사</th>
						<th>등급</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="list" items="${list}">
						<tr class="text-center align-middle">
							<td><a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">${list.memberNo}</a></td>
							<td><a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">${list.memberNick}</a></td>
							<td><a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">${list.memberEmail}</a></td>
							<td><a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">${list.memberName}</a></td>
							<td><a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">${list.memberPhone}</a></td>
							
							<td>
								<a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">
								<c:choose>
									<c:when test="${list.memberGender == 0}">남성</c:when>
									<c:otherwise>여성</c:otherwise>
								</c:choose>
								</a>
							</td>
							
							<td>
								<a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">
								<c:choose>
									<c:when test="${list.memberInterest == null}">X</c:when>
									<c:otherwise>${list.memberInterest}</c:otherwise>
								</c:choose>
								</a>
							</td>
							
							<td><a class="aLink" href="${pageContext.request.contextPath}/member/page?memberNo=${list.memberNo}">${list.memberGrade}</a></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>
	
</div>









