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
    width: 200px;
	}
	
	.btn-secondary {
    color: #fff;
    background-color: #aaa;
    border-color: #aaa;
    width: 200px;
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
					<input type="text" name="memberNick" placeholder="닉네임" class="form-control" autocomplete="off" value="${param.memberNick}">
				</div>
				
				<div class="col">
					<input type="text" name="memberEmail" placeholder="이메일" class="form-control" autocomplete="off" value="${param.memberEmail}">
				</div>
				
				<div class="col">
					<input type="text" name="memberName" placeholder="이름" class="form-control" autocomplete="off" value="${param.memberName}">
				</div>
				
				<div class="col">
					<input type="text" name="memberPhone" placeholder="전화번호" class="form-control" autocomplete="off" value="${param.memberPhone}">
				</div>
				
				<div class="col">
					<select name="memberGender" class="form-select">
						<option value="" class="form-select" style="display:none;">성별</option>
						<option value="0" <c:if test="${param.memberGender == '0'}">selected</c:if>>남성</option>
						<option value="1" <c:if test="${param.memberGender == '1'}">selected</c:if>>여성</option>
					</select>
				</div>
				
				<div class="col">
					<select name="memberInterest" class="form-select">
						<option value="" style="display:none;">관심사</option>
						<option value="예술" <c:if test="${param.memberInterest == '예술'}">selected</c:if>>예술</option>
						<option value="패션" <c:if test="${param.memberInterest == '패션'}">selected</c:if>>패션</option>
						<option value="요리" <c:if test="${param.memberInterest == '요리'}">selected</c:if>>요리</option>
						<option value="스포츠" <c:if test="${param.memberInterest == '스포츠'}">selected</c:if>>스포츠</option>
						<option value="뷰티" <c:if test="${param.memberInterest == '뷰티'}">selected</c:if>>뷰티</option>
						<option value="여행" <c:if test="${param.memberInterest == '여행'}">selected</c:if>>여행</option>
					</select>
				</div>
				
				<div class="col">
					<select name="memberGrade" class="form-select">
						<option value="" class="form-select" style="display:none;">등급</option>
						<option value="일반회원" <c:if test="${param.memberGrade == '일반회원'}">selected</c:if>>일반회원</option>
						<option value="비즈니스회원" <c:if test="${param.memberGrade == '비즈니스회원'}">selected</c:if>>비즈니스회원</option>
						<option value="관리자" <c:if test="${param.memberGrade == '관리자'}">selected</c:if>>관리자</option>
					</select>
				</div>
				
			</div>
			
			<div class="row mt-2 mb-2">
			
				<div class="col-3"></div>
				
				<div class="col-2">
					<input type="submit" value="검색" class="btn btn-primary">
				</div>
				
				<div class="col-2"></div>
				
				<div class="col-2">
					<a href="${pageContext.request.contextPath}/member/list" class="btn btn-secondary">초기화</a>
				</div>
				
				<div class="col-3"></div>
				
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
	
	<!-- 페이지네이션 -->
	<div class="row pagination">
	
		<ul class="pagination justify-content-center">
			
			<!-- 이전 버튼 -->
			<li class="page-item">
				<c:if test="${p > 1}">
					<c:choose>
						<c:when test="${param.memberNick ne null || param.memberEmail ne null || param.memberName ne null || param.memberPhone ne null || param.memberGender ne null || param.memberInterest ne null || param.memberGrade ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=1&s=${s}&memberNick=${param.memberNick}&memberEmail=${param.memberEmail}&memberName=${param.memberName}
							&memberPhone=${param.memberPhone}&memberGender=${param.memberGender}&memberInterest=${param.memberInterest}&memberGrade=${param.memberGrade}">&laquo;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=1&s=${s}">&laquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
			<li class="page-item">
				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${param.memberNick ne null || param.memberEmail ne null || param.memberName ne null || param.memberPhone ne null || param.memberGender ne null || param.memberInterest ne null || param.memberGrade ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${startBlock-1}&s=${s}&memberNick=${param.memberNick}&memberEmail=${param.memberEmail}&memberName=${param.memberName}
							&memberPhone=${param.memberPhone}&memberGender=${param.memberGender}&memberInterest=${param.memberInterest}&memberGrade=${param.memberGrade}">&lt;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${startBlock-1}&s=${s}">&lt;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
			<!-- 숫자 링크 -->
			<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
				<c:choose>
				
					<c:when test="${param.memberNick ne null || param.memberEmail ne null || param.memberName ne null || param.memberPhone ne null || param.memberGender ne null || param.memberInterest ne null || param.memberGrade ne null}">
						<c:choose>
							<c:when test="${i == p}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${i}&s=${s}&memberNick=${param.memberNick}&memberEmail=${param.memberEmail}&memberName=${param.memberName}
							&memberPhone=${param.memberPhone}&memberGender=${param.memberGender}&memberInterest=${param.memberInterest}&memberGrade=${param.memberGrade}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${i}&s=${s}&memberNick=${param.memberNick}&memberEmail=${param.memberEmail}&memberName=${param.memberName}
							&memberPhone=${param.memberPhone}&memberGender=${param.memberGender}&memberInterest=${param.memberInterest}&memberGrade=${param.memberGrade}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:when>
					
					<c:otherwise>
						<c:choose>
							<c:when test="${i == p}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${i}&s=${s}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${i}&s=${s}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>

				</c:choose>
				
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<li class="page-item">
				<c:if test="${endBlock < lastPage}">
					<c:choose>
						<c:when test="${param.memberNick ne null || param.memberEmail ne null || param.memberName ne null || param.memberPhone ne null || param.memberGender ne null || param.memberInterest ne null || param.memberGrade ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${endBlock+1}&s=${s}&memberNick=${param.memberNick}&memberEmail=${param.memberEmail}&memberName=${param.memberName}
							&memberPhone=${param.memberPhone}&memberGender=${param.memberGender}&memberInterest=${param.memberInterest}&memberGrade=${param.memberGrade}">&gt;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${endBlock+1}&s=${s}">&gt;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
			<li class="page-item">
				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${param.memberNick ne null || param.memberEmail ne null || param.memberName ne null || param.memberPhone ne null || param.memberGender ne null || param.memberInterest ne null || param.memberGrade ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${lastPage}&s=${s}&memberNick=${param.memberNick}&memberEmail=${param.memberEmail}&memberName=${param.memberName}
							&memberPhone=${param.memberPhone}&memberGender=${param.memberGender}&memberInterest=${param.memberInterest}&memberGrade=${param.memberGrade}">&raquo;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/member/list?p=${lastPage}&s=${s}">&raquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
		</ul>
		
	</div>
	
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>








