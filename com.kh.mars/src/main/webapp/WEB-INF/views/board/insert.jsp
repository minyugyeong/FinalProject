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

//?????? ?????? ??? ?????????
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
		const text = confirm("???????????? ??????????????????????\n?????? ????????? ?????? ????????? ???????????? ????????????.");
		
		if(text){
			location.replace("/mars/")
		}
	});
		

	
	$(".form-submit").submit(function(e){
	
		if($(".content").val() == ""){
			alert("????????? ???????????????.");
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
	
		//?????? ?????????
		let index = 0;
		move(index);
		
		$(".btn-next").click(function(){
			
			if($("#upload").val() == "" && $("#upload2").val() == ""){
					alert("????????? ???????????????.");
					$(".btn-next").attr("disabled", false);
			}
			else{
				index++;
				move(index);
			}	
			
		});
		
		$(".btn-prev").click(function(){
			index--;
			move(index);
		});
		
		function move(index){
			$(".page").hide();
			$(".page").eq(index).show();
		}
		
		
	
});


</script>

<!------------------------------------------------------------------------------------->

<div id="app" class="vue-container">

<form action="insert" method="post" enctype="multipart/form-data" class="form-submit">

	<div class="container-fluid">
	
		<div class="row mt-3"></div>
		
		<!-- 1. ?????? ?????? ?????? -->
		<div class="page">
		<div class="row w-50 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		    <div class="card border-primary mb-3" style="height: 600px;">
		      <div class="card-header">
		        <div class="row">
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary cancel" style="float:left;">??????</button>
		          </div>
		          <div class="col-md-8">
		            <h4 class="text-primary text-center" style="margin-top: 1%;">??? ????????? ?????????</h4>
		          </div>
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary btn-next" style="float:right;">??????</button>
		          </div>
		        </div>
		      </div>
		      
		      
		      <div>
		      	
		      	<!-- 1-1. ?????? ?????????, ????????? ?????? ?????? -->
			      <div :class="{'hidefile':files.length>0}">
				      <div class="card-body text-center" style="margin-top: 20%;">
				        <h1 class="card-title" ><i class="fa-regular fa-images"></i></h1>
				        <p class="card-text fs-5">????????? ???????????????.</p>
				        <label for="upload" class="input-upload">?????????</label>
				        <input type="file" name="boardAttach" accept=".png, .jpg" id="upload" ref="files" @change="imageUpload" style="display:none;" multiple>
				        <p style="margin-top: 20px;">* ???????????? ?????? 5????????? ?????? ???????????????.</p>
				      </div>
			      </div>
			      
			      <!-- 1-2. ?????? ???????????? ???, ???????????? ?????? -->
			      <div :class="{'hidefile':files.length==0}">
				      <div class="file-preview-container">
				        <div v-for="(file, index) in files" :key="index" class="file-preview-wrapper">
				        	<div class="file-close-button" @click="fileDeleteButton" :name="file.number">
				        		X
				        	</div>
				        	<img :src="file.preview"/>
				        </div>
				        <div class="file-preview-wrapper-upload">
				        	<div class="image-box" v-show="files.length < 5">
						        <label for="upload2" class="input-uploadPlus">
						        	<i class="fa-solid fa-plus fa-3x"></i>
						        </label>
						        <input type="file" name="boardAttach" accept=".png, .jpg" id="upload2" ref="files2" @change="imageAddUpload" style="display:none;" multiple/>				        	
				        	</div>
				        </div>
				      </div>
			      </div>
		      
		      </div>
		      

		    </div>
		
		  </div>
		</div>
		</div>
		
		
		<!-- 2. ????????? ?????? ?????? -->
		<div class="page">
		<div v-show="files.length > 0" class="row w-50 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		    <div class="card border-primary mb-3" style="height: 600px;">
		      <div class="card-header">
		        <div class="row">
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary btn-prev" style="float:left;">??????</button>
		          </div>
		          <div class="col-md-8">
		            <h4 class="text-primary text-center" style="margin-top: 1%;">??? ????????? ?????????</h4>
		          </div>
		          <div class="col-md-2">
		            <button type="submit" class="btn btn-primary" style="float:right;">????????????</button>
		          </div>
		        </div>
		      </div>
		      
		      <div class="card-body text-center">
		      
		      	<div class="row">
		      		<div class="col-md-7">
		      			
		      			<div id="carouselExampleIndicators" class="carousel slide" data-bs-interval="false">
								  <div class="carousel-indicators">
								    <button v-for="(file, index) in files" :key="index" type="button" data-bs-target="#carouselExampleIndicators" :data-bs-slide-to="index" :class="{'active':index==0}" :aria-current="index==0" :aria-label="'Slide'+(index+1)"></button>
								  </div>
								  
								  <div class="carousel-inner" >
									  	<div  v-for="(file, index) in files" :key="index" class="carousel-item" v-bind:class="{'active':index==0}">
									  		<img :src="file.preview" class="d-block w-100" style="height: 480px;" />
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
		      		
		      		<div class="col-md-5">
					    	<div class="row">
					    		<div class="col-md-10 left bottom">
					    			<span class="nickname">${memberNick}</span>
					    		</div>
					    	</div>
					    	
					    	<div class="row mb-2"></div>
					    	
					    	<div class="row">
					    		<textarea id="contentCheck" class="form-control content" rows="6" name="boardContent" placeholder="????????? ???????????????"></textarea>
					    		<div class="right">
										<span class="length">
											<span class="count">0</span>
											/
											<span class="total">1000</span>
										</span>
									</div>
					    	</div>
					    	
					    	<div class="row mt-4">
					    		<input type="text" name="hashtagName" class="form-control" placeholder="#????????????" id="hashtag" autocomplete="off">
					    	</div>
					    	
					    	<div class="row mt-4">
					    		<input type="text" name="memberNick" class="form-control" placeholder="@????????????" id="memberTag" autocomplete="off">
					    	</div>
					    	
					    	
					    	<div class="row mt-4 form-check form-switch" style="display: flex;">
					    		
										<div class="col-md-9 left" style="margin-left: 0px;">
											<label class="fs-5" for="replyCheck">?????? ?????? ??????</label>
										</div>
										<div class="col-md-3">
											<input type="checkbox" name="boardIsReply" value="1" class="form-check-input fs-5" style="margin-left: 0;" id="replyCheck">
										</div>
									
					    	</div>
					    	
					    	<div class="row">
									<p class="left" style="font-size: small;">????????? ????????? ???????????? ??? ????????? ????????? ??? ????????????.</p>
					    	</div>
					    	
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
<!------------------------------------------------------------------------------------->


<script>
  //div[id=app]??? ????????? ??? ?????? Vue instance??? ??????
  const app = Vue.createApp({
    //data ?????? : ????????? ??????????????? ????????? ???????????? ???????????????.
    el: ".vue-container",
    data(){
      return {
    	  files : [],
    	  filesPreview: [],
    	  uploadImageIndex: 0,

    	  
    	  /* //????????????
    	  keyword: "",
    	  nickList: [],
    	  click: false, */
        
      }
    },

    //methods : ?????????????????? ????????? ????????? ?????? ????????? ?????? ????????? ????????? ?????? ????????????.
    methods:{
    	
    	imageUpload(){
    		
    		let num = -1;
    		for(let i = 0; i < this.$refs.files.files.length; i++){
    			this.files = [
    				...this.files,
    				{
    					file: this.$refs.files.files[i],
    					preview: URL.createObjectURL(this.$refs.files.files[i]),
    					number: i
    				}
    			];
    			num = i;
    		}
    		this.uploadImageIndex = num + 1;
    	},
    	
    	imageAddUpload(){
    		
    		let num = -1;
    		for(let i = 0; i < this.$refs.files2.files.length; i++){
    			this.files = [
    				...this.files,
    				{
    					file: this.$refs.files2.files[i],
    					preview: URL.createObjectURL(this.$refs.files2.files[i]),
    					number: i + this.uploadImageIndex
    				}
    			];
    			num = i;
    		}
    		this.uploadImageIndex = this.uploadImageIndex + num + 1;
    		
    	},
    	fileDeleteButton(e){
    		const name = e.target.getAttribute('name');
    		this.files = this.files.filter(data => data.number != Number(name));
    	},
    	
	    
    },
    
    
    

  });
  app.mount("#app");
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

