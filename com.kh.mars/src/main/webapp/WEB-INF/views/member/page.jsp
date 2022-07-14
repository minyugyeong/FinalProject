<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
@media screen and (max-width: 770px){
            .media-width{
                width: 100%!important;
            }
        }
        .media-height{
        	width: 250px; 
        	height:250px; 
        	overflow: hidden;
        }
        
</style>	

	<!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app" class="container-fluid" style="width:70%!important;">
    <!-- 화면 영역 -->
    <!-- Button trigger modal -->
    <div class="row">
            <div class="col-4">
                <img style="border-radius: 70%;" src="${pageContext.request.contextPath}${profileUrl}"
 				width = "150">
            </div>
            <div class="col-8">
                <div class="row">
                    <div class="col-4">
                        <h2>${memberDto.memberNick }</h2>
                    </div>
                    <div class="col-4">
                    	<c:if test="${isOwner }">
                        <a href="edit"><button class="btn">프로필 편집</button></a>
                        </c:if>
                        
                        
                        <c:if test="${!isOwner}">
                        <button v-if="confirm == 1 && block == false" class="btn" @click="following(${memberDto.memberNo})">
                        언팔로우
                        </button>
                        
                        <button v-if="confirm == 2 && block == false"  class="btn" @click="following(${memberDto.memberNo})">
                        팔로우
                        </button>
                        
                        <button v-if="confirm == 0 && block == false" class="btn" @click="following(${memberDto.memberNo})">
                        팔로우 신청됨
                        </button>
                		</c:if>
                		
                		<c:if test="${!isOwner }">
                		<a href="#" class="btn">메세지 보내기</a>
                		</c:if>
                		
                    </div>
                    <c:if test="${!isOwner }">
                    <div class="col-4">
                    	
                    	<button class="btn" v-if="block == false" @click="blockMember(${memberDto.memberNo })">차단하기</button>
                    	
                    	
                    	
                    	<button class="btn" v-if="block == true" @click="blockMember(${memberDto.memberNo })">차단해제</button>
                    	
                    </div>
                    </c:if>
                </div>
                <div class="row">
                    <div class="col-4 mt-3">
                        <h6>게시물 ${boardNum }</h6>
                    </div>
                    
                    <!-- 비공개인데 팔로우가 아닌 경우 -->
                    <c:if test="${isPrivate && !isFollower && !isOwner}">
                    <div class="col-4 mt-3">
						   <h6>팔로워 ${follower }</h6>
                    </div>
                    <div class="col-4 mt-3">
						   <h6>팔로우 ${follow}</h6>
                    </div>
                    </c:if>
                    
                    <!-- 비공개인데 팔로우인 경우 -->
                    <c:if test="${isPrivate && isFollower && !isOwner}">
                    <div class="col-4">
                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal2" @click="followerList">
						   팔로워 ${follower }
						</button>
                    </div>
                    <div class="col-4">
                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="followList">
						   팔로우 ${follow}
						</button>
                    </div>
                    </c:if>
                    
                    <!-- 비공개인 경우 -->
                    <c:if test="${!isPrivate || isOwner}">
                    <div class="col-4">
                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal2" @click="followerList">
						   팔로워 ${follower }
						</button>
                    </div>
                    <div class="col-4">
                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="followList">
						   팔로우 ${follow}
						</button>
                    </div>
                    </c:if>
                    
                </div>
                
                <div class="row mt-2">
                	<h5>${memberDto.memberName }</h5>
                </div>
                
                <div class="row mt-2">
                	<h6>${memberDto.memberIntroduce }</h6>
                </div>
                
            </div>
        </div>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">팔로우</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p v-for="(f,index) in follow" v-bind:key="index">
                <img :src="'${pageContext.request.contextPath }/file/download/'+ f.attachNo" width="25">
                <a :href="'${pageContext.request.contextPath }/member/page?memberNo='+f.memberNo">{{f.memberNick}}</a>
                
                <button class="btn btn-primary" @click="followingBtn">팔로잉</button>
            </p>
        </div>
      </div>
    </div>
  </div>


  <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">팔로워</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p v-for="(fm,index) in follower" v-bind:key="index">
              <img :src="'${pageContext.request.contextPath }/file/download/'+ fm.attachNo" width="25">
             <a :href="'${pageContext.request.contextPath }/member/page?memberNo='+fm.memberNo">{{fm.memberNick}}</a>
             
              <c:if test="${isOwner }">
              <button class="btn btn-primary" @click="deleteFollower(fm.memberNo)">삭제</button>
              </c:if>
          </p>
        </div>
      </div>
    </div>
  </div>
  
  <div class="border-bottom mt-5"></div>
  
  <!-- 사진영역 -->
  <!-- 비공개가 아니거나 비공개인데 팔로우인 경우 -->
