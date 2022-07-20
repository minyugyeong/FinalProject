<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.div-center {
		display: inline-block;
		text-align: center;
	}

	.img {
		
		width: 45px;
		height: 45px;
		
	}
	
	.img.img-circle {
		border-radius: 50%;
	}
	
	
	textarea {
    border: none;
    resize: none;
  }
  
  .left {
  	text-align: left;
  	vertical-align: middle;
  }
  
  .right{
  	text-align: right;
  	vertical-align: middle;
  }
  
  .input-upload{
	  padding: 10px 30px;
	  background-color:#eb6864;
	  border-radius: 4px;
	  color: white;
	  cursor: pointer;
	}
	
	.input-uploadPlus{
		padding: 10px 30px;
	  background-color:white;
	  border-radius: 4px;
	  color: #eb6864;
	  cursor: pointer;
	  
	}
	
	.form-switch{
		padding: 0em;
	}
	
	.ppp{
		position: relative;
	}
	
	.xxx{
		position: absolute;
		top: 100px;
		right: 80px;
		z-index: 999;
	}
	
	.file-preview-container {
    height: 100%;
    display: flex;
    flex-wrap: wrap;
 	}
  
	.file-preview-wrapper {
    padding: 10px;
    position: relative;
	}
        
  .file-close-button {
    position: absolute;
    line-height: 18px;
    z-index: 99;
    font-size: 18px;
    right: 5px;
    top: 10px;
    color: #fff;
    font-weight: bold;
    background-color: #666666;
    width: 20px;
    height: 20px;
    text-align: center;
    cursor: pointer;
	}
        
  .file-preview-wrapper-upload {
    margin: 10px;
    padding-top: 20px;
    background-color: white;
    width: 150px;
    border: 1px soild #eb6864;
    
	}
        
        
  .image-box {
    margin-top: 30px;
    padding-bottom: 30px;
    text-align: center;
	}
	
	.file-preview-wrapper>img {
     position: relative;
     width: 200px;
     height: 250px;
     z-index: 10;
 	}
 	
 	.nickname{
 		font-weight: bold;
 		font-size: large;
 		margin-left: 20px;
 	}
 	
 	.hidefile{
 		display:none;
 	}
 	

 	

</style>


<script type="text/javascript">

//내용 글자 수 카운트
$(function(){

	$("#contentCheck").on("input",function(){
		const size = $(this).val().length;
		
		if(size <= 1000){
			const target = $(this).next().children(".length").children(".count");
			target.text(size);
		}
		
		if(size > 1000){
			$(this).val($(this).val().substring(0, 1000));
		}
		
	});
	
	
	
	$(".cancel").click(function(){
		const text = confirm("지금 나가면 수정 내용이 저장되지 않습니다.");
		
		if(text){
			location.replace("/mars/member/page?memberNo=${login}")
		}
	});
		

	
	$(".form-submit").submit(function(e){
	
		if($(".content").val() == ""){
			alert("문구를 입력하세요.");
			e.preventDefault();
		}
		
		if($("#upload2").val() == ""){
			$("#upload2").attr("disabled", true);
		}
		else{
			$("#upload2").attr("disabled", false);
		}
		
		
		if($(".content").val() == "" || $("#hashtag").val() != ""){
			$("#hashtag").attr("disabled", false);
		}
		else{
			$("#hashtag").attr("disabled", true);
		}
		
		if($(".content").val() == "" || $("#memberTag").val() != ""){
			$("#memberTag").attr("disabled", false);
		}
		else{
			$("#memberTag").attr("disabled", true);
		}
		
		
	});
	
});


</script>

<!------------------------------------------------------------------------------------->

<div id="app" class="vue-container">

