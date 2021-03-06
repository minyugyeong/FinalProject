  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
		
        .follow-recomand{
            position: fixed;
            top: 100px;
            left: calc(100% - 800px);
        }
        .main-feed{
            position:absolute; 
            left: calc(100% - 1400px);
        }
        @media screen and (max-width: 1500px) {
            .follow-recomand{
           
            left: calc(100% - 600px);
            }
            .main-feed{
                left: calc(100% - 1200px);
            }
        }
        @media screen and (max-width: 1300px) {
            .follow-recomand{
           
            left: calc(100% - 400px);
            }
            .main-feed{
                left: calc(100% - 1000px);
            }
        }
        @media screen and (max-width: 1000px) {
            .follow-recomand{
                display: none;
            
            }
            .main-feed{
                left: 0;
            }
        }
        
        @media screen and (max-width: 1100px) {
            .board-detail-card{
                display: none;
            }
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
		
		.showment{
			display:block!important;
		}
		.hidelink{
			display:none!important;
		}
		.adLinkOpacity:hover{
			opacity:1!important;
			transition: all ease 0.3s 0s;
		}
		.moreText{
			display:inline-block!important;
		}
		.moreContent{
			height: auto!important;
		    overflow: auto!important;
		    width: auto!important;
		    white-space: normal!important;
		    text-overflow: inherit!important;
		}
		.childReply{
		padding-left: 35px;
		}
		.childShow{
		display: none;
		}
</style>

<article>
	<div id="app">
                <div class="container-fluid" style="position: relative;" :class="{'modalOn':detailView}">
                    <div class="row">
                        <div class="main-feed">
                        <div v-if="boardList.length==0" :class="{'showment':boardList.length==0}" style="font-size: 3em;display:none;">
                        	<br><br>
                        	<i class="fa-solid fa-rocket fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	?????? ?????? ???<br>
                        	???????????? ??????????????????
                        </div>
                        
                        <div v-for="(board, index) in boardList" :key="index">
                       
                            <div class="card mb-3" style="width: 470px; padding: 0px 0px;">
                                <div class="card-body">
                                    <p class="card-text">
                                    	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+board.boardListVO.memberNo" style="color:black;text-decoration:none;font-weight:900;">
	                                    	<img v-if="board.boardListVO.writerProfile > 0" :src="'${pageContext.request.contextPath}/file/download/'+board.boardListVO.writerProfile" width="30" height="30" style="border-radius: 70%">
	                                    	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
	                                        {{board.boardListVO.memberNick}}
                                    	</a>
                                    </p>
                                </div>
                                    <div v-bind:id="'carouselExampleControls'+index" class="carousel slide" data-bs-interval="false">
                                        <div class="carousel-indicators">
	                                            <button v-for="(attach, index2) in boardList[index].attachList" :key="index2" type="button" :data-bs-target="'#carouselExampleControls'+index" :data-bs-slide-to="index2" :class="{'active':index2==0}" :aria-current="index2==0" :aria-label="'Slide'+(index2+1)"></button>
                                        </div>
                                        <div class="carousel-inner">
	                                            <div v-for="(attach, index2) in boardList[index].attachList" :key="index2" class="carousel-item" :class="{'active':index2==0}" style="min-height: 468px; background-color: var(--bs-dark); position:relative;">
	                                                <img :src="'${pageContext.request.contextPath}/file/download/'+attach.attachNo" class="d-block position-absolute top-50 start-50 translate-middle" style="object-position: left; width: 101%;">
	                                            </div>
                                        </div>
                                        <button v-if="boardList[index].attachList.length>1" class="carousel-control-prev" type="button" v-bind:data-bs-target="'#carouselExampleControls'+index" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                        </button>
                                        <button v-if="boardList[index].attachList.length>1" class="carousel-control-next" type="button" v-bind:data-bs-target="'#carouselExampleControls'+index" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                
                                <div class="card-body" >
                                    <p class="card-text" style="margin-bottom:5px;">
                                        <i v-if="board.boardListVO.isLike == 0" class="fa-regular fa-heart fa-lg" style="cursor: pointer;" @click="like(board.boardListVO.boardNo,index)"></i>
                                        <i v-else class="fa-solid fa-heart fa-lg" style="width: 15px!important;cursor: pointer;" @click="like(board.boardListVO.boardNo,index)"></i>
                                        &nbsp;
                                        <i class="fa-regular fa-comment fa-lg" @click="detailViewOn(0,index),boardDetailSearch(index)" style="cursor: pointer;"></i>
                                        &nbsp;
                                        <a :href="'${pageContext.request.contextPath}/dm?targetNo='+board.boardListVO.memberNo" style="color:black;">
	                                        <i class="fa-regular fa-newspaper fa-lg"></i>
                                        </a>

                                    </p>
                                    <p class="card-text" v-if="board.boardListVO.likecount > 0" data-bs-toggle="modal" data-bs-target="#boardLikeList" @click="boardLikeList(board.boardListVO.boardNo)">
                                        ????????? {{board.boardListVO.likecount}}???
                                    </p>
                                    <p class="card-text" style="font-weight:900;margin-bottom:3px;">
                                    	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+board.boardListVO.memberNo" style="color:black;text-decoration:none;">
                                        {{board.boardListVO.memberNick}}
                                        </a>
                                    </p>
                                    <p class="card-text" style="height: 20px;overflow: hidden;width: 200px;white-space: nowrap;text-overflow: ellipsis;margin-bottom:5px;">
                                        <span class="textHide">
                                        	{{board.boardListVO.boardContent}}
                                        	<br v-if="board.hashtagList.length>0"><br v-if="board.hashtagList.length>0">
                                        	<a v-for="(tag,index3) in board.hashtagList" :href="'${pageContext.request.contextPath}/search/'+tag.hashtagNo" :key="index3">{{tag.hashtagName}}</a>
                                        </span>
                                    </p>
                                    
                                    <a style="color:grey;cursor: pointer;display:none;margin-bottom:10px;text-decoration:none;font-size:0.8em;">?????????</a>
                                    
                                    <p class="card-text">
                                       <button v-if="board.boardListVO" class="btn" @click="detailViewOn(0,index),boardDetailSearch(index)" style="font-size:12px;font-weight:normal;padding: 0 0;color:grey;">??????????????????</button>
                                    </p>
                                    <p class="card-text text-muted" style="font-size: 0.4em;">
                                    	{{dateCount(board.boardListVO.boardDate)}}
                                    </p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div v-if="board.boardListVO.boardIsReply==0" class="card-body" style="padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
                                    <span style="position: absolute; left:10px; top: 6px; z-index: 30;">
                                    	<label :for="'focusReply'+index">
											<i class="fa-solid fa-satellite-dish fa-lg focusInput"></i>
                                    	</label>
									</span>
                                    <div class="input-group">
                                        <input :id="'focusReply'+index" type="text" class="form-control" placeholder="?????? ??????..." style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @focus="replyContent = $event.target.value" @input="replyContent = $event.target.value" @keyup.enter="promise(index),$event.target.value = ''">
                                        <button class="btn btn-outline-light reply-btn" type="button" id="button-addon2" style="border-top-right-radius: 0!important;" @click="promise(index)">??????</button>
                                      </div>
                                </div>
                            </div>
                            
                            
                            <!-- ??????????????????????????? -->
                            <div v-if="adList[0]!=null&&index%3==2" class="card mb-3" style="width: 470px; padding: 0px 0px;">
                                <div class="card-body">
                                    <p class="card-text">
                                    	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+adList[((index+1)/3)-1].boardListVO.memberNo" style="color:black;text-decoration:none;">
	                                    	<img v-if="adList[((index+1)/3)-1].boardListVO.writerProfile>0" :src="'${pageContext.request.contextPath}/file/download/'+adList[((index+1)/3)-1].boardListVO.writerProfile" width="30" height="30" style="border-radius: 70%">
	                                    	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
	                                        {{adList[((index+1)/3)-1].boardListVO.memberNick}}
                                        </a>
                                    </p>
                                </div>
                                    <div v-bind:id="'adcarouselExampleControls'+index" class="carousel slide" data-bs-interval="false">
                                        <div class="carousel-indicators">
	                                            <button v-for="(attach, index2) in adList[((index+1)/3)-1].attachList" :key="index2" type="button" :data-bs-target="'#adcarouselExampleControls'+index" :data-bs-slide-to="index2" :class="{'active':index2==0}" :aria-current="index2==0" :aria-label="'Slide'+(index2+1)"></button>
                                        </div>
                                        <div class="carousel-inner">
	                                            <div v-for="(attach, index2) in adList[((index+1)/3)-1].attachList" :key="index2" class="carousel-item" :class="{'active':index2==0}" style="min-height: 468px; background-color: var(--bs-dark); position:relative;">
	                                                <img :src="'${pageContext.request.contextPath}/file/download/'+attach.attachNo" class="d-block position-absolute top-50 start-50 translate-middle" style="object-position: left; width: 101%;">
	                                            </div>
	                                            <a v-if="adList[((index+1)/3)-1].boardListVO.boardAdLink!=null&&adList[((index+1)/3)-1].boardListVO.boardAdLink!=''" :href="adList[((index+1)/3)-1].boardListVO.boardAdLink" class="adLinkOpacity" :class="{'hidelink':detailView}" style="color:white;position:absolute; bottom:0; width:100%; background-color:#eb6864; opacity:0.7;z-index:500;text-decoration:none;height:30px;padding-top: 0.2em;padding-left: 10px;">
	                                            	?????????????????? ??????
	                                            </a>
                                        </div>
                                        <button v-if="adList[((index+1)/3)-1].attachList.length>1" class="carousel-control-prev" type="button" v-bind:data-bs-target="'#adcarouselExampleControls'+index" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                        </button>
                                        <button v-if="adList[((index+1)/3)-1].attachList.length>1" class="carousel-control-next" type="button" v-bind:data-bs-target="'#adcarouselExampleControls'+index" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                
                                <div class="card-body">
                                    <p class="card-text" style="margin-bottom:5px;">
                                        <i v-if="adList[((index+1)/3)-1].boardListVO.isLike == 0" class="fa-regular fa-heart fa-lg" style="cursor: pointer;" @click="likeAd(adList[((index+1)/3)-1].boardListVO.boardNo,((index+1)/3)-1)"></i>
                                        <i v-else class="fa-solid fa-heart fa-lg" style="width: 15px!important;cursor: pointer;" @click="likeAd(adList[((index+1)/3)-1].boardListVO.boardNo,((index+1)/3)-1)"></i>
                                        &nbsp;
                                        <i class="fa-regular fa-comment fa-lg" @click="detailViewOn(1,((index+1)/3)-1),boardAdDetailSearch(adList[((index+1)/3)-1])" style="cursor: pointer;"></i>
                                        &nbsp;
                                        <a :href="'${pageContext.request.contextPath}/dm?targetNo='+adList[((index+1)/3)-1].boardListVO.memberNo" style="color:black;">
                                        <i class="fa-regular fa-newspaper fa-lg"></i>
                                        </a>

                                    </p>
                                    <p class="card-text" v-if="adList[((index+1)/3)-1].boardListVO.likecount > 0" data-bs-toggle="modal" data-bs-target="#adBoardLikeList" @click="boardAdLikeList(adList[((index+1)/3)-1].boardListVO.boardNo)">
                                        ????????? {{adList[((index+1)/3)-1].boardListVO.likecount}}???
                                    </p>
                                    <p class="card-text" style="font-weight:900;margin-bottom:3px;">
                                    	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+adList[((index+1)/3)-1].boardListVO.memberNo" style="color:black;text-decoration:none;">
                                        {{adList[((index+1)/3)-1].boardListVO.memberNick}}
                                        </a>
                                    </p>
                                    <p class="card-text" style="height: 20px;overflow: hidden;width: 200px;white-space: nowrap;text-overflow: ellipsis;margin-bottom:5px;">
                                    	<span class="textHide">
                                        	{{adList[((index+1)/3)-1].boardListVO.boardContent}}
                                        	<br v-if="adList[((index+1)/3)-1].hashtagList!=null&&adList[((index+1)/3)-1].hashtagList.length>0"><br v-if="adList[((index+1)/3)-1].hashtagList!=null&&adList[((index+1)/3)-1].hashtagList.length>0">
                                        	<a v-for="(tag,index3) in adList[((index+1)/3)-1].hashtagList" :href="'${pageContext.request.contextPath}/search/'+tag.hashtagNo" :key="index3">{{tag.hashtagName}}</a>
                                        </span>
                                    </p>
                                    
                                       <a style="color:grey;cursor: pointer;display:none;margin-bottom:10px;text-decoration:none;font-size:0.8em;">?????????</a>
                                       
                                    <p class="card-text">
                                       <button class="btn" @click="detailViewOn(1,((index+1)/3)-1),boardAdDetailSearch(adList[((index+1)/3)-1])" style="font-size:12px;font-weight:normal;padding: 0 0;color:grey;">??????????????????</button>
                                    </p>
                                    <p class="card-text text-muted" style="font-size: 0.4em;">
                                    	{{dateCount(adList[((index+1)/3)-1].boardListVO.boardDate)}}
                                    </p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div v-if="adList[((index+1)/3)-1].boardListVO.boardIsReply==0" class="card-body" style="padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
                                    <span style="position: absolute; left:10px; top: 6px; z-index: 30;">
                                    	<label :for="'foucsReplyAd'+((index+1)/3)-1">
	                                    	<i class="fa-solid fa-satellite-dish fa-lg"></i>
                                    	</label>
                                    </span>
                                    <div class="input-group">
                                        <input :id="'foucsReplyAd'+((index+1)/3)-1" type="text" class="form-control" placeholder="?????? ??????..." style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @focus="replyContent = $event.target.value"  @input="replyContent = $event.target.value" @keyup.enter="promiseAd(((index+1)/3)-1),$event.target.value = ''">
                                        <button class="btn btn-outline-light reply-btn" type="button" id="button-addon2" style="border-top-right-radius: 0!important;" @click="promiseAd(((index+1)/3)-1)">??????</button>
                                      </div>
                                </div>
                            </div>
                            
                             </div>
                            
                            
                        </div>
                    </div>
                    
                </div>

                <div class="row follow-recomand">

                    <div class="card border-light" style="width: 20rem;padding: 0 0;">
                        <div class="card-header">
                        	<a href="${pageContext.request.contextPath}/member/page?memberNo=${memberDto.memberNo}" style="color:black;text-decoration:none;">
                        	<c:if test="${memberProfile == 0}">
	                        	<img src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
	                        </c:if>
	                        <c:if test="${memberProfile != 0}">
	                        	<img src="${pageContext.request.contextPath}/file/download/${memberProfile}" width="30" height="30" style="border-radius: 70%;">
	                        </c:if>
                        	${memberDto.memberNick}
                        	</a>
                        </div>
                        <div class="card-body">
                          <h4 class="card-title" style="font-size: 1em;color: gray;font-weight: 100;">???????????? ?????? ??????</h4>
                          <div v-for="(recommend, index) in recommendList" class="card-text">
                          		<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+recommend.followTarget" style="text-decoration:none;color:black;position:relative;">
	                          		<img v-if="recommend.targetAttach > 0" :src="'${pageContext.request.contextPath}/file/download/'+recommend.targetAttach" width="30" height="30" style="border-radius: 70%;position:absolute;top:10%;">
	                                <img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:10%;">
		                          <p style="padding-left:3em;margin-bottom:0;">
	                          		{{recommend.targetNick}}
		                          </p>
                          		</a>
	                          		<p v-if="recommend.followcount > 0" style="font-size:0.9;padding-left:3em;color:grey;">
		                          		{{recommend.whoNick}}??? ??? {{recommend.followcount}}??? ?????????
	                          		</p>
	                          		<p v-if="recommend.followcount == 0" style="font-size:0.9;padding-left:3em;color:grey;">
	                          			{{recommend.whoNick}}?????? ????????? ?????????
	                          		</p>
	                          		<p v-if="recommend.followcount == -1" style="font-size:0.9;padding-left:3em;color:grey;">
	                          			{{recommend.whoNick}} ??????
	                          		</p>
	                          		<p v-if="recommend.followcount == -2" style="font-size:0.9;padding-left:3em;color:grey;">
	                          			???????????? ???????????? ???????????????!!
	                          		</p>
                          </div>
                        </div>
                      </div>
                    
                </div>
                
                
                <!-- ???????????? ????????? -->
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
                                     <a v-if="boardDetail.boardListVO.boardAdLink!=null&&boardDetail.boardListVO.boardAdLink!=''" :href="boardDetail.boardListVO.boardAdLink" class="adLinkOpacity" :class="{'hidelink':!detailView}" style="color:white;position:absolute; bottom:0; width:100%; background-color:#eb6864; opacity:0.7;z-index:500;text-decoration:none;height:30px;padding-top: 0.2em;padding-left: 10px;">
                                     	?????????????????? ??????
                                     </a>
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
		                            	<span>
			                            	{{boardDetail.boardListVO.memberNick}}
		                            	</span>
	                            	</a>
	                            	<a :href="'${pageContext.request.contextPath}/board/edit?boardNo='+boardDetail.boardListVO.boardNo" v-if="boardDetail.boardListVO.memberNo==${login}&&boardViewType!=1" class="btn btn-outline-primary" style="position:absolute; right:50px;margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;">
										??????
                            		</a>
                            		<a data-bs-toggle="modal" data-bs-target="#boardDeleteModal" v-if="boardDetail.boardListVO.memberNo==${login}&&boardViewType!=1" class="btn btn-primary" style="position:absolute; right:0;margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;">
										??????
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
	                                	??? ?????? ????????? ???????????????.
	                                	</label>
	                                </div>
	                                
	                                <div v-if="boardDetail.boardListVO.boardIsReply==0" v-for="(reply, index) in boardDetailReply" class="card-text show-icon" :class="{'childReply':reply.superNo!=0,'childShow':reply.superNo>0}" style="position:relative;">
	                                	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+reply.replyMemberNo" style="text-decoration:none;color:black;position:relative;">
			                                <img v-if="reply.replyMemberProfile > 0" :src="'${pageContext.request.contextPath}/file/download/'+reply.replyMemberProfile" width="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                <p style="padding-left:3em;margin-bottom:1px;font-size:0.9em;font-weight:bold;">
											{{reply.memberNick}}
	                                	</p>
	                                	</a>
	                                	<p style="padding-left:2.9em;margin-bottom:5px;font-size:0.9em;">
			                                {{reply.replyContent}}
	                                	</p>
	                                	<p style="padding-left:3.1em;margin-bottom:5px;font-size:0.85em;color:grey;">
	                                		<a v-if="reply.superNo==0" @click="re_reply(reply.replyNo)">????????????</a>&nbsp;
											<i v-if="reply.replyMemberNo == ${memberDto.memberNo}" class="fa-solid fa-xmark" style="display:none;z-index:100;" data-bs-toggle="modal" data-bs-target="#exampleModal" @click.stop="targetInput(reply.replyNo)"></i>
										</p>
										<p v-if="reply.superNo==0">
											<span @click="showReply(reply.replyNo,index)" style="padding-left:3.1em;font-size:0.85em;color:grey;">{{replyStatus(index)}}</span>
										</p>
	                                </div>
	                                
	                            </div>
	                            <hr style="margin-top: 0; margin-bottom: 0;">
	                            <div class="card-body">
                                    <p class="card-text">
                                        <i v-if="detailViewType==1&&boardDetail.boardListVO.isLike==0" class="fa-regular fa-heart fa-lg" style="cursor: pointer;" @click="likeAd(boardDetail.boardListVO.boardNo,detailViewIndex)"></i>
                                        <i v-if="detailViewType==1&&boardDetail.boardListVO.isLike>0" class="fa-solid fa-heart fa-lg" style="width: 15px!important;cursor: pointer;" @click="likeAd(boardDetail.boardListVO.boardNo,detailViewIndex)"></i>
                                        <i v-if="detailViewType==0&&boardDetail.boardListVO.isLike==0" class="fa-regular fa-heart fa-lg" style="cursor: pointer;" @click="like(boardDetail.boardListVO.boardNo,detailViewIndex)"></i>
                                        <i v-if="detailViewType==0&&boardDetail.boardListVO.isLike>0" class="fa-solid fa-heart fa-lg" style="width: 15px!important;cursor: pointer;" @click="like(boardDetail.boardListVO.boardNo,detailViewIndex)"></i>
                                        &nbsp;
                                        <label for="detailReply">
                                        <i class="fa-regular fa-comment fa-lg" style="cursor: pointer;"></i>
                                        </label>
                                        &nbsp;
                                        <a :href="'${pageContext.request.contextPath}/dm?targetNo='+boardDetail.boardListVO.memberNo" style="color:black;">
                                        <i class="fa-regular fa-newspaper fa-lg"></i>
										</a>
                                    </p>
                                    <p class="card-text" v-if="boardDetail.boardListVO.likecount > 0"  @click="boardDetailLikeList(boardDetail.boardListVO.boardNo)" data-bs-toggle="modal" data-bs-target="#boardDetailLikeList">
                                        ????????? {{boardDetail.boardListVO.likecount}}???
                                    </p>
                                </div>
	                            <div v-if="boardDetail.boardListVO.boardIsReply==0" class="card-footer" style="background-color: white;height: 2.5em;padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
	                                <span style="position: absolute; left:10px; top: 6px; z-index: 999;">
	                                	<label for="detailReply">
		                                	<i class="fa-solid fa-satellite-dish fa-lg"></i>
	                                	</label>
	                                </span>
	                                <div class="input-group">
	                                    <input id="detailReply" type="text" class="form-control" v-model="replyContent" v-bind:placeholder="replyPlaceholder" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @input="replyContent = $event.target.value" @keyup.enter="replyEnter(0)">
	                                    <button class="btn btn-outline-light reply-btn" type="button" id="button-addon2" style="border-top-right-radius: 0!important;" @click="replyEnter(0)">??????</button>
	                                  </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	            </div>
                <!-- ?????? Modal -->
				<div class="modal fade" id="exampleModal" tabindex="200" aria-labelledby="exampleModalLabel" aria-hidden="true" @click.stop="targetInput('')">
				  <div class="modal-dialog">
				    <div class="modal-content" style="width:400px;">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">?????? ??????</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        ?????????????????????????
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" @click.stop="targetInput('')">??????</button>
				        <button type="button" class="btn btn-primary" @click="deleteReply">??????</button>
				      </div>
				    </div>
				  </div>
				</div>
                
                <!-- ?????? ????????? ????????? ????????? Modal -->
                <div class="modal fade" id="boardLikeList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">?????????</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <p v-for="(bll, index) in boardLike" v:bind:key="index">
				        	<img v-if="bll.attachNo > 0" :src="'${pageContext.request.contextPath }/file/download/'+ bll.attachNo" width="30" height="30" style="border-radius: 70%;">
				        	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" height="30" style="border-radius: 70%;">
				        	<a :href="'${pageContext.request.contextPath }/member/page?memberNo='+bll.memberNo">{{bll.memberNick}}</a>
				        </p>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- ?????? ????????? ????????? ????????? Modal -->
				<div class="modal fade" id="adBoardLikeList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">?????????</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				       <p v-for="(ball,index) in boardAdLike" v:bind:key="index">
				       		<img v-if="ball.attachNo >0" :src="'${pageContext.request.contextPath }/file/download/'+ ball.attachNo" width="30" height="30" style="border-radius: 70%;">
				       		<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" height="30" style="border-radius: 70%;">
				        	<a :href="'${pageContext.request.contextPath }/member/page?memberNo='+ball.memberNo">{{ball.memberNick}}</a>
				       </p>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<!-- ????????? ?????? Modal -->
				<div class="modal fade" id="boardDeleteModal" tabindex="200" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style="width:400px;">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">?????? ??????</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        ?????????????????????????
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
				        <a class="btn btn-primary" :href="'${pageContext.request.contextPath}/board/delete?boardNo='+boardDetail.boardListVO.boardNo">??????</a>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- ????????? ?????? Modal -->
				<div class="modal fade" id="boardDetailLikeList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">?????????</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <p v-for="(bll, index) in boardLike" v:bind:key="index">
				        	<img v-if="bll.attachNo >0" :src="'${pageContext.request.contextPath }/file/download/'+ bll.attachNo" width="30" height="30" style="border-radius: 70%;">
				        	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" height="30" style="border-radius: 70%;">
				        	<a :href="'${pageContext.request.contextPath }/member/page?memberNo='+bll.memberNo">{{bll.memberNick}}</a>
				        </p>
				      </div>
				    </div>
				  </div>
				</div>
				                
                
            </div>

            <script>
                const app = Vue.createApp({
                    data(){
                        return {
                        	//????????? ???????????? ?????? ??????
                        	uptoNo:0,
        					pageCount: 1,
        					boardList:[],
        					
        					//???????????? ?????????
        					recommendList:[],
        					
        					//????????? ??????????????? ??????
        					detailView:false,
                            animation:false,
                            boardDetail:{
                        		attachList:[],
                        		boardListVO:{},
                        		hashtagList:[],
                       		 },
                            boardDetailReply:[],
                            boardDetailIndex:"",
                            detailViewType:"",
                            detailViewIndex:"",
                            
                            //????????? ??????
                            replyContent:"",
                            superNo:0,
                            replyTarget:"",
                            replyPlaceholder:"?????? ??????",
                           
                            
							//?????? ???????????? ?????? 5?????? ????????? ????????? ??????
							adList:[{
	                            	attachList:[],
	                            	boardListVO:{},
							}],
							type:"",
							
							//?????? ????????? ????????? ?????? ??????
                            boardLike: [],
                            
                            //?????? ????????? ????????? ?????? ??????
                            boardAdLike: [],
                            
                        };
                    },
                    computed:{
                        
                    },
                    methods:{
                    		//????????? ????????? ??????????????? ??????
                    		loading:_.debounce(function(){
	                    		axios({
	                        		url: "${pageContext.request.contextPath}/rest/board/main?pageCount=" + this.pageCount +"&uptoNo="+this.uptoNo,
	                        		method: "get"
	                        	})
	                        	.then(resp=>{
	                        		this.boardList.push(...resp.data);
	                        		this.pageCount++;
	                        		if(this.boardList.length % 15 == 0){
	                        			this.adLoading();
	                        		}
	                        	});
                    		},250),
                    		//?????? ???????????????
                    		adLoading:_.debounce(function(){
	                    		axios({
	                        		url: "${pageContext.request.contextPath}/rest/board_ad/main",
	                        		method: "get"
	                        	})
	                        	.then(resp=>{
	                        		this.adList.push(...resp.data);
	                        	});
                    		},250),
                    		//????????? ?????????????????? ??????
                    		dateCount(date){
                    			const curTime = moment();
                    			const minus = (curTime - date) / (1000 * 60 * 60 * 24);
                    			
                    			if(minus >= 1){
                    				return Math.floor(minus) + "??? ???";	
                    			}else{
                    				return "24?????? ??????";
                    			}
                        	},
                        	//???????????????
                        	like(likeNo,index){
                        		const boardNo = likeNo;
                        		axios({
                        			url: "${pageContext.request.contextPath}/rest/board/like",
                        			method: "post",
                        			data:{ 
                        				boardNo : boardNo,
                        			}
                        		})
                        		.then(resp=>{
                        			this.boardList[index].boardListVO.isLike = resp.data;
                        			if(resp.data > 0){
                        				this.boardList[index].boardListVO.likecount += 1
                        			}else{
                        				this.boardList[index].boardListVO.likecount -= 1
                        			}
                        			const alram = {
            	        					type:3,
            	        					target: this.boardList[index].boardListVO.memberNo,
            	        					messageType:4,//??????????????? ?????? 1-?????? ????????? 2-??????????????? 3-dm?????? 4-?????? ??????
            	        			}
            	        			const jsonAlram = JSON.stringify(alram);
            	        			socket.send(jsonAlram);
                        		});
                        	},
                        	//?????? ???????????????
                        	likeAd(likeNo,index){
                        		const boardNo = likeNo;
                        		axios({
                        			url: "${pageContext.request.contextPath}/rest/board_ad/like",
                        			method: "post",
                        			data:{ 
                        				boardNo : boardNo,
                        			}
                        		})
                        		.then(resp=>{
                        			this.adList[index].boardListVO.isLike = resp.data;
                        			if(resp.data > 0){
                        				this.adList[index].boardListVO.likecount += 1
                        			}else{
                        				this.adList[index].boardListVO.likecount -= 1
                        			}
                        			const alram = {
            	        					type:3,
            	        					target: this.adList[index].boardListVO.memberNo,
            	        					messageType:4,//??????????????? ?????? 1-?????? ????????? 2-??????????????? 3-dm?????? 4-?????? ??????
            	        			}
            	        			const jsonAlram = JSON.stringify(alram);
            	        			socket.send(jsonAlram);
                        		});
                        	},
                        	// ???????????? ????????? ?????? ??????
                        	detailViewOn(type,index){
                        		this.detailViewType = type;
                        		this.detailViewIndex = index;
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
                                    this.detailViewType = "";
                            		this.detailViewIndex = "";
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
                            //????????? ???????????? ?????? ??????
                            boardDetailSearch(index){
                            	if(index != null){
                            		this.boardDetailIndex = index;
	                            	this.boardDetail = this.boardList[index];
                            	}
                            	axios({
                            		url: "${pageContext.request.contextPath}/rest/board/detail_reply/" + this.boardDetail.boardListVO.boardNo,
                            		method: "get"
                            	})
                            	.then(resp=>{
                            		this.boardDetailReply = resp.data;
                            		this.type = 0;
                            	});
                            },
                            boardAdDetailSearch(board){
                            	if(board != null){
		                            this.boardDetail = board;
                            	}
                            	axios({
                            		url: "${pageContext.request.contextPath}/rest/board_ad/detail_reply/" + this.boardDetail.boardListVO.boardNo,
                            		method: "get"
                            	})
                            	.then(resp=>{
                            		this.boardDetailReply = resp.data;
                            		this.type = 1;
                            	});
                            },
                            
                            
                            //?????? ??????
                            replyEnter(boardNo){
	                            	let boardNo2;
                            	if(this.type==0){
	                            	if(boardNo != 0){
	                            		boardNo2 = boardNo;
	                            	}else{
	                            		boardNo2 = this.boardDetail.boardListVO.boardNo;
	                            	}
	                            	axios({
	                            		url : "${pageContext.request.contextPath}/rest/reply/insert",
	                            		method : "post",
	                            		params : {
	                            			replyContent : this.replyContent,
	                            			superNo : this.superNo,
	                            			boardNo : boardNo2,
	                            		}
	                            	})
	                            	.then(resp=>{
	                            		this.boardDetailSearch();
	                            		this.replyContent = "";
	                            		this.superNo = 0;
                   	            		this.replyPlaceholder = "?????? ??????"
	                            		const alram = {
                	        					type:3,
                	        					target: this.boardDetail.boardListVO.memberNo,
                	        					messageType:4,//??????????????? ?????? 1-?????? ????????? 2-??????????????? 3-dm?????? 4-?????? ??????
                	        			}
                	        			const jsonAlram = JSON.stringify(alram);
                	        			socket.send(jsonAlram);
	                            	});
                            	}else{
                            		//?????? ?????? ??????
                                   	if(boardNo != 0){
                                   		boardNo2 = boardNo;
                                   	}else{
                                   		boardNo2 = this.boardDetail.boardListVO.boardNo;
                                   	}
                                   	axios({
                               			url : "${pageContext.request.contextPath}/rest/reply/insert_ad",
                               			method : "post",
                               			params : {
                               				replyContent : this.replyContent,
                               				superNo : this.superNo,
                               				boardNo : boardNo2,
                               			}
                               		})
                               		.then(resp=>{
                               			this.boardAdDetailSearch();
                   	            		this.replyContent = "";
                   	            		this.superNo = 0;
                   	            		this.replyPlaceholder = "?????? ??????"
                	            		const alram = {
                	        					type:3,
                	        					target: this.boardDetail.boardListVO.memberNo,
                	        					messageType:4,//??????????????? ?????? 1-?????? ????????? 2-??????????????? 3-dm?????? 4-?????? ??????
                	        			}
                	        			const jsonAlram = JSON.stringify(alram);
                	        			socket.send(jsonAlram);
                               		});
                            	}
                            },
                            //?????? ?????? ??????
                            replyAdEnter(boardNo, boardAd){
                            	let boardNo2;
                            	if(boardNo != 0){
                            		boardNo2 = boardNo;
                            	}else{
                            		boardNo2 = this.boardDetail.boardListVO.boardNo;
                            	}
                            	axios({
                        			url : "${pageContext.request.contextPath}/rest/reply/insert_ad",
                        			method : "post",
                        			params : {
                        				replyContent : this.replyContent,
                        				superNo : this.superNo,
                        				boardNo : boardNo2,
                        			}
                        		})
                        		.then(resp=>{
                        			this.boardAdDetailSearch(boardAd);
            	            		this.replyContent = "";
            	            		this.superNo = 0;
            	            		this.replyPlaceholder = "?????? ??????"
            	            		const alram = {
            	        					type:3,
            	        					target: boardAd.boardListVO.memberNo,
            	        					messageType:4,//??????????????? ?????? 1-?????? ????????? 2-??????????????? 3-dm?????? 4-?????? ??????
            	        			}
            	        			const jsonAlram = JSON.stringify(alram);
            	        			socket.send(jsonAlram);
                        		})
                            },
                            //?????? ??????
                            targetInput(replyNo){
                            	this.replyTarget = replyNo;
                            },
                            
                            deleteReply(type){
                            	axios({
                            		url : "${pageContext.request.contextPath}/rest/reply/delete/"+this.replyTarget,
                            		method : "delete",
                            	})
                            	.then(resp=>{
                            		$('#exampleModal').modal('hide');
                            		this.replyTarget = "";
                            		if(this.type==0){
	                            		this.boardDetailSearch();
                            		}else{
                            			this.boardAdDetailSearch(this.boardDetail.boardListVO.boardNo);
                            		}
                            		
                            	});
                            },
                            //???????????? ??????????????????
                            async promise(index){
                            	const boardNo = this.boardList[index].boardListVO.boardNo;
                            	await this.replyEnter(boardNo);
                            	await this.boardDetailSearch(index);
                            	await this.detailViewOn();
                            },
                            async promiseAd(index){
                            	const boardNo = this.adList[index].boardListVO.boardNo;
                            	const boardAd = this.adList[index];
                            	await this.replyAdEnter(boardNo, boardAd);
                            	await this.boardAdDetailSearch(boardAd);
                            	await this.detailViewOn();
                            },
                            
                            //?????? ???????????? ???????????????
                           adCountFunc:_.debounce(function(){
                            	axios({
                            		url:"${pageContext.request.contextPath}/rest/board_ad/ad_count",
                            		method:"Post",
                            		params:{
                            			boardAdNo:this.adList[this.pageCount-2].boardListVO.boardNo,
                            		}
                            	})
                            	.then(resp=>{
                            		console.log("?????? ????????? ???");
                            	});
                            }, 250),
                            
                            //??????
                            re_reply(replyNo){
                        	if(replyNo==this.superNo){
                        		this.superNo=0;
                               	this.replyPlaceholder = "?????? ??????"
                        	}else{
	                           	this.superNo=replyNo;
	                           	this.replyPlaceholder = "?????? ??????"
	                           	document.getElementById('detailReply').focus();
                        	}
                           	
                           },
                           
                           //?????? ?????????
                          showReply(replyNo,index){
                        	  
                        	  let arrayIndex = [];
                        	  let tmp = index+1;
                        	  if(index!=this.boardDetailReply.length){
                        		  console.log(replyNo);
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
		                        	 console.log("-1?????????");
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
	                        	  console.log("+?????????");
                        	  }
                        	  console.log(arrayIndex);
                           },
                           
                           //?????? ????????? ?????? ????????????
                           replyStatus(index){
								if(index==this.boardDetailReply.length) return;
                        	   if(this.boardDetailReply[index+1]!=null&&this.boardDetailReply[index+1].superNo>0){
                        		   return "?????? ??????";
                        	   }else if(this.boardDetailReply[index+1]!=null&&this.boardDetailReply[index+1].superNo==0){
                        		   return "";
                        	   }else if(this.boardDetailReply[index+1]!=null&&this.boardDetailReply[index+1].superNo<0){
                        		   return "?????? ?????????";
                        	   }
                        	  
                           },
                           
                            
                            //?????? ????????? ????????? ??????
                            boardLikeList(boardNo){
                        	   axios({
                        		   url : "${pageContext.request.contextPath}/rest/board/board_like",
                        		   method:"get",
                        		   params:{
                        			   boardNo : boardNo
                        		   }
                        	   })
                        	   .then(resp=>{
                        		   this.boardLike=resp.data;
                        	   });
                           },
                           
                           //?????? ????????? ????????? ??????
                           boardAdLikeList(boardNo){
                        	   axios({
                        		   url : "${pageContext.request.contextPath}/rest/board/board_ad_like",
                        		   method: "get",
                        		   params :{
                        			   boardNo : boardNo
                        		   }
                        	   })
                        	   .then(resp=>{
                        		  this.boardAdLike=resp.data; 
                        	   });
                           },
                           
                           boardDetailLikeList(boardNo){
                           	if(this.detailViewType == 0){
                            	   axios({
                            		   url : "${pageContext.request.contextPath}/rest/board/board_like",
                            		   method:"get",
                            		   params:{
                            			   boardNo : boardNo
                            		   }
                            	   })
                            	   .then(resp=>{
                            		   this.boardLike=resp.data;
                            	   });
                                }
                                else{
                                	axios({
                             		   url : "${pageContext.request.contextPath}/rest/board/board_ad_like",
                             		   method: "get",
                             		   params :{
                             			   boardNo : boardNo
                             		   }
                             	   })
                             	   .then(resp=>{
                             		  this.boardLike=resp.data; 
                             	   });
                                }
                          },
                            
                            
                    },
                    watch:{
                    	
                    },
                    beforeCreate(){},
                    created(){
                    	
                    	//??? ?????? ????????? ????????? 3??? ??????
                		axios({
                    		url: "${pageContext.request.contextPath}/rest/board/main?pageCount=" + this.pageCount +"&uptoNo="+this.uptoNo,
                    		method: "get"
                    	})
                    	.then(resp=>{
                    		if(resp.data.length != 0){
                    		this.boardList.push(...resp.data);
                    		this.pageCount++;
                    		this.uptoNo = this.boardList[0].boardListVO.boardNo;
                    		}
                    	});
                    	
                    	//??? ?????? ???????????? ?????? ??????
                    	axios({
                    		url: "${pageContext.request.contextPath}/rest/follow/recommend_list",
                    		method:"get"
                    	})
                    	.then(resp=>{
                    		this.recommendList = resp.data;
                    	});
                    	
                    	//????????? ????????? ??????????????? 5??? ??????
                    	axios({
                    		url : "${pageContext.request.contextPath}/rest/board_ad/main",
                    		method : "get",
                    	})
                    	.then(resp=>{
                    		this.adList = resp.data;
                    	})
                    },
                    boeforeMount(){},
                    mounted(){
                    	//?????????????????? ????????? ?????? ??? ????????? 3?????? ??? ?????????
                    	$(window).scroll((resp)=>{
                    		  var scrT = $(window).scrollTop();
                    		  //onsole.log(scrT); //????????? ??? ?????????
                    		  const bottom = ($(document).height() - $(window).height() - 10);
                    		  //console.log("??? = " + bottom);
                    		  if(scrT > bottom){
                    			  this.loading();
                    			  this.adCountFunc();  
                    		  }
                    	})
                    	
                		
                    },
                    beforeUpdate(){},
                    updated(){
                    	console.log("?????? ????????????");
                    	console.log($(".textHide").width());
                    	$(".textHide").each(function(){
                    		if($(this).width()>200||$(this).height()>20){
	                    		$(this).parent("p").next("a").addClass("moreText");
                    		}
                    	});
                    	$(".moreText").unbind("click");
                    	$(".moreText").click(function(){
                    		console.log("????????????");
                    		if($(this).prev("p").hasClass("moreContent")){
                    			$(this).prev("p").removeClass("moreContent");
                    		}else{
	                    		$(this).prev("p").addClass("moreContent");
                    		}
                    		
                    	});
                    	
                    },
                });
                app.mount("#app");
            </script>
</article>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>