<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function(){
	$('.media-height img').each(function() {
	$(this).css("height", $(this).width());
	});
	
	});
	
	$(window).resize(function(){
	$('.media-height img').each(function() {
	$(this).height($(this).width());
	});
	}).resize();
	
</script>
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
		.imgHover:hover{
			opacity:1!important;
		}
            
        
</style>
<div id="app">

	<!-- 검색 리스트 -->
    <div class="contaitner-fluid">
    	
        <div class="position-absolute top-0 start-50 translate-middle-x media-width" style="display: flex; flex-direction: column; width: 770px;">
		    	<div>
			    	${hashTagName} 검색 결과
		    	</div>
    			<div v-if="searchLikeList[0] != null">
	    			인기 게시글
    			</div>
    			<br>
	            <div style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchLikeList[0] != null" class="media-height" style="margin-right: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[0].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[0].boardNo,searchLikeList[0].type)">
	                    <i v-if="searchLikeList[0].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchLikeList[0].boardNo,searchLikeList[0].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchLikeList[0].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchLikeList[0].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchLikeList[1] != null" class="media-height" style="position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[1].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[1].boardNo,searchLikeList[1].type)">
	                    <i v-if="searchLikeList[1].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchLikeList[1].boardNo,searchLikeList[1].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchLikeList[1].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchLikeList[1].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchLikeList[2] != null" class="media-height" style="margin-left: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[2].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[2].boardNo,searchLikeList[2].type)">
	                    <i v-if="searchLikeList[2].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchLikeList[2].boardNo,searchLikeList[2].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchLikeList[2].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchLikeList[2].replyCount}}</span>
	                    </div>
	                </div>
	            </div>
        	<div v-for="(board, index) in searchLikeList" :key="index">
	            <div v-if="index%3==2" style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchLikeList[index+1] != null" class="media-height" style="margin-right: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[index+1].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[index+1].boardNo,searchLikeList[index+1].type)">
	                    <i v-if="searchLikeList[index+1].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchLikeList[index+1].boardNo,searchLikeList[index+1].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchLikeList[index+1].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchLikeList[index+1].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchLikeList[index+2] != null" class="media-height" style="position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[index+2].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[index+2].boardNo,searchLikeList[index+2].type)">
	                    <i v-if="searchLikeList[index+2].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchLikeList[index+2].boardNo,searchLikeList[index+2].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchLikeList[index+2].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchLikeList[index+2].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchLikeList[index+3] != null" class="media-height" style="margin-left: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[index+3].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[index+3].boardNo,searchLikeList[index+3].type)">
	                    <i v-if="searchLikeList[index+3].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchLikeList[index+3].boardNo,searchLikeList[index+3].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchLikeList[index+3].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchLikeList[index+3].replyCount}}</span>
	                    </div>
	                </div>
	            </div>
        	</div>
        	
        		<div v-if="searchList[0] != null">
	        		최근 게시글
        		</div>
	            <div style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchList[0] != null" class="media-height" style="margin-right: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[0].attachNo" style="width:100%; height:250px;"  @click="promise(searchList[0].boardNo,searchList[0].type)">
	                    <i v-if="searchList[0].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchList[0].boardNo,searchList[0].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchList[0].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchList[0].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchList[1] != null" class="media-height" style="position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[1].attachNo" style="width:100%; height:250px;" @click="promise(searchList[1].boardNo,searchList[1].type)">
	                    <i v-if="searchList[1].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchList[1].boardNo,searchList[1].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchList[1].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchList[1].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchList[2] != null" class="media-height" style="margin-left: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[2].attachNo" style="width:100%; height:250px;" @click="promise(searchList[2].boardNo,searchList[2].type)">
	                    <i v-if="searchList[2].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchList[2].boardNo,searchList[2].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchList[2].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchList[2].replyCount}}</span>
	                    </div>
	                </div>
	            </div>
        	<div v-for="(board, index) in searchList" :key="index">
	            <div v-if="index%3==2" style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchList[index+1] != null" class="media-height" style="margin-right: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[index+1].attachNo" style="width:100%; height:250px;" @click="promise(searchList[index+1].boardNo,searchList[index+1].type)">
	                    <i v-if="searchList[index+1].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchList[index+1].boardNo,searchList[index+1].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchList[index+1].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchList[index+1].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchList[index+2] != null" class="media-height" style="position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[index+2].attachNo" style="width:100%; height:250px;" @click="promise(searchList[index+2].boardNo,searchList[index+2].type)">
	                    <i v-if="searchList[index+2].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchList[index+2].boardNo,searchList[index+2].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchList[index+2].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchList[index+2].replyCount}}</span>
	                    </div>
	                </div>
	                <div v-if="searchList[index+3] != null" class="media-height" style="margin-left: 10px;position:relative;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[index+3].attachNo" style="width:100%; height:250px;" @click="promise(searchList[index+3].boardNo,searchList[index+3].type)">
	                    <i v-if="searchList[index+3].attachCount>1" class="fa-solid fa-note-sticky fa-lg" style="color:white;position:absolute;right:0;top:20px;"></i>
	                    <div class="imgHover" @click="promise(searchList[index+3].boardNo,searchList[index+3].type)" style="cursor:pointer;position:absolute;background-color:#22222221;left:0;right:0;top:0;bottom:0;opacity:0;color:white;" >
	                    	<i class="fa-solid fa-heart fa-lg" style="position:absolute;top:50%;left:25%;"></i>
		                    <span style="position:absolute;top:45%;left:35%;">{{searchList[index+3].likeCount}}</span>
		                    <i class="fa-regular fa-comment fa-lg" style="position:absolute;top:50%;left:50%;"></i>
		                    <span style="position:absolute;top:45%;left:60%;">{{searchList[index+3].replyCount}}</span>
	                    </div>
	                </div>
	            </div>
        	</div>
        	
        </div>
        
    </div>
    
    
    
    
    <!-- 상세보기 모달창 -->
    <div v-if="detailView" class="container-fluid fullscreen active beforeanimation" :class="{'animation':animation}" @click="detailViewOn" style="position: fixed; z-index: 100;">
	                <div>
	                    <i class="fa-solid fa-x fa-2xl" style="position:absolute; right: 30px; top: 40px;cursor: pointer;"></i>
	                </div>
	                <div class="row center-position" style="width: 80%;">
	                    <div class="col-6 offset-1" style="padding-right: 0;padding-left: 0;" @click.stop>
	                                        
	                        <div id="detailCarousel" class="carousel slide" data-bs-ride="carousel" style="height: 40vw;" data-bs-interval="false">
	                            <div class="carousel-indicators">
                                     <button v-if="boardDetail!=null" v-for="(attach, index) in boardDetail.attachList" :key="index" type="button" data-bs-target="#detailCarousel" :data-bs-slide-to="index" :class="{'active':index==0}" :aria-current="index==0" :aria-label="'Slide'+(index+1)"></button>
                                </div>
                                <div class="carousel-inner" style="height:100%!important;background-color: var(--bs-dark);">
                                     <div v-if="boardDetail!=null" v-for="(attach, index) in boardDetail.attachList" :key="index" class="carousel-item" :class="{'active':index==0}" style="height:100%;background-color: var(--bs-dark); position:relative;">
                                         <img :src="'${pageContext.request.contextPath}/file/download/'+attach.attachNo" class="d-block position-absolute top-50 start-50 translate-middle" style="object-position: left; width: 101%;transform:translate(-50%,0);">
                                     </div>
                                </div>
                                <button v-if="boardDetail!=null&&boardDetail.attachList.length>1" class="carousel-control-prev" type="button" data-bs-target="#detailCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                                </button>
                                <button v-if="boardDetail!=null&&boardDetail.attachList.length>1" class="carousel-control-next" type="button" data-bs-target="#detailCarousel" data-bs-slide="next">
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
                            		<a :href="'${pageContext.request.contextPath}/board/edit?boardNo='+boardDetail.boardListVO.boardNo" v-if="boardDetail.boardListVO.memberNo==${login}&&boardDetailType!=1" class="btn btn-outline-primary" style="position:absolute; right:50px;margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;">
										수정
                            		</a>
                            		<a data-bs-toggle="modal" data-bs-target="#boardDeleteModal" v-if="boardDetail.boardListVO.memberNo==${login}&&boardDetailType!=1" class="btn btn-primary" style="position:absolute; right:0;margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;">
										삭제
                            		</a>
	                            </div>
	                            <div class="card-body card-scroll" style="height: 60%;">
	                                <h4 class="card-title"></h4>
	                                <p class="card-text">
	                                	{{boardDetail.boardListVO.boardContent}}
	                                	<br v-if="boardDetail.hashtagList.length>0">
	                                	<br v-if="boardDetail.hashtagList.length>0">
	                                	<a v-for="(tag,index3) in boardDetail.hashtagList" :href="'${pageContext.request.contextPath}/search/'+tag.hashtagNo" :key="index3">{{tag.hashtagName}}</a>
	                                </p>
	                                
	                                <br><br>
	                                <div v-if="boardDetailReply.length==0" style="color:gray;text-align:center;">
	                                	<label for="detailReply">
	                                	<i class="fa-solid fa-satellite-dish fa-lg"></i>
	                                	첫 번째 댓글을 남겨주세요.
	                                	</label>
	                                </div>
	                                
	                                
	                                <div v-if="boardDetail.boardListVO.boardIsReply==0" v-for="(reply, index) in boardDetailReply" class="card-text show-icon" style="position:relative;" :class="{'childReply':reply.superNo!=0,'childShow':reply.superNo>0}">
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
                                        <label for="detailReply">
                                        <i class="fa-regular fa-comment fa-lg" style="cursor: pointer;"></i>
                                        </label>
                                        &nbsp;
                                        <a :href="'${pageContext.request.contextPath}/dm?targetNo='+boardDetail.boardListVO.memberNo" style="color:black;">
                                        <i class="fa-regular fa-newspaper fa-lg"></i>
										</a>

                                    </p>
                                    <p class="card-text" v-if="boardDetail.boardListVO.likecount > 0">
                                        좋아요 {{boardDetail.boardListVO.likecount}}개
                                    </p>
                                </div>
	                            <div v-if="boardDetail.boardListVO.boardIsReply==0" class="card-footer" style="background-color: white;height: 2.5em;padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
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
				
				<!-- 게시글 삭제 Modal -->
				<div class="modal fade" id="boardDeleteModal" tabindex="200" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <a class="btn btn-primary" :href="'${pageContext.request.contextPath}/board/delete?boardNo='+boardDetail.boardListVO.boardNo">삭제</a>
				      </div>
				    </div>
				  </div>
				</div>
    
    
    
    
    
    