<form action="edit" method="post" class="form-submit">
	<input type="hidden" name="boardNo" value="${boardDto.boardNo}">

	<div class="container-fluid">
	
		<div class="row mt-3"></div>
	
		<!-- 게시물 수정 영역 -->
		
		<div class="row w-50 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		    <div class="card border-primary mb-3" style="height: 600px;">
		      <div class="card-header">
		        <div class="row">
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary cancel" style="float:left;">취소</button>
		          </div>
		          <div class="col-md-8">
		            <h4 class="text-primary text-center" style="margin-top: 1%;">게시물 수정하기</h4>
		          </div>
		          <div class="col-md-2">
		            <button type="submit" class="btn btn-primary" style="float:right;">공유하기</button>
		          </div>
		        </div>
		      </div>
		      
		      <div class="card-body text-center">
		      
		      	<div class="row">
		      		<div class="col-md-7">
		      			
		      			<div id="carouselExampleIndicators" class="carousel slide" data-bs-interval="false">
								  <div class="carousel-indicators">
								  	<c:forEach items="${boardAttachVO}" var="boardAttachVO" varStatus="status">
									    <button type="button" data-bs-target="#carouselExampleIndicators" :data-bs-slide-to="${status.index}" :class="{'active':${status.index == 0}}" :aria-current="${status.index == 0 }" :aria-label="'Slide'+${status.index +1 }"></button>
								  	</c:forEach>
								  </div>
								  
								  <div class="carousel-inner" >
								  	<c:forEach items="${boardAttachVO}" var="boardAttachVO" varStatus="status">
									  	<div class="carousel-item" v-bind:class="{'active':${status.index == 0}}">
									  		<!-- <img :src="file.preview" class="d-block w-100" style="height: 480px;" /> -->
									  		<img src="${pageContext.request.contextPath}/file/download/${boardAttachVO.attachNo}" class="d-block w-100" style="height: 480px;">
										 </div>
									 </c:forEach>
								 </div>
								  
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
		      			
		      		</div>
		      		
		      		<div class="col-md-5">
					    	<div class="row">
					    		<div class="col-md-2 right">
						    		<img src="${pageContext.request.contextPath}/file/download/${boardMemberVO.attachNo}" class="img img-circle">		    		
					    		</div>
					    		<div class="col-md-10 left bottom">
					    			<span class="nickname">${boardMemberVO.memberNick}</span>
					    		</div>
					    	</div>
					    	
					    	<div class="row mb-2"></div>
					    	
					    	<div class="row">
					    		<textarea id="contentCheck" class="form-control content" rows="6" name="boardContent" placeholder="문구를 입력하세요">${boardDto.boardContent}</textarea>
					    		<div class="right">
										<span class="length">
											<span class="count">${boardDto.boardContent.length()}/</span>
											
											<span class="total">1000</span>
										</span>
									</div>
					    	</div>
					    	
					    	<div class="row mt-4">
					    		<input type="text" name="hashtagName" class="form-control" placeholder="#해시태그" id="hashtag" autocomplete="off" value="${hashtagName}">
					    	</div>
					    	
					    	<div class="row mt-4">
					    		<input type="text" name="memberNick" class="form-control" placeholder="@사람태그" id="memberTag" autocomplete="off" value="${memberHashName}">
					    	</div>
					    	
					    	<div class="row mt-4 form-check form-switch" style="display: flex;">
					    		
										<div class="col-md-9 left" style="margin-left: 0px;">
											<label class="fs-5" for="replyCheck">댓글 기능 해제</label>
										</div>
										<div class="col-md-3">
											<input type="checkbox" name="boardIsReply" value="1" class="form-check-input fs-5" style="margin-left: 0;" id="replyCheck" <c:if test="${boardDto.boardIsReply == 1}">checked</c:if>>
										</div>
									
					    	</div>
					    	
					    	<div class="row">
									<p class="left" style="font-size: small;">게시물 상단의 메뉴에서 이 설정을 변경할 수 있습니다.</p>
					    	</div>
					    	
					    	</div>
			    	
			   			</div>
		      	</div>
		        
		      </div>
		      
		    </div>
		
		  </div>
		 
		</div>
		
		<div class="row mb-5"></div>
	

</form>

</div>

<script>
  //div[id=app]을 제어할 수 있는 Vue instance를 생성
  const app = Vue.createApp({
    //data 영역 : 화면을 구현하는데 필요한 데이터를 작성해둔다.
    data(){
      return {
        
      }
    },

    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
	    
    },
    created(){
    	
    	
    }
    
  });
  app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

