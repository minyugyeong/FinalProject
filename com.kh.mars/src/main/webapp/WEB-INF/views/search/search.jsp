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
	                <div v-if="searchLikeList[0] != null" class="media-height" style="margin-right: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[0].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[0].boardNo,searchLikeList[0].type)">
	                </div>
	                <div v-if="searchLikeList[1] != null" class="media-height">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[1].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[1].boardNo,searchLikeList[1].type)">
	                </div>
	                <div v-if="searchLikeList[2] != null" class="media-height" style="margin-left: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[2].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[2].boardNo,searchLikeList[2].type)">
	                </div>
	            </div>
        	<div v-for="(board, index) in searchLikeList" class="media-height" :key="index">
	            <div v-if="index%3==2" style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchLikeList[index+1] != null" class="media-height" style="margin-right: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[index+1].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[index+1].boardNo,searchLikeList[index+1].type)">
	                </div>
	                <div v-if="searchLikeList[index+2] != null" class="media-height">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[index+2].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[index+2].boardNo,searchLikeList[index+2].type)">
	                </div>
	                <div v-if="searchLikeList[index+3] != null" class="media-height" style="margin-left: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchLikeList[index+3].attachNo" style="width:100%; height:250px;" @click="promise(searchLikeList[index+3].boardNo,searchLikeList[index+3].type)">
	                </div>
	            </div>
        	</div>
        	
        		<div v-if="searchList[0] != null">
	        		최근 게시글
        		</div>
	            <div style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchList[0] != null" class="media-height" style="margin-right: 10px; ">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[0].attachNo" style="width:100%; height:250px;" @click="promise(searchList[0].boardNo,searchList[0].type)">
	                </div>
	                <div v-if="searchList[1] != null" class="media-height" >
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[1].attachNo" style="width:100%; height:250px;" @click="promise(searchList[1].boardNo,searchList[1].type)">
	                </div>
	                <div v-if="searchList[2] != null" class="media-height" style="margin-left: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[2].attachNo" style="width:100%; height:250px;" @click="promise(searchList[2].boardNo,searchList[2].type)">
	                </div>
	            </div>
        	<div v-for="(board, index) in searchList" :key="index">
	            <div v-if="index%3==2" style="margin-bottom:10px;display: flex;flex-direction: row; width: 100%;">
	                <div v-if="searchList[index+1] != null" class="media-height" style="margin-right: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[index+1].attachNo" style="width:100%; height:250px;" @click="promise(searchList[index+1].boardNo,searchList[index+1].type)">
	                </div>
	                <div v-if="searchList[index+2] != null" class="media-height">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[index+2].attachNo" style="width:100%; height:250px;" @click="promise(searchList[index+2].boardNo,searchList[index+2].type)">
	                </div>
	                <div v-if="searchList[index+3] != null" class="media-height" style="margin-left: 10px;">
	                    <img :src="'${pageContext.request.contextPath}/file/download/'+searchList[index+3].attachNo" style="width:100%; height:250px;" @click="promise(searchList[index+3].boardNo,searchList[index+3].type)">
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
	                            <div class="card-header">{{boardDetail.boardListVO.memberNick}}</div>
	                            <div class="card-body card-scroll" style="height: 60%;">
	                                <h4 class="card-title"></h4>
	                                <p class="card-text">{{boardDetail.boardListVO.boardContent}}</p><br><br>
	                                <div v-for="(reply, index) in boardDetailReply" class="card-text show-icon" style="position:relative;">
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
	                                		<a>답글</a>&nbsp;
											<i v-if="reply.replyMemberNo == ${memberDto.memberNo}" class="fa-solid fa-xmark" style="display:none;z-index:100;" data-bs-toggle="modal" data-bs-target="#exampleModal" @click.stop="targetInput(reply.replyNo)"></i>
										<p>
	                                </div>
	                            </div>
	                            <div class="card-footer" style="background-color: white;height: 2.5em;padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
	                                <span style="position: absolute; left:0; top: 6px; z-index: 999;">임티</span>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" v-model="replyContent" placeholder="댓글" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2" @input="replyContent = $event.target.value" @keyup.enter="replyEnter(boardDetail.boardListVO.boardNo)">
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


<script>

	const app = Vue.createApp({
	    data(){
	        return {
	        	
	        	//검색목록 띄우기용 변수
	        	searchLikeList:[],
	        	searchList:[],
	        	
				hashTagNo: ${hashTagNo},
				uptoNo:0,
				pageCount: 1,
				
				
				// 게시글 상세보기 변수
				detailView:false,
                animation:false,
                boardDetail:null,
                boardDetailReply:[],
                boardDetailType:"",
                
                
             	//댓글용 변수
                replyContent:"",
                superNo:0,
                
                replyTarget:"",
                
				
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
	    		}
	    	})
	    	.then(resp=>{
	    		this.searchList = resp.data;
	    		this.pageCount++;
	    		this.uptoNo = this.searchList[0].boardNo;
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