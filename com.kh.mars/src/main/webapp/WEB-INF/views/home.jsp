<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
		.card-text{
            font-size: 0.8em;
        }

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
        
        .modalOn{
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
</style>

<article>
	<div id="app">
                <div class="container-fluid" style="position: relative;" :class="{'modalOn':detailView}">
                    <div class="row">
                        <div class="main-feed">
                        
                            <div v-for="(board, index) in boardList" :key="index" class="card mb-3" style="width: 470px; padding: 0px 0px;">
                                <div class="card-body">
                                    <p class="card-text">
                                    	<img v-if="board.boardListVO.writerProfile > 0" :src="'${pageContext.request.contextPath}/file/download/'+board.boardListVO.writerProfile" width="30" style="border-radius: 70%">
                                    	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
                                        {{board.boardListVO.memberNick}}
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
                                
                                <div class="card-body">
                                    <p class="card-text">
                                        <i v-if="board.boardListVO.isLike == 0" class="fa-regular fa-heart fa-lg" style="cursor: pointer;" @click="like(board.boardListVO.boardNo,index)"></i>
                                        <i v-else class="fa-solid fa-heart fa-lg" style="width: 15px!important;cursor: pointer;" @click="like(board.boardListVO.boardNo,index)"></i>
                                        &nbsp;
                                        <i class="fa-regular fa-comment fa-lg"></i>
                                        &nbsp;
                                        <i class="fa-regular fa-newspaper fa-lg"></i>

                                    </p>
                                    <p class="card-text" v-if="board.boardListVO.likecount > 0">
                                        좋아요 {{board.boardListVO.likecount}}개
                                    </p>
                                    <p class="card-text">
                                        {{board.boardListVO.memberNick}}
                                    </p>
                                    <p class="card-text">
                                        {{board.boardListVO.boardContent}}
                                    </p>
                                    <p class="card-text">
                                       <button class="btn" @click="detailViewOn(),boardDetailSearch(index)" style="font-size:12px;font-weight:normal;padding: 0 0;">댓글모두보기</button>
                                    </p>
                                    <p class="card-text text-muted" style="font-size: 0.4em;">
                                    	{{dateCount(board.boardListVO.boardDate)}}
                                    </p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div class="card-body" style="padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
                                    <span style="position: absolute; left:0; top: 6px; z-index: 30;">임티</span>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="댓글" v-model="replyContent" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @input="replyContent = $event.target.value" @keyup.enter="promise(index)">
                                        <button class="btn btn-outline-light reply-btn" type="button" id="button-addon2" style="border-top-right-radius: 0!important;" @click="promise(index)">작성</button>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <div class="row follow-recomand">

                    <div class="card border-light" style="width: 20rem;padding: 0 0;">
                        <div class="card-header">
                        	<c:if test="${memberProfile == 0}">
	                        	<img src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
	                        </c:if>
                        	${memberDto.memberNick}
                        </div>
                        <div class="card-body">
                          <h4 class="card-title">회원 추천</h4>
                          <p v-for="(recommend, index) in recommendList" class="card-text">
                          		<img v-if="recommend.targetAttach > 0" :src="'${pageContext.request.contextPath}/file/download/'+recommend.targetAttach" width="30" style="border-radius: 70%">
                                <img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
                          		{{recommend.targetNick}} <br>
                          		<span v-if="recommend.followcount > 0">
	                          		{{recommend.whoNick}}님 외 {{recommend.followcount}}명 팔로우
                          		</span>
                          		<span v-else>
                          			{{recommend.whoNick}}님이 팔로우 합니다
                          		</span>
                          </p>
                        </div>
                      </div>
                    
                </div>
                
                
                
                	<div v-if="detailView" class="container-fluid fullscreen active beforeanimation" :class="{'animation':animation}" @click="detailViewOn" style="position: fixed; z-index: 100;">
	                <div>
	                    <i class="fa-solid fa-x fa-2xl" style="position:absolute; right: 30px; top: 40px;cursor: pointer;"></i>
	                </div>
	                <div class="row center-position" style="width: 80%;">
	                    <div class="col-6 offset-1" style="padding-right: 0;padding-left: 0;" @click.stop>
	                                        
	                        <div id="detailCarousel" class="carousel slide" data-bs-ride="carousel" style="height: 40vw;" data-bs-interval="false">
	                            <div class="carousel-indicators">
                                     <button v-for="(attach, index) in boardList[boardDetailIndex].attachList" :key="index" type="button" data-bs-target="#detailCarousel" :data-bs-slide-to="index" :class="{'active':index==0}" :aria-current="index==0" :aria-label="'Slide'+(index+1)"></button>
                                </div>
                                <div class="carousel-inner" style="height:100%!important;background-color: var(--bs-dark);">
                                     <div v-for="(attach, index) in boardList[boardDetailIndex].attachList" :key="index" class="carousel-item" :class="{'active':index==0}" style="height:100%;background-color: var(--bs-dark); position:relative;">
                                         <img :src="'${pageContext.request.contextPath}/file/download/'+attach.attachNo" class="d-block position-absolute top-50 start-50 translate-middle" style="object-position: left; width: 101%;transform:translate(-50%,0);">
                                     </div>
                                </div>
                                <button v-if="boardList[boardDetailIndex].attachList.length>1" class="carousel-control-prev" type="button" data-bs-target="#detailCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                                </button>
                                <button v-if="boardList[boardDetailIndex].attachList.length>1" class="carousel-control-next" type="button" data-bs-target="#detailCarousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                                </button>
	                        </div>
	                    </div>
	                    <div class="col-4 board-detail-card" style="padding-left: 0; max-height: 30rem;" @click.stop>
	                                        
	                        <div class="card bg-light" style="height: 40vw; border-radius: 0;">
	                            <div class="card-header">{{boardDetail.memberNick}}</div>
	                            <div class="card-body card-scroll" style="height: 60%;">
	                                <h4 class="card-title"></h4>
	                                <p class="card-text">{{boardDetail.boardContent}}</p><br><br>
	                                <p v-for="(reply, index) in boardDetailReply" class="card-text show-icon">
	                                <img v-if="reply.replyMemberProfile > 0" :src="'${pageContext.request.contextPath}/file/download/'+reply.replyMemberProfile" width="30" style="border-radius: 70%">
                                	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
									{{reply.memberNick}}
									<i v-if="reply.replyMemberNo == ${memberDto.memberNo}" class="fa-solid fa-xmark" style="display:none;" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="targetInput(reply.replyNo)"></i>
									<br>
	                                {{reply.replyContent}}
	                                </p>
	                            </div>
	                            <div class="card-footer" style="background-color: white;height: 2.5em;padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
	                                <span style="position: absolute; left:0; top: 6px; z-index: 999;">임티</span>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" v-model="replyContent" placeholder="댓글" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @input="replyContent = $event.target.value" @keyup.enter="replyEnter">
	                                    <button class="btn btn-outline-light reply-btn" type="button" id="button-addon2" style="border-top-right-radius: 0!important;" @click="replyEnter">작성</button>
	                                  </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                
	            </div>
                <!-- Modal -->
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
				        <button type="button" class="btn btn-primary" @click="deleteReply">삭제</button>
				      </div>
				    </div>
				  </div>
				</div>
                
                
                
            </div>

            <script>
                const app = Vue.createApp({
                    data(){
                        return {
                        	//게시글 불러올때 쓰는 변수
                        	uptoNo:0,
        					pageCount: 1,
        					boardList:[],
        					recommendList:[],
        					
        					//게시글 상세보기용 변수
        					detailView:false,
                            animation:false,
                            boardDetail:null,
                            boardDetailReply:[],
                            boardDetailIndex:"",
                            
                            //댓글용 변수
                            replyContent:"",
                            superNo:0,
                            
                            replyTarget:"",
                            
                            
                            
                        };
                    },
                    computed:{
                        
                    },
                    methods:{
                    	
                    		//추가로 게시글 더불러오는 함수
                    		loading:_.debounce(function(){
	                    		axios({
	                        		url: "${pageContext.request.contextPath}/rest/board/main?pageCount=" + this.pageCount +"&uptoNo="+this.uptoNo,
	                        		method: "get"
	                        	})
	                        	.then(resp=>{
	                        		console.log(resp.data);
	                        		this.boardList.push(...resp.data);
	                        		this.pageCount++;
	                        	});
                    		},250),
                    		//게시글 올린시간계산 함수
                    		dateCount(date){
                    			const curTime = moment();
                    			const minus = (curTime - date) / (1000 * 60 * 60 * 24);
                    			
                    			if(minus >= 1){
                    				return Math.floor(minus) + "일 전";	
                    			}else{
                    				return "24시간 이내";
                    			}
                        	},
                        	
                        	//좋아요기능
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
                        			console.log(resp.data);
                        			console.log("index " + index);
                        			this.boardList[index].boardListVO.isLike = resp.data;
                        			if(resp.data > 0){
                        				this.boardList[index].boardListVO.likecount += 1
                        			}else{
                        				this.boardList[index].boardListVO.likecount -= 1
                        			}
                        		});
                        	},
                        	
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
                                    $('html, body').css({'overflow': 'auto', 'height': '100%'});
                                }   
                            },
                            //게시글 상세보기 정보 조회
                            boardDetailSearch(index){
                            	if(index != null){
                            		this.boardDetailIndex = index;
	                            	this.boardDetail = this.boardList[index].boardListVO;
                            	}
                            	console.log(this.boardDetail.boardNo);
                            	axios({
                            		url: "${pageContext.request.contextPath}/rest/board/detail/" + this.boardDetail.boardNo,
                            		method: "get"
                            	})
                            	.then(resp=>{
                            		console.log(resp.data);
                            		this.boardDetailReply = resp.data;
                            	});
                            },
                            //댓글 입력
                            replyEnter(){
                            	axios({
                            		url : "${pageContext.request.contextPath}/rest/reply/insert",
                            		method : "post",
                            		params : {
                            			replyContent : this.replyContent,
                            			superNo : this.superNo,
                            			boardNo : this.boardDetail.boardNo,
                            		}
                            	})
                            	.then(resp=>{
                            		console.log("아하");
                            		this.boardDetailSearch();
                            		this.replyContent = "";
                            	});
                            },
                            //댓글 지정
                            targetInput(replyNo){
                            	this.replyTarget = replyNo;
                            },
                            deleteReply(){
                            	axios({
                            		url : "${pageContext.request.contextPath}/rest/reply/delete/"+this.replyTarget,
                            		method : "delete",
                            	})
                            	.then(resp=>{
                            		$('#exampleModal').modal('hide');
                            		this.replyTarget = "";
                            		this.boardDetailSearch();
                            	});
                            	
                            },
                            
                            async promise(index){
                            	await this.replyEnter();
                            	await this.boardDetailSearch(index);
                            	await this.detailViewOn();
                            },
                            
                            /* async replyEnter2(){
                            	const resp = await axios({
                            		url : "${pageContext.request.contextPath}/rest/reply/insert",
                            		method : "post",
                            		params : {
                            			replyContent : this.replyContent,
                            			superNo : this.superNo,
                            			boardNo : this.boardDetail.boardNo,
                            		}
                            	});
                            	const resp2 = await axios({
                            		url: "${pageContext.request.contextPath}/rest/board/detail/" + this.boardDetail.boardNo,
                            		method: "get"
                            	})
                            	.then(resp=>{
                            		console.log(resp.data);
                            		this.boardDetailReply = resp.data;
                            	});
                            }, */
                    },
                    watch:{
                    },
                    beforeCreate(){},
                    created(){
                    	//첫 화면 로딩시 게시물 3개 로드
                    	axios({
                    		url: "${pageContext.request.contextPath}/rest/board/main?pageCount=" + this.pageCount +"&uptoNo="+this.uptoNo,
                    		method: "get"
                    	})
                    	.then(resp=>{
                    		this.boardList.push(...resp.data);
                    		this.pageCount++;
                    		this.uptoNo = this.boardList[0].boardListVO.boardNo;
                    	});
                    	
                    	//첫 화면 추천친구 목록 조회
                    	axios({
                    		url: "${pageContext.request.contextPath}/rest/follow/recommend_list",
                    		method:"get"
                    	})
                    	.then(resp=>{
                    		this.recommendList = resp.data;
                    	});
                    },
                    boeforeMount(){},
                    mounted(){
                    	//스크롤이벤트 최하단 도달 시 게시글 3개씩 더 읽어옴
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
</article>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>