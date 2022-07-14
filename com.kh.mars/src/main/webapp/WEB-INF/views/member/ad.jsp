<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.title{
    font-size: xx-large;
    color: #eb6864;
    text-align: center;
    font-weight: bold;
  }
  
  td {
 		max-width: 0;
 		overflow: hidden;
 		text-overflow: ellipsis;
 		white-space: nowrap;
	}
	
	.fa-angle-down{
		cursor: pointer;
	}
  
  
</style>

<script type="text/javascript">

	$(function(){
		
		$(".fa-angle-down").click(function(){
			
			let currentRow = $(this).closest('tr');
			let detail = currentRow.next('tr');
			
			if(detail.is(":visible")){
				detail.hide();
			} else {
				detail.show();
			}
			
		});
		
	});

</script>

<div id="app" class="container" style="width: 1000px;">
	<div class="row-mt-5 mt-2">
		<div class="col-md-6 offset-md-3">
			<div class="title">광고 신청 목록</div>
		</div>
	</div>
	
	<div class="row mb-5"></div>
	
	<div class="accordion">
		<div class="row">
			<div class="col">
				<table class="table table-hover border" id="page" style="width: 100%;">
					
					<thead class="table-light">
						<tr class="text-center">
							<th>번호</th>
							<th>노출횟수</th>
							<th>가격</th>
							<th>신청일</th>
							<th>진행현황</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody>
						<c:set var="lengthList" value="${fn:length(list)}"></c:set>
						<c:forEach var="list" items="${list}" varStatus="status">
							<tr class="text-center align-middle">
								<td>${lengthList - status.index}</td>
								<td>${list.boardAdCount}</td>
								<td>${list.boardAdPrice}</td>
								<td>${list.boardAdDate}</td>
								<td v-if="${list.boardAdCheck == '결제 대기'}">
								<form action="${pageContext.request.contextPath}/pay_purchase" method="post">
									<input type="hidden" name="boardAdNo" value="${list.boardAdNo}">
									<input type="hidden" name="quantity" value="1">
									<input type="submit" value="결제하기" class="btn btn-primary btn-sm">
								</form>
								</td>
								<td v-else>${list.boardAdCheck}</td>
								<td><i class="fa-solid fa-angle-down"></i></td>
							</tr>
							
							
							<tr style="display:none;">
								<td colspan="3" style="padding: 0 0 0 50px;">
									<c:forEach var="boardAdAttachDto" items="${list.attachNoList}">
										<img src="${pageContext.request.contextPath}/file/download/${boardAdAttachDto.attachNo}" style="height: 110px; width: 85px;">									
									</c:forEach>
								</td>
								<td colspan="3">&middot;&nbsp;내용 : ${list.boardAdContent}<br>&middot;&nbsp;링크 : ${list.boardAdLink}</td>
							</tr>
							
						</c:forEach>
					</tbody>
					
				</table>
			</div>
			
		</div>
	</div>
	
	<!-- 페이지네이션 -->
	<div class="row pagination">
	
		<ul class="pagination justify-content-center">
			
			<!-- 이전 버튼 -->
			<li class="page-item">
				<c:if test="${p > 1}">
					<a class="page-link" href="${pageContext.request.contextPath}/member/ad?memberNo=${param.memberNo}&p=1&s=${s}">&laquo;</a>
				</c:if>
			</li>
			
			<li class="page-item">
				<c:if test="${startBlock > 1}">
					<a class="page-link" href="${pageContext.request.contextPath}//member/ad?memberNo=${param.memberNo}&p=${startBlock-1}&s=${s}">&lt;</a>
				</c:if>
			</li>
			
			<!-- 숫자 링크 -->
			<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
				
				<c:choose>
					<c:when test="${i == p}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/member/ad?memberNo=${param.memberNo}&p=${i}&s=${s}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/member/ad?memberNo=${param.memberNo}&p=${i}&s=${s}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			
			<!-- 다음 버튼 -->
			<li class="page-item">
				<c:if test="${endBlock < lastPage}">
					<a class="page-link" href="${pageContext.request.contextPath}/member/ad?memberNo=${param.memberNo}&p=${endBlock+1}&s=${s}">&gt;</a>	
				</c:if>
			</li>
			
			<li class="page-item">
				<c:if test="${p < lastPage}">
					<a class="page-link" href="${pageContext.request.contextPath}/member/ad?memberNo=${param.memberNo}&p=${lastPage}&s=${s}">&raquo;</a>
				</c:if>
			</li>
			
		</ul>
		
	</div>
	
</div>

<script>
 
 const app = Vue.createApp({
   
   data(){
     return {
    	 
     };
   },

   //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
   //- 3줄보다 많다면 사용하지 않는 것을 권장한다.(복잡한 계산 시 성능 저하가 발생)
   computed:{
     
   },

   //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
   methods:{
    
   },

   //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다.
   watch:{
     
   },

 });
 app.mount("#app");
  </script>



