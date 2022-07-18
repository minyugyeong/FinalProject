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
	
/* 	$(".change").click(function(){
		
		let currentRow = $(this).closest('span');
		let detail = currentRow.next('span');
		
		currentRow.hide();
		detail.show();
	});
	
	$(".cancel").click(function(){

		let currentRow = $(this).closest('span');
		let detail = currentRow.prev('span');
		
		currentRow.hide();
		detail.show();
	}); */
	
});


</script>

<div id="app" class="container" style="width: 1500px;">
	<div class="row-mt-5 mt-2">
		<div class="col-md-6 offset-md-3">
			<div class="title">광고 신청 목록</div>
		</div>
	</div>
	
	<div class="row mb-5"></div>
	
	<!-- 검색 영역 -->
	<form method="get">
		
		<div class="row">
			
			<div class="row mb-1">
				<div class="col-6">
					<input type="text" name="memberEmail" placeholder="이메일" class="form-control" autocomplete="off" value="${param.memberEmail}">
				</div>
				<div class="col-6">
					<select name="memberInterest" class="form-select">
						<option value="" style="display:none;">분야</option>
						<option value="예술" <c:if test="${param.memberInterest == '예술'}">selected</c:if>>예술</option>
						<option value="패션" <c:if test="${param.memberInterest == '패션'}">selected</c:if>>패션</option>
						<option value="요리" <c:if test="${param.memberInterest == '요리'}">selected</c:if>>요리</option>
						<option value="스포츠" <c:if test="${param.memberInterest == '스포츠'}">selected</c:if>>스포츠</option>
						<option value="뷰티" <c:if test="${param.memberInterest == '뷰티'}">selected</c:if>>뷰티</option>
						<option value="여행" <c:if test="${param.memberInterest == '여행'}">selected</c:if>>여행</option>
					</select>
				</div>
			</div>
			
			<div class="row mb-1">
			
				<div class="col-6">
					<div class="row">
						<div class="col-5">
							<input type="number" name="minCount" placeholder="노출횟수" class="form-control" autocomplete="off" min="0" step="1000" value="${param.minCount}">
						</div>
						<div class="col-2 text-center" style="font-size: x-large; font-weight: bold;">~</div>
						<div class="col-5">
							<input type="number" name="maxCount" placeholder="노출횟수" class="form-control" autocomplete="off" min="0" step="1000" value="${param.maxCount}">
						</div>
					</div>
				</div>
				
				<div class="col-6">
					<div class="row">
						<div class="col-5">
							<input type="number" name="minPrice" placeholder="가격" class="form-control" autocomplete="off" min="0" step="10000" value="${param.minPrice}">
						</div>
						<div class="col-2 text-center" style="font-size: x-large; font-weight: bold;">~</div>
						<div class="col-5">
							<input type="number" name="maxPrice" placeholder="가격" class="form-control" autocomplete="off" min="0" step="10000" value="${param.maxPrice}">
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="row mb-2">
				<div class="col-6">
					<div class="row">
						<div class="col-5">
							<input type="date" name="beginDate" placeholder="신청일" class="form-control" autocomplete="off" value="${param.beginDate}">
						</div>
						<div class="col-2 text-center" style="font-size: x-large; font-weight: bold;">~</div>
						<div class="col-5">
							<input type="date" name="endDate" placeholder="신청일" class="form-control" autocomplete="off" value="${param.endDate}">
						</div>
					</div>
				</div>
				<div class="col-6">
					<select name="boardAdCheck" class="form-select">
						<option value="" style="display:none;">진행현황</option>
						<option value="신청 완료" <c:if test="${param.boardAdCheck == '신청 완료'}">selected</c:if>>신청 완료</option>
						<option value="결제 대기" <c:if test="${param.boardAdCheck == '결제 대기'}">selected</c:if>>결제 대기</option>
						<option value="광고 진행" <c:if test="${param.boardAdCheck == '광고 진행'}">selected</c:if>>광고 진행</option>
						<option value="광고 마감" <c:if test="${param.boardAdCheck == '광고 마감'}">selected</c:if>>광고 마감</option>
						<option value="신청 반려" <c:if test="${param.boardAdCheck == '신청 반려'}">selected</c:if>>신청 반려</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-6  text-center">
					<button class="btn btn-primary" style="width: 70%">검색</button>
				</div>
				<div class="col-6  text-center">
					<a class="btn btn-secondary" style="width: 70%" href="${pageContext.request.contextPath}/admin/boardAdList">초기화</a>
				</div>
			</div>
		
		</div>
		
		<div class="row mb-4"></div>
		
	</form>
	
	<!-- 리스트 영역 -->
	
		<div class="row">
			<div class="col">
				<table class="table table-hover border" style="width: 100%;">
					
					<thead class="table-light">
						<tr class="text-center">
							<th>번호</th>
							<th>신청자</th>
							<th>분야</th>
							<th>노출횟수</th>
							<th>가격</th>
							<th>신청일</th>
							<th>진행현황</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="status">
							<tr class="text-center align-middle">
								<td width="10%">${list.boardAdNo}</td>
								<td>${list.memberEmail}</td>
								<td width="10%">${list.memberInterest}</td>
								<td width="10%">${list.boardAdCount}</td>
								<td width="10%">${list.boardAdPrice}</td>
								<td width="15%">${list.boardAdDate}</td>
								<td>
									<c:choose>
										<c:when test="${list.boardAdCheck == '신청 완료'}">
											<span class="first">
												${list.boardAdCheck}&nbsp;
												
												<button class="btn btn-primary btn-sm change" style="margin-left: 2px;" @click="editCheckFirst(${list.boardAdNo})">승인</button>
												<button class="btn btn-secondary btn-sm change" style="margin-left: 2px;" @click="editCheckSecond(${list.boardAdNo})">반려</button>
											</span>										
										</c:when>
										<c:otherwise>
											${list.boardAdCheck}
										</c:otherwise>
									</c:choose>
	
								</td>

								<td><i class="fa-solid fa-angle-down"></i></td>
							</tr>
						
						
							<tr style="display: none;">
								<td colspan="4" style="padding: 0 0 0 120px;">
									<c:forEach var="boardAdAttachDto" items="${list.attachNoListAdmin}">
										<img src="${pageContext.request.contextPath}/file/download/${boardAdAttachDto.attachNo}" style="height: 110px; width: 85px;">									
									</c:forEach>									
								</td>
								<td colspan="4">&middot;&nbsp;내용 : ${list.boardAdContent}<br>&middot;&nbsp;링크 : ${list.boardAdLink}</td>
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
						<c:when test="${param.memberEmail ne null || param.memberInterest ne null || param.minCount > 0 || param.maxCount > 0 || param.minPrice > 0 || param.maxPrice > 0 || param.beginDate ne null || param.endDate ne null || param.boardAdCheck ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=1&s=${s}&memberEmail=${param.memberEmail}&memberInterest=${param.memberInterest}&minCount=${param.minCount}
							&maxCount=${param.maxCount}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&beginDate=${param.beginDate}&endDate=${param.endDate}&boardAdCheck=${param.boardAdCheck}">&laquo;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=1&s=${s}">&laquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
			<li class="page-item">
				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${param.memberEmail ne null || param.memberInterest ne null || param.minCount > 0 || param.maxCount > 0 || param.minPrice > 0 || param.maxPrice > 0 || param.beginDate ne null || param.endDate ne null || param.boardAdCheck ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${startBlock-1}&s=${s}&memberEmail=${param.memberEmail}&memberInterest=${param.memberInterest}&minCount=${param.minCount}
							&maxCount=${param.maxCount}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&beginDate=${param.beginDate}&endDate=${param.endDate}&boardAdCheck=${param.boardAdCheck}">&lt;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${startBlock-1}&s=${s}">&lt;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
			<!-- 숫자 링크 -->
			<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
				<c:choose>
				
					<c:when test="${param.memberEmail ne null || param.memberInterest ne null || param.minCount > 0 || param.maxCount > 0 || param.minPrice > 0 || param.maxPrice > 0 || param.beginDate ne null || param.endDate ne null || param.boardAdCheck ne null}">
						<c:choose>
							<c:when test="${i == p}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${i}&s=${s}&memberEmail=${param.memberEmail}&memberInterest=${param.memberInterest}&minCount=${param.minCount}
							&maxCount=${param.maxCount}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&beginDate=${param.beginDate}&endDate=${param.endDate}&boardAdCheck=${param.boardAdCheck}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${i}&s=${s}&memberEmail=${param.memberEmail}&memberInterest=${param.memberInterest}&minCount=${param.minCount}
							&maxCount=${param.maxCount}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&beginDate=${param.beginDate}&endDate=${param.endDate}&boardAdCheck=${param.boardAdCheck}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:when>
					
					<c:otherwise>
						<c:choose>
							<c:when test="${i == p}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${i}&s=${s}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${i}&s=${s}">${i}</a>
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
						<c:when test="${param.memberEmail ne null || param.memberInterest ne null || param.minCount > 0 || param.maxCount > 0 || param.minPrice > 0 || param.maxPrice > 0 || param.beginDate ne null || param.endDate ne null || param.boardAdCheck ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${endBlock+1}&s=${s}&memberEmail=${param.memberEmail}&memberInterest=${param.memberInterest}&minCount=${param.minCount}
							&maxCount=${param.maxCount}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&beginDate=${param.beginDate}&endDate=${param.endDate}&boardAdCheck=${param.boardAdCheck}">&gt;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${endBlock+1}&s=${s}">&gt;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
			<li class="page-item">
				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${param.memberEmail ne null || param.memberInterest ne null || param.minCount > 0 || param.maxCount > 0 || param.minPrice > 0 || param.maxPrice > 0 || param.beginDate ne null || param.endDate ne null || param.boardAdCheck ne null}">
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${lastPage}&s=${s}&memberEmail=${param.memberEmail}&memberInterest=${param.memberInterest}&minCount=${param.minCount}
							&maxCount=${param.maxCount}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&beginDate=${param.beginDate}&endDate=${param.endDate}&boardAdCheck=${param.boardAdCheck}">&raquo;</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageContext.request.contextPath}/admin/boardAdList?p=${lastPage}&s=${s}">&raquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</li>
			
		</ul>
		
	</div>

</div>

<script>
  //div[id=app]을 제어할 수 있는 Vue instance를 생성
  const app = Vue.createApp({
    //data 영역 : 화면을 구현하는데 필요한 데이터를 작성해둔다.
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
    	
    	editCheckFirst(no){
    		
    		let result = confirm('해당 게시물을 승인하시겠습니까?');
    		if(result){
	    		axios({
	    			url: "${pageContext.request.contextPath}/admin/boardAdList/first",
	    			method: "put",
	    			params: {
	    				boardAdNo: no,
	    			},
	    		})
	    		.then(resp=>{
	    			location.replace('${pageContext.request.contextPath}/admin/boardAdList');	
	    		});
    		}
    	},
    	
    	editCheckSecond(no){
    		
    		let result = confirm('해당 게시물의 신청을 반려하시겠습니까?');
    		if(result){
    			axios({
    				url: "${pageContext.request.contextPath}/admin/boardAdList/second",
    				method: "put",
    				params: {
    					boardAdNo: no,
    				},
    			})
    			.then(resp=>{
    				location.replace('${pageContext.request.contextPath}/admin/boardAdList');
    			});
    		}
    	},
    	
    	
     
    },

    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다.
    watch:{
      
    },
    
		created(){
    	
    }
  });
  app.mount("#app");
</script>



