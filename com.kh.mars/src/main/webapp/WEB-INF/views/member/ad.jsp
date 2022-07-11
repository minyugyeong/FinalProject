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
  
  
</style>

<div class="container" style="width: 1000px;">
	<div class="row-mt-5 mt-2">
		<div class="col-md-6 offset-md-3">
			<div class="title">광고 신청 목록</div>
		</div>
	</div>
	
	<div class="row mb-5"></div>
	
	<div class="accordion">
		<div class="row">
			<div class="col">
				<table class="table table-hover border" style="width: 100%;">
					
					<thead>
						<tr class="text-center">
							<th>번호</th>
							<th>노출횟수</th>
							<th>가격</th>
							<th>신청일</th>
							<th>진행현황</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="status">
							<tr class="text-center align-middle">
								<td>${status.count}</td>
								<td>${list.boardAdCount}</td>
								<td>${list.boardAdPrice}</td>
								<td>${list.boardAdDate}</td>
								<td>${list.boardAdCheck}</td>
							</tr>
							
							<%-- <tr>
								<td colspan="4">
									<c:forEach var="listAttach" items="${listAttach}">
										<img src="${pageContext.request.contextPath}/file/download/${listAttach.attachNo}" class="d-block w-100" style="height: 480px;">
									</c:forEach>
								</td>
								<td colspan="1">ㅎㅎ</td>
							</tr> --%>
							
						</c:forEach>
					</tbody>
					
				</table>
			</div>
			
		</div>
	</div>
</div>