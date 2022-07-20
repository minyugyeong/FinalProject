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
        .fullscreen{
            position:fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.1);

            display: none;
        }

        .fullscreen.active{
            display: block;
        }

        .fullscreen > .center-position{
            position: absolute;
            left: 50%;
            top: 50%;
            
            transform: translate(-50%, -50%);
        }
        
        .beforeanimation{
            transform: scale(1.1);
        }
        .animation {
            transform: scale(1);
            transition:all 0.3s;
        }
        
        .card-scroll{
        	overflow-y: auto;
        	-ms-overflow-style: none;
		}        
        .card-scroll::-webkit-scrollbar {
		    display: none;
		}
		
		.show-icon:hover .fa-xmark{
			display: inline!important;
		}
		
		.reply-btn{
			border: none;
			opacity:0.5; 
			color: var(--bs-primary); 
			backgorund-color:white;
		}
		.reply-btn:hover{
			opacity: 1;
			color: var(--bs-primary);
			background-color: white;
		}
		
		.childReply{
		padding-left: 35px;
		}
		.childShow{
		display: none;
		}
</style>        

<!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app" class="container-fluid" style="width:70%!important;">
    
    <!-- 화면 영역 -->
    <!-- Button trigger modal -->
    <div class="row">
            <div class="col-4 text-center">
                <img style="border-radius: 70%;" src="${pageContext.request.contextPath}${profileUrl}"
 				width = "150" height="150">
            </div>
            <div class="col-8">
                <div class="row">
                    <div class="col-4">
                    	<c:choose>
                    		<c:when test="${memberDto.memberGrade == '비즈니스회원' && isOwner }">
                        	<h2><a style="text-decoration-line: none;" href="${pageContext.request.contextPath}/member/ad?memberNo=${memberDto.memberNo}">${memberDto.memberNick}</a></h2>
                        </c:when>
                        <c:otherwise>
                        	<h2>${memberDto.memberNick}</h2>
                        </c:otherwise>
                       </c:choose>
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
                		<a href="${pageContext.request.contextPath }/dm?targetNo=${memberDto.memberNo }" class="btn">메세지 보내기</a>
                		</c:if>
                		
                		<c:if test="${isOwner }">
                		<a href="${pageContext.request.contextPath }/dm?targetNo=${memberDto.memberNo }" class="btn">나에게 쓰기</a>
                		</c:if>
                		
                    </div>
                    
                    
                    <div class="col-4">
                    	
                    	<c:if test="${!isOwner }">
                    	<button class="btn" v-if="block == false" @click="blockMember(${memberDto.memberNo })">차단하기</button>
                    	
                    	<button class="btn" v-if="block == true" @click="blockMember(${memberDto.memberNo })">차단해제</button>
                    	</c:if>
                    	
                    	<c:if test="${isOwner }">
                    	<a class="btn" href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
                    	</c:if>
                    	
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-4 mt-3">
                        <h6>게시물 ${boardNum+boardAdNum }</h6>
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
                
                <div class="row mt-2 box">
                	<h6 class="content">${memberDto.memberIntroduce }</h6>
                </div>
                
            </div>
        </div>

  <!-- 팔로우 모달 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">팔로우</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p v-for="(f,index) in follow" v-bind:key="index">
            	
                <img :src="'${pageContext.request.contextPath }/file/download/'+ f.attachNo" width="30" height="30" style="border-radius: 70%;">
                <a :href="'${pageContext.request.contextPath }/member/page?memberNo='+f.memberNo">{{f.memberNick}}</a>
        
               
		
				 <button v-if="f.followConfirm == null && f.memberNo != ${login }" class="btn btn-primary" @click="followingInList(f.memberNo)"  style="float: right; width:125px;">팔로우</button>
	             <button v-if="f.followConfirm == 1 && f.memberNo != ${login }" class="btn btn-danger" @click="followingInList(f.memberNo)"  style="float: right; width:125px;">언팔로우</button>
	             <button v-if="f.followConfirm == 0 && f.memberNo != ${login }" class="btn btn-secondary" @click="followingInList(f.memberNo)"  style="float: right; width:125px;">팔로우 요청됨</button>
                    
            </p>
        </div>
      </div>
    </div>
  </div>


  <!-- 팔로워 모달 -->
  <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">팔로워</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p v-for="(fm,index) in follower" v-bind:key="index">
              <img :src="'${pageContext.request.contextPath }/file/download/'+ fm.attachNo" width="30" height="30" style="border-radius: 70%;">
             <a :href="'${pageContext.request.contextPath }/member/page?memberNo='+fm.memberNo">{{fm.memberNick}}</a>
             
	             <button v-if="fm.followConfirm== null && fm.memberNo != ${login }" class="btn btn-primary" @click="followingInList(fm.memberNo)"  style="float: right; width:125px;">팔로우</button>
	             <button v-if="fm.followConfirm== 1 && fm.memberNo != ${login }" class="btn btn-danger" @click="followingInList(fm.memberNo)"  style="float: right; width:125px;">언팔로우</button>
	             <button v-if="fm.followConfirm== 0 && fm.memberNo != ${login }" class="btn btn-secondary" @click="followingInList(fm.memberNo)"  style="float: right; width:125px;">팔로우 요청됨</button>
	             
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
		        <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[0].attachNo" style="width:100%; height:250px;" @click="promise(pageBoardList[0].boardNo,pageBoardList[0].type)">
		    </div>
		    <div v-if="pageBoardList[1] != null" class="media-height " >
		        <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[1].attachNo" style="width:100%; height:250px;" @click="promise(pageBoardList[1].boardNo,pageBoardList[1].type)">
		    </div>
		    <div v-if="pageBoardList[2] != null" class="media-height " style="margin-left: 10px;">
		        <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[2].attachNo" style="width:100%; height:250px;" @click="promise(pageBoardList[2].boardNo,pageBoardList[2].type)">
		    </div>
		</div>
		<div v-for="(board, index) in pageBoardList" :key="index">
	         <div v-if="index%3==2" style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	             <div v-if="pageBoardList[index+1] != null" class="media-height " style="margin-right: 10px;">
	                 <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[index+1].attachNo" style="width:100%; height:250px;" @click="promise(pageBoardList[index+1].boardNo,pageBoardList[index+1].type)">
	             </div>
	             <div v-if="pageBoardList[index+2] != null" class="media-height ">
	                 <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[index+2].attachNo" style="width:100%; height:250px;" @click="promise(pageBoardList[index+2].boardNo,pageBoardList[index+2].type)">
	             </div>
	             <div v-if="pageBoardList[index+3] != null" class="media-height " style="margin-left: 10px;">
	                 <img :src="'${pageContext.request.contextPath}/file/download/'+pageBoardList[index+3].attachNo" style="width:100%; height:250px;" @click="promise(pageBoardList[index+3].boardNo,pageBoardList[index+3].type)">
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
 