</div>


<script>

	const app = Vue.createApp({
	    data(){
	        return {
	        	
	        	//검색목록 띄우기용 변수
	        	searchLikeList:[],
	        	searchList:[],
	        	
				hashTagNo: ${hashTagNo},
				uptoNo:0,
				uptoNoAd:0,
				pageCount: 1,
				
				
				// 게시글 상세보기 변수
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
	    computed:{
	        
	    },
	    methods:{
	    	//게시글 로딩
	    	loading:_.debounce(function(){
        		axios({
            		url: "${pageContext.request.contextPath}/rest/search/list",
            		method: "get",
            		params : {
            			hashTagNo: this.hashTagNo,
    	    			pageCount: this.pageCount,
    	    			uptoNo: this.uptoNo,
    	    			uptoNoAd: this.uptoNoAd,
            		}
            	})
            	.then(resp=>{
            		this.searchList.push(...resp.data);
            		this.pageCount++;
            	});
    		},250),
	    	
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
	            		const alram = {
	        					type:3,
	        					target: this.boardDetail.boardListVO.memberNo,
	        					messageType:4,//메세지타입 정리 1-그냥 메세지 2-사진메세지 3-dm알람 4-그외 알람
	        			}
	        			const jsonAlram = JSON.stringify(alram);
	        			socket.send(jsonAlram);
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
	            		const alram = {
	        					type:3,
	        					target: this.boardDetail.boardListVO.memberNo,
	        					messageType:4,//메세지타입 정리 1-그냥 메세지 2-사진메세지 3-dm알람 4-그외 알람
	        			}
	        			const jsonAlram = JSON.stringify(alram);
	        			socket.send(jsonAlram);
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
		        			const alram = {
		        					type:3,
		        					target: this.boardDetail.boardListVO.memberNo,
		        					messageType:4,//메세지타입 정리 1-그냥 메세지 2-사진메세지 3-dm알람 4-그외 알람
		        			}
		        			const jsonAlram = JSON.stringify(alram);
		        			socket.send(jsonAlram);
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
	            			const alram = {
		        					type:3,
		        					target: this.boardDetail.boardListVO.memberNo,
		        					messageType:4,//메세지타입 정리 1-그냥 메세지 2-사진메세지 3-dm알람 4-그외 알람
		        			}
		        			const jsonAlram = JSON.stringify(alram);
		        			socket.send(jsonAlram);
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
	    watch:{
	        
	    },
	    beforeCreate(){},
	    created(){
	    	//좋아요 높은 순 9개 가져오기
	    	axios({
	    		url: "${pageContext.request.contextPath}/rest/search/listlike",
	    		method: "get",
	    		params:{
	    			hashTagNo: this.hashTagNo,
	    		}
	    	})
	    	.then(resp=>{
	    		this.searchLikeList = resp.data;
	    	});
	    	
	    	//최근순 가져오기
	    	axios({
	    		url: "${pageContext.request.contextPath}/rest/search/list",
	    		method: "get",
	    		params:{
	    			hashTagNo: this.hashTagNo,
	    			pageCount: this.pageCount,
	    			uptoNo: this.uptoNo,
	    			uptoNoAd: this.uptoNoAd,
	    		}
	    	})
	    	.then(resp=>{
	    		this.searchList = resp.data;
	    		this.pageCount++;
	    		
	    		for(var i=0; i<this.searchList.length; i++){
	    			if(this.searchList[i].type==0){
		    			this.uptoNo = this.searchList[i].boardNo;
		    			break;
	    			}
	    		}
	    		for(var i = 0; i<this.searchList.length; i++){
	    			if(this.searchList[i].type==1){
	    				this.uptoNoAd = this.searchList[i].boardNo;
	    				break;
	    			}
	    		}
	    	});
	    	
	    },
	    boeforeMount(){},
	    mounted(){
	    	//스크롤이벤트 최하단 도달 시 게시글 9개씩 더 읽어옴
        	$(window).scroll((resp)=>{
        		  var scrT = $(window).scrollTop();
        		  //onsole.log(scrT); //스크롤 값 확인용
        		  const bottom = ($(document).height() - $(window).height() - 10);
        		  //console.log("값 = " + bottom);
        		  if(scrT > bottom){
        			  this.loading();
        		  }
        	});
	    },
	    beforeUpdate(){},
	    updated(){},
	});
	app.mount("#app");
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>