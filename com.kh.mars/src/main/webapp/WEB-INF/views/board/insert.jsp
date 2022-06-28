<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.div-center {
		display: inline-block;
		text-align: center;
	}
	
	.card-size1 {
		width: 650px;
		height: 600px;
	}
	
	.card-size2 {
		width: 1000px;
		height: 600px;
	}
	
	.card {
    margin: 0 auto;
    float: none;
    margin-bottom: 10px;
	}

	.img {
		border: 2px solid transparent;
	}
	
	.img.img-circle {
		border-radius: 50%;
	}
	
	.right {
		text-align: right;
	}
	
	.center {
		text-align: center;
	}
	
	.left {
		text-align: left;
	}
	
	textarea {
    border: none;
    resize: none;
  }
	

</style>

<script type="text/javascript">
	
	//내용 글자 수 카운트
	$(function(){
		$(".content").on("input", function(){
			
			const size = $(this).val().length;
			
			const target = $(this).next().children(".length").children(".count");
			target.text(size);
			
			if(size > 1000){
				alert("dd");
				$(this).val(desc.substring(0,1000));
			}
			
		});
	});
	
</script>

<div id="app" class="container-fluid div-center">

	<div class="row mt-4 center">
		<div class="col-md-8 offset-md-2 ">
			<h1 class="text-primary text-center">새 게시물 만들기</h1>
		</div>
	</div>

	<form action="insert" method="post" enctype="multipart/form-data">

		<div class="row mt-4">
			<div class="col-md-8 offset-md-2">
				<label>첨부파일</label>
				<input type="file" name="boardAttach" accept=".png, .jpg">
				<input type="file" name="boardAttach" accept=".png, .jpg">
				
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col-md-8 offset-md-2">
				<label>게시물 내용</label>
				<textarea class="form-control" rows="5" name="boardContent"></textarea>
			</div>
		</div>
		
		<div class="row mt-4 form-check form-switch">
			<div class="col-md-8 offset-md-2">
				<input type="checkbox" name="boardIsReply" class="form-check-input replyCheck" id="mySwitch" value="0">
				<label class="form-check-label" for="mySwitch">댓글 기능 해제</label>
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col-md-8 offset-md-2">
				<button type="submit" class="btn btn-block btn-primary">공유하기</button>
			</div>
		</div>

	</form>

</div>

<!------------------------------------------------------------------------------------->

<div class="container-fluid">

	<!-- 1. 사진 첨부 영역 -->
	<div class="card border-primary mb-3 card-size1 text-center">
	  <div class="card-header">
	  	<button type="button" class="btn btn-secondary" style="float:left;">취소</button>
	  	<button type="button" class="btn btn-secondary" style="float:right;">다음</button>
	  </div>
	  <div class="card-body">
	  <div class="card-title"><i class="fa-thin fa-images"></i></div>
	  <div class="row text-align">
    	<h4 class="card-text">사진을 여기에 끌어다 놓으세요</h4>
    </div>
	  </div>
	</div>
	
	<!-- 2. 게시물 등록 영역 -->
	<div class="card border-primary mb-3 card-size2">
	  <div class="card-header">
	  	<button type="button" class="btn btn-secondary" style="float:left;">이전</button>
	  	<button type="button" class="btn btn-primary" style="float:right;">공유하기</button>
	  </div>
	  
	  <div class="card-body">
	  
	  	<div class="row">
	  	<!-- 왼쪽에 사진 출력 -->
		    <div class="col-7 align-items-center">
		    	
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
					  </div>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="${pageContext.request.contextPath}/image/picture.jpg" class="d-block w-100" width="800px" height="500px">
					    </div>
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath}/image/logo.png" class="d-block w-100" width="800px" height="500px">
					    </div>
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath}/image/logo.png" class="d-block w-100" width="800px" height="500px">
					    </div>
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
		    <div class="col-5">
		    	<div class="row">
		    		<div class="col-2 right">
			    		<img src="${pageContext.request.contextPath}/image/picture.jpg" width="45px" height="45px" class="img img-circle">		    		
		    		</div>
		    		<div class="col-10 left bottom">
		    			<h5>ugyeonggg</h5>
		    		</div>
		    	</div>
		    	
		    	<div class="row mb-2"></div>
		    	
		    	<div class="row">
		    		<textarea class="form-control content" rows="10" name="boardContent" placeholder="문구 입력..."></textarea>
		    		<div class="right">
							<span class="length">
								<span class="count">0</span>
								/
								<span class="total">1000</span>
							</span>
						</div>
		    	</div>
		    	
		    </div>
		  </div>
	  	
	  </div>
	  
	</div>
	
	<div class="row mb-5"></div>

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
     
    },

    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다.
    watch:{
      
    },

  });
  app.mount("#app");
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