<c:if test="${!isPrivate || isPrivate && isFollower || isOwner}">
	<div class="position-absolute mt-5 start-50 translate-middle-x media-width" style="display: flex; flex-direction: column; width: 770px;">
		<div style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">     
		    <div v-if="pageBoardList[0] != null" class="media-height" style="margin-right: 10px; ">
		        <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[0].attachNo" style="width:100%; height:250px;">
		    </div>
		    <div v-if="pageBoardList[1] != null" class="media-height " >
		        <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[1].attachNo" style="width:100%; height:250px;">
		    </div>
		    <div v-if="pageBoardList[2] != null" class="media-height " style="margin-left: 10px;">
		        <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[2].attachNo" style="width:100%; height:250px;">
		    </div>
		</div>
		<div v-for="(board, index) in pageBoardList" :key="index">
	         <div v-if="index%3==2" style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	             <div v-if="pageBoardList[index+1] != null" class="media-height " style="margin-right: 10px;">
	                 <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[index+1].attachNo" style="width:100%; height:250px;">
	             </div>
	             <div v-if="pageBoardList[index+2] != null" class="media-height ">
	                 <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[index+2].attachNo" style="width:100%; height:250px;">
	             </div>
	             <div v-if="pageBoardList[index+3] != null" class="media-height " style="margin-left: 10px;">
	                 <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[index+3].attachNo" style="width:100%; height:250px;">
	             </div>
	         </div>
	 	</div>
	</div>
</c:if>
  <!-- 비공개 계정+ 팔로우 상태가 아닐 경우+ 내 계정이 아닐경우 -->
  <c:if test="${isPrivate && !isFollower && !isOwner}"> 
  <div class="card mt-5" style="width: 100%;">
  <div class="card-body mt-5 mb-5">
    <h6 class="card-subtitle mb-2 text-muted text-center">비공개 계정입니다</h6>
    <h6 class="card-subtitle mb-2 text-muted text-center mt-3">사진 및 동영상을 보려면 팔로우하세요.</h6>
  </div>
</div>
 </c:if> 
 


</div> 
    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            // data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return{
                    follow:[],
                    follower:[],
                    confirm:${followDto.followConfirm},
                    block:${isBlock},
                    
                    //게시글 목록
                    pageBoardList:[],
                    pageCount : 1,
                    memberNo : ${memberDto.memberNo}, 
                    
                    //게시글 상세보기
                    
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                followList(){
                    axios({
                        url:"http://localhost:8080/mars/followList?memberNo="+ ${memberDto.memberNo},
                        method:"get"
                    })
                    .then((resp)=>{
                        this.follow=resp.data;
                    })
                },
                followerList(){
                    axios({
                        url:"http://localhost:8080/mars/followerList?memberNo=" + ${memberDto.memberNo}, 
                        method:"get"
                    })
                    .then((resp)=>{
                        this.follower=resp.data;
                    })
                },
                
                following(memberNo){
                	console.log(memberNo);
                	axios({
                		url: "${pageContext.request.contextPath}/follow",
                		method: "post",
                		params:{
                			memberNo : memberNo
                		},
                	})
                	.then(resp=>{
                		console.log(resp.data);
                		if(resp.data > 0){
                			this.block == true;
                			this.confirm = 1;//언팔
                		}else if(resp.data == 0){
                			this.block == true;
                			this.confirm = 2;//팔로우
                		}else{
                			this.block == true;
                			this.confirm = 0;//신청
                		}
                	});
                },
                
                deleteFollower(memberNo){
                	console.log(memberNo);
                	axios({
                		url: "${pageContext.request.contextPath}/deleteFollower",
                		method: "post",
                		params:{
                			memberNo : memberNo
                		},
                	})
                	.then(resp=>{
                		
                	});
                },
                
                blockMember(memberNo){
                	axios({
                		url : "${pageContext.request.contextPath}/block",
                		method : "post",
                		params :{
                			memberNo : memberNo
                		}
                	})
                	.then(resp=>{
                		console.log(resp.data)
                		this.block=resp.data;
                		if(resp.data == 1){//차단
                			
                				console.log("차단");
                				this.block == false;
                				
                			}
                		
                		else{//차단취소
                				console.log("차단해제");
                				this.block == true;
                			
                			
                		}
                	});
                },
                //게시글
                boardList:_.debounce(function(){
                	axios({
                		url : "${pageContext.request.contextPath}/list",
                		method : "get",
                		params : {
                			memberNo : this.memberNo,
                			pageCount : this.pageCount,
                		}
                	})
                	.then(resp=>{
                		this.pageBoardList.push(...resp.data);
                		this.pageCount++;
                	});
                })
                
            },
            created(){
               axios({
            	   url : "${pageContext.request.contextPath}/list",
            	   method : "get",
            	   params : {
            		   memberNo : this.memberNo,
            		   pageCount : this.pageCount,
            	   }
               })
               .then(resp=>{
            	   this.pageBoardList = resp.data;
            	   console.log(resp.data);
            	   console.log(this.pageBoardList);
            	   this.pageCount++;
               })
            },
            mounted(){
            	$(window).scroll((resp)=>{
            		var scrT = $(window).scrollTop();
            		const bottom = ($(document).height() - $(window).height() - 10);
            		if(scrT > bottom){
            			this.boardList();
            		}
            	})
            },
        });
        app.mount("#app");
    </script>

	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>