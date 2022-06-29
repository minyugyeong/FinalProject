<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.div-center {
		display: inline-block;
		text-align: center;
	}

	.img {
		border: 2px solid transparent;
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


</style>

<script type="text/javascript">
	
	

	
	//댓글 기능 해제 checkbox 값 보내기
</script>

<script type="text/javascript">

//내용 글자 수 카운트
$(function(){
	/* if($("#input_check").prop("checked", true) {
		$("#input_check_hidden").attr("disabled", true);
	} */
	$(".content").on("input", function(){
		
		const size = $(this).val().length;
		
		if(size <= 10){
		const target = $(this).next().children(".length").children(".count");
		target.text(size);
			}
		
		if(size > 10){
			$(this).val($(this).val().substring(0, 10));
		}
		
	});
});

</script>

<!------------------------------------------------------------------------------------->

<form action="insert" method="post" enctype="multipart/form-data">

	<div class="container-fluid">
	
		<div class="row mt-3"></div>
		
		<!-- 1. 사진 첨부 영역 -->
		<div class="row w-50 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		    <div class="card border-primary mb-3" style="height: 600px;">
		      <div class="card-header">
		        <div class="row">
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary" style="float:left;">취소</button>
		          </div>
		          <div class="col-md-8">
		            <h4 class="text-primary text-center" style="margin-top: 1%;">새 게시물 만들기</h4>
		          </div>
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary" style="float:right;">다음</button>
		          </div>
		        </div>
		      </div>
		      <div class="card-body text-center" style="margin-top: 20%;">
		        <h1 class="card-title" ><i class="fa-regular fa-images"></i></h1>
		        <p class="card-text fs-5">사진을 선택하세요.</p>
		        <label for="upload" class="input-upload">업로드</label>
		        <input type="file" name="boardAttach" accept=".png, .jpg" id="upload" style="display:none;" multiple>
		      </div>
		    </div>
		
		  </div>
		</div>
		
		
		<!-- 2. 게시물 등록 영역 -->
		<div class="row w-50 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		    <div class="card border-primary mb-3" style="height: 600px;">
		      <div class="card-header">
		        <div class="row">
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary" style="float:left;">이전</button>
		          </div>
		          <div class="col-md-8">
		            <h4 class="text-primary text-center" style="margin-top: 1%;">새 게시물 만들기</h4>
		          </div>
		          <div class="col-md-2">
		            <button type="submit" class="btn btn-primary" style="float:right;">공유하기</button>
		          </div>
		        </div>
		      </div>
		      
		      <div class="card-body text-center">
		      
		      	<div class="row">
		      		<div class="col-7">
		      			
		      			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="false" data-bs-interval="false">
								  <div class="carousel-indicators">
								    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
								    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="${pageContext.request.contextPath}/image/picture.jpg" class="d-block w-100" height="500px">
								    </div>
								    <div class="carousel-item">
								      <img src="${pageContext.request.contextPath}/image/logo.png" class="d-block w-100" height="500px">
								    </div>
								    <div class="carousel-item">
								      <img src="${pageContext.request.contextPath}/image/favicon.png" class="d-block w-100" height="500px">
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
											<span class="total">10</span>
										</span>
									</div>
					    	</div>
					    	
					    	<div class="row mt-4">
					    		<h4>태그자리</h4>
					    	</div>
					    	
					    	<div class="row mt-4 form-check form-switch">
					    		<div class="row">
										<div class="col-6 left" style="margin-left: 0px;">
											<label class="fs-5" for="input_check">댓글 기능 해제</label>
										</div>
										<div class="col-6">
											<input type="checkbox" name="boardIsReply" value="1"  id="input_check" class="form-check-input fs-5">
											<!-- <input type="hidden" name="boardIsReply" value="0" id="input_check_hidden"> -->
										</div>
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

<!------------------------------------------------------------------------------------->


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

