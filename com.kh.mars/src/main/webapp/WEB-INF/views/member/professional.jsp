<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container-fluid" style="width:70%!important;">
<form action="professional" method="post">
	<div class="card text-center">
	  <div class="card-header">

		  <i class="fa-solid fa-store fa-2x"></i>
		  
		    <h2>비즈니스</h2>
		  
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">카테고리 선택</h5>
	    <p class="card-text text-muted">
	    광고 노출을 위한 카테고리를 선택해주세요.
	   	비즈니스 계정 등록 시 광고 게시글 신청이 가능합니다.
	    </p>
	    
	    
            <select class="form-select" id="interest" name="memberInterest">
                <option value="" <c:if test="${memberDto.memberInterest == null }">selected</c:if>>선택</option>
                <option <c:if test="${memberDto.memberInterest == '예술' }">selected</c:if>>예술</option>
                <option <c:if test="${memberDto.memberInterest == '패션' }">selected</c:if>>패션</option>
                <option <c:if test="${memberDto.memberInterest == '요리' }">selected</c:if>>요리</option>
                <option <c:if test="${memberDto.memberInterest == '스포츠' }">selected</c:if>>스포츠</option>
                <option <c:if test="${memberDto.memberInterest == '뷰티' }">selected</c:if>>뷰티</option>
                <option <c:if test="${memberDto.memberInterest == '여행' }">selected</c:if>>여행</option>
            </select>
                    

	  </div>
	  <div class="card-footer">
	    
			<button type="button" class="btn btn-primary next" >
			  완료
			</button>

	  </div>
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비즈니스 계정으로 전환하시겠어요?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        비즈니스 계정으로 전환하면 계정이 전체공개로 설정됩니다. 누구나 회원님의 콘텐츠를 볼 수 있으며 대기 중인 팔로우 요청이 모두 승인됩니다.
      </div>
      
	  <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" style="width:100%">전환하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width:100%">취소</button>
	  </div>  
	      
    </div>
  </div>
</div>
</form>
</div>

<script>

	$(".next").click(function(){
		
		if($("#interest").val() == "" ){
			alert("카테고리를 선택해주세요.");
		}
		else{
			$('#exampleModal').modal('show'); 
		}
		
	});
	
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>