<!-- 상세보기 모달창 -->
    <div v-if="detailView" class="container-fluid fullscreen active beforeanimation" :class="{'animation':animation}" @click="detailViewOn" style="position: fixed; z-index: 100;">
	                <div>
	                    <i class="fa-solid fa-x fa-2xl" style="position:absolute; right: 30px; top: 40px;cursor: pointer;"></i>
	                </div>
	                <div class="row center-position" style="width: 80%;">
	                    <div class="col-6 offset-1" style="padding-right: 0;padding-left: 0;" @click.stop>
	                                        
	                        <div id="detailCarousel" class="carousel slide" data-bs-ride="carousel" style="height: 40vw;" data-bs-interval="false">
	                            <div class="carousel-indicators">
                                     <button v-for="(attach, index) in boardDetail.attachList" :key="index" type="button" data-bs-target="#detailCarousel" :data-bs-slide-to="index" :class="{'active':index==0}" :aria-current="index==0" :aria-label="'Slide'+(index+1)"></button>
                                </div>
                                <div class="carousel-inner" style="height:100%!important;background-color: var(--bs-dark);">
                                     <div v-for="(attach, index) in boardDetail.attachList" :key="index" class="carousel-item" :class="{'active':index==0}" style="height:100%;background-color: var(--bs-dark); position:relative;">
                                         <img :src="'${pageContext.request.contextPath}/file/download/'+attach.attachNo" class="d-block position-absolute top-50 start-50 translate-middle" style="object-position: left; width: 101%;transform:translate(-50%,0);">
                                     </div>
                                </div>
                                <button v-if="boardDetail.attachList.length>1" class="carousel-control-prev" type="button" data-bs-target="#detailCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                                </button>
                                <button v-if="boardDetail.attachList.length>1" class="carousel-control-next" type="button" data-bs-target="#detailCarousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                                </button>
	                        </div>
	                    </div>
	                    <div class="col-4 board-detail-card" style="padding-left: 0; max-height: 30rem;" @click.stop>
	                                        
	                        <div class="card bg-light" style="height: 40vw; border-radius: 0;">
	                            <div class="card-header">
	                            	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+boardDetail.boardListVO.memberNo" style="color:black;text-decoration:none;">
		                            	<img v-if="boardDetail.boardListVO.memberProfile>0" :src="'${pageContext.request.contextPath}/file/download/'+boardDetail.boardListVO.memberProfile" width="30" height="30" style="border-radius: 70%;">
		                            	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
		                            	<span style="padding-left: 5px;">
			                            	{{boardDetail.boardListVO.memberNick}}
		                            	</span>
	                            	</a>
	                            	<a v-if="boardDetail.boardListVO.memberNo==${login}" class="btn btn-outline-primary" style="position:absolute; right:50px;margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;">
										수정
                            		</a>
                            		<a v-if="boardDetail.boardListVO.memberNo==${login}" class="btn btn-primary" style="position:absolute; right:0;margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;">
										취소
                            		</a>
	                            </div>
	                            <div class="card-body card-scroll" style="height: 60%;">
	                                <h4 class="card-title"></h4>
	                                <p class="card-text">{{boardDetail.boardListVO.boardContent}}</p>
	                                
	                                <br><br>
	                                <div v-if="boardDetailReply.length==0" style="color:gray;text-align:center;">
	                                	<label for="detailReply">
	                                	<i class="fa-solid fa-satellite-dish fa-lg"></i>
	                                	첫 번째 댓글을 남겨주세요.
	                                	</label>
	                                </div>
	                                
	                                <div v-for="(reply, index) in boardDetailReply" class="card-text show-icon" style="position:relative;" :class="{'childReply':reply.superNo!=0,'childShow':reply.superNo>0}">
	                                	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+reply.replyMemberNo" style="text-decoration:none;color:black;position:relative;">
			                                <img v-if="reply.replyMemberProfile > 0" :src="'${pageContext.request.contextPath}/file/download/'+reply.replyMemberProfile" width="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                <p style="padding-left:3em;margin-bottom:1px;font-size:0.9em;font-weight:bold;">
											{{reply.memberNick}}
	                                	</p>
	                                	</a>
	                                	<p style="padding-left:2.9em;margin-bottom:1px;font-size:0.9em;">
			                                {{reply.replyContent}}
	                                	</p>
	                                	<p style="padding-left:3.1em;font-size:0.85em;color:grey;">
	                                		<a v-if="reply.superNo==0" @click="re_reply(reply.replyNo)">답글</a>&nbsp;
											<i v-if="reply.replyMemberNo == ${memberDto.memberNo}" class="fa-solid fa-xmark" style="display:none;z-index:100;" data-bs-toggle="modal" data-bs-target="#exampleModal" @click.stop="targetInput(reply.replyNo)"></i>
										<p>
										<p v-if="reply.superNo==0">
											<span @click="showReply(reply.replyNo,index)" style="padding-left:3.1em;font-size:0.85em;color:grey;">{{replyStatus(index)}}</span>
										</p>
	                                </div>
	                            </div>
	                            <hr style="margin-top: 0; margin-bottom: 0;">
	                            <div class="card-body">
                                    <p class="card-text">
                                        <i v-if="boardDetail.boardListVO.isLike == 0" class="fa-regular fa-heart fa-lg" style="cursor: pointer;" @click="like(boardDetail.boardListVO.boardNo)"></i>
                                        <i v-else class="fa-solid fa-heart fa-lg" style="width: 15px!important;cursor: pointer;" @click="like(boardDetail.boardListVO.boardNo)"></i>
                                        &nbsp;
                                        <i class="fa-regular fa-comment fa-lg" style="cursor: pointer;"></i>
                                        &nbsp;
                                        <i class="fa-regular fa-newspaper fa-lg"></i>

                                    </p>
                                    <p class="card-text" v-if="boardDetail.boardListVO.likecount > 0">
                                        좋아요 {{boardDetail.boardListVO.likecount}}개
                                    </p>
                                </div>
	                            <div class="card-footer" style="background-color: white;height: 2.5em;padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
	                               	<span style="position: absolute; left:0; top: 6px; z-index: 999;">
	                                	<label for="detailReply">
											<i class="fa-solid fa-satellite-dish fa-lg focusInput"></i>
                                    	</label>
	                                </span>
	                                <div class="input-group">
	                                    <input id="detailReply" type="text" class="form-control" v-model="replyContent" :placeholder="replyPlaceholder" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @input="replyContent = $event.target.value" @keyup.enter="replyEnter(boardDetail.boardListVO.boardNo)">
	                                    <button class="btn btn-outline-light reply-btn" type="button" id="button-addon2" style="border-top-right-radius: 0!important;" @click="replyEnter(boardDetail.boardListVO.boardNo)">작성</button>
	                                  </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                
	            </div>
                <!-- 댓글 Modal -->
				<div class="modal fade" id="exampleModal" tabindex="200" aria-labelledby="exampleModalLabel" aria-hidden="true" @click.stop="targetInput('')">
				  <div class="modal-dialog">
				    <div class="modal-content" style="width:400px;">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">댓글 삭제</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" @click.stop="targetInput('')">취소</button>
				        <button type="button" class="btn btn-primary" @click="deleteReply(boardDetail.boardListVO.boardNo)">삭제</button>
				      </div>
				    </div>
				  </div>
				</div>

</div> 
    <!-- vue js도 lazy loading을 사용한다 -->
    <script>
    
    $(document).ready(function(){
        
        $('.box').each(function(){
            var content = $(this).children('.content');
            var content_txt = content.text();
            var content_txt_short = content_txt.substring(0,50)+"...";
            var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

            
            $(this).append(btn_more);
            
            if(content_txt.length >= 50){
                content.html(content_txt_short)
                
            }else{
                btn_more.hide()
            }
            
            btn_more.click(toggle_content);

            function toggle_content(){
                if($(this).hasClass('short')){
                    // 접기 상태
                    $(this).html('더보기');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }else{
                    // 더보기 상태
                    $(this).html('접기');
                    content.html(content_txt);
                    $(this).addClass('short');

                }
            }
        });
    });
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
                    uptoNo:"",
                    
                	//게시글 상세보기 변수
    				detailView:false,
                    animation:false,
                    boardDetail:{
                		attachList:[],
                		boardListVO:{},
                		hashtagList:[],
             		   },
                    boardDetailReply:[],
                    boardDetailType:"",
                    
                    
                 	//댓글용 변수
                    replyContent:"",
                    superNo:0,
                    
                    replyTarget:"",
                    
                    replyPlaceholder:"댓글 입력",
                    
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                followerList(){
                    axios({
                        url:"http://localhost:8080/mars/followerList?memberNo="+ ${memberDto.memberNo}+ "&memberWho=" +${login},
                        method:"get"
                    })
                    .then((resp)=>{
                        this.follower=resp.data;
                    })
                },
                followList(){
                    axios({
                        url:"http://localhost:8080/mars/followList?memberNo=" + ${memberDto.memberNo} + "&memberWho=" + ${login}, 
                        method:"get"
                    })
                    .then((resp)=>{
                        this.follow=resp.data;
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
                
                followingInList(memberNo){
                	axios({
                		url: "${pageContext.request.contextPath}/follow",
                		method: "post",
                		params:{
                			memberNo : memberNo
                		},
                	})
                	.then(resp=>{
                		this.followList(memberNo);
                		this.followerList(memberNo);
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
                }, 250),
                
             // 상세보기 모달창 작동 함수
            	detailViewOn(){
                    if(!this.detailView){
                    	this.replyContent="";
                        this.detailView=true
                        $('html, body').css({'overflow': 'hidden', 'height': '100%'});
                        setTimeout(resp=>(
                            this.animation = true, 30
                        )
                        )
                    }
                    else{
                        this.detailView = false;
                        this.animation = false;
                        this.superNo = 0;
                        this.replyTarget = "";
                        this.boardDetail = {
                    		attachList:[],
                    		boardListVO:{},
                    		hashtagList:[],
                 		   },
                        $('html, body').css({'overflow': 'auto', 'height': '100%'});
                    }   
                },
                //게시글 상세보기 정보 조회
                boardDetailSearch(boardNo){
                	if(this.boardDetailType==0){
    	            	axios({
    	            		url: "${pageContext.request.contextPath}/rest/search/detail",
    	            		method : "get",
    	            		params:{
    	            			boardNo : boardNo,
    	            		}
    	            	})
    	            	.then(resp=>{
    	            		console.log(resp.data);
    	            		this.boardDetail = resp.data;
    	            	});
                	}else{
                		axios({
                			url: "${pageContext.request.contextPath}/rest/search/detail_ad",
                			method : "get",
                			params:{
                				boardNo : boardNo,
                			}
                		})
                		.then(resp=>{
                			this.boardDetail = resp.data;
                		});
                	}
                },
                //게시글 상세보기 댓글 조회
                boardDetailReplySearch(boardNo){
                	if(this.boardDetailType == 0){
    	            	axios({
    	            		url: "${pageContext.request.contextPath}/rest/board/detail_reply/" + boardNo,
    	            		method: "get"
    	            	})
    	            	.then(resp=>{
    	            		this.boardDetailReply = resp.data;
    	            	});
                	}else{
                		axios({
                			url : "${pageContext.request.contextPath}/rest/board_ad/detail_reply/" + boardNo,
                			method: "get",
                		})
                		.then(resp=>{
                			this.boardDetailReply = resp.data;
                		});
                	}
                },
                //댓글 입력
                replyEnter(boardNo){
                	if(this.boardDetailType == 0){
    	            	axios({
    	            		url : "${pageContext.request.contextPath}/rest/reply/insert",
    	            		method : "post",
    	            		params : {
    	            			replyContent : this.replyContent,
    	            			superNo : this.superNo,
    	            			boardNo : boardNo,
    	            		}
    	            	})
    	            	.then(resp=>{
    	            		this.boardDetailReplySearch(boardNo, this.boardDetailType);
    	            		this.replyContent = "";
    	            		this.superNo = 0;
    	            	});
                	}else{
                		axios({
                			url : "${pageContext.request.contextPath}/rest/reply/insert_ad",
                			method : "post",
                			params : {
                				replyContent : this.replyContent,
                				superNo : this.superNo,
                				boardNo : boardNo,
                			}
                		})
                		.then(resp=>{
                			this.boardDetailReplySearch(boardNo, this.boardDetailType);
    	            		this.replyContent = "";
    	            		this.superNo = 0;
                		})
                	}
                },
                //댓글 지정
                targetInput(replyNo){
                	this.replyTarget = replyNo;
                },
                deleteReply(boardNo){
    	            	axios({
    	            		url : "${pageContext.request.contextPath}/rest/reply/delete/"+this.replyTarget,
    	            		method : "delete",
    	            	})
    	            	.then(resp=>{
    	            		$('#exampleModal').modal('hide');
    	            		this.replyTarget = "";
    	            		this.boardDetailReplySearch(boardNo, this.boardDetailType);
    	            	});
                },
                
                async promise(boardNo, type){
                	this.boardDetailType = type;
                	await this.boardDetailSearch(boardNo);
                	await this.boardDetailReplySearch(boardNo);
                	await this.detailViewOn();
                },
                
              //좋아요 통합
                like(likeNo){
                	if(this.boardDetailType == 0){
    	        		const boardNo = likeNo;
    	        		axios({
    	        			url: "${pageContext.request.contextPath}/rest/board/like",
    	        			method: "post",
    	        			data:{ 
    	        				boardNo : boardNo,
    	        			}
    	        		})
    	        		.then(resp=>{
    	        			this.boardDetail.boardListVO.isLike = resp.data;
    	        			if(resp.data > 0){
    	        				this.boardDetail.boardListVO.likecount += 1
    	        			}else{
    	        				this.boardDetail.boardListVO.likecount -= 1
    	        			}
    	        		});
                	}else{
                		const boardNo = likeNo;
                		axios({
                			url: "${pageContext.request.contextPath}/rest/board_ad/like",
                			method: "post",
                			data:{ 
                				boardNo : boardNo,
                			}
                		})
                		.then(resp=>{
                			this.boardDetail.boardListVO.isLike = resp.data;
                			if(resp.data > 0){
                				this.boardDetail.boardListVO.likecount += 1
                			}else{
                				this.boardDetail.boardListVO.likecount -= 1
                			}
                		});
                	}
            	},
            	
            	re_reply(replyNo){
                	if(replyNo==this.superNo){
                		this.superNo=0;
                       	this.replyPlaceholder = "댓글 입력"
                	}else{
                       	this.superNo=replyNo;
                       	this.replyPlaceholder = "답글 입력"
                       	document.getElementById('detailReply').focus();
                	}
                   	
                   },
                   
                   //답글 펼치기
                   showReply(replyNo,index){
                 	  
                 	  let arrayIndex = [];
                 	  let tmp = index+1;
                 	  if(index!=this.boardDetailReply.length){
                 		  
                     	  while(true){
                     		  if(this.boardDetailReply[tmp]==null) break;
                     		  if(this.boardDetailReply[tmp].superNo==replyNo){
                     			  console.log(tmp);
                     			  arrayIndex.push(tmp);
                     			  tmp++;
                     		  }else if(this.boardDetailReply[tmp].superNo==-1||this.boardDetailReply[tmp].superNo==0) break;
                     	  }
                     	  if(arrayIndex.length >= 1){
                         	  for(var i = 0; i<arrayIndex.length; i++){
                         		  this.boardDetailReply[arrayIndex[i]].superNo = -1;
                         	  }
                         	 console.log("-1만들기");
                         	 return;
                     	  }
                     	  
                     	  while(true){
                     		  if(this.boardDetailReply[tmp]==null) break;
                     		  if(this.boardDetailReply[tmp].superNo==-1){
                     			  console.log(tmp);
                     			  arrayIndex.push(tmp);
                     			  tmp++;
                     		  }else if(this.boardDetailReply[tmp]==null||this.boardDetailReply[tmp].superNo==0) break;
                     	  }
                     	  
                     	  for(var i = 0; i<arrayIndex.length; i++){
                     		  this.boardDetailReply[arrayIndex[i]].superNo = replyNo;
                     	  }
                     	  console.log("+만들기");
                 	  }
                 	  console.log(arrayIndex);
                    },
            	
            	
	           //답글 숨기기 보기 상태변경
	           replyStatus(index){
					if(index==this.boardDetailReply.length) return;
         	   if(this.boardDetailReply[index+1]!=null&&this.boardDetailReply[index+1].superNo>0){
         		   return "답글 보기";
         	   }else if(this.boardDetailReply[index+1]!=null&&this.boardDetailReply[index+1].superNo==0){
         		   return "";
         	   }else if(this.boardDetailReply[index+1]!=null&&this.boardDetailReply[index+1].superNo<0){
         		   return "답글 숨기기";
         	   }
         	  
            },
                
                
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
            	   console.log(resp.data);
            	   this.pageBoardList = resp.data;
            	   console.log(this.pageBoardList);
            	   this.pageCount++;
               });
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