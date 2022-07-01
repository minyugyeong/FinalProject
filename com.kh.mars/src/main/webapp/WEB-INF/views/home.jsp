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
</style>

<article>
	<div id="app">
                <div class="container-fluid" style="position: relative;">
                    <div class="row">
                        <div class="main-feed">
                        
                            <div v-for="(board, index) in boardList" :key="index" class="card mb-3" style="width: 470px; padding: 0px 0px;">
                                <div class="card-body">
                                    <p class="card-text">
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
                                    <p class="card-text">
                                        {{board.boardListVO.memberNick}}
                                    </p>
                                    <p class="card-text">
                                        {{board.boardListVO.boardContent}}
                                    </p>
                                    <p class="card-text">
                                        댓글모두보기
                                    </p>
                                    <p class="card-text" v-if="board.boardListVO.replyContent != null">
                                        {{board.boardListVO.replyNick}} : {{board.boardListVO.replyContent}}
                                    </p>
                                    <p class="card-text text-muted" style="font-size: 0.4em;">
                                    	{{dateCount(board.boardListVO.boardDate)}}
                                    </p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div class="card-body" style="padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
                                    <span style="position: absolute; left:0; top: 6px; z-index: 999;">임티</span>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="댓글" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button class="btn btn-primary" type="button" id="button-addon2" style="border-top-right-radius: 0!important;">작성</button>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <div class="row follow-recomand">

                    <div class="card border-light mb-3" style="width: 20rem;">
                        <div class="card-header">
                        	<c:if test="${memberProfile == 0}">
	                        	<img src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;">
	                        </c:if>
                        	${memberDto.memberNick}
                        </div>
                        <div class="card-body">
                          <h4 class="card-title">회원 추천</h4>
                          <p v-for="(recommend, index) in recommendList" class="card-text">
                          		{{recommend.targetNick}}
                          </p>
                        </div>
                      </div>
                    
                </div>
                
               
                
            </div>

            <script>
                const app = Vue.createApp({
                    //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
                    data(){
                        return {
                        	uptoNo:0,
        					pageCount: 1,
        					boardList:[],
        					recommendList:[],
                        };
                    },
                    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
                    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
                    computed:{
                        
                    },
                    //method : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
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
                        	
                        	like(likeNo,index){
                        		const boardNo = likeNo;
                        		axios({
                        			url: "${pageContext.request.contextPath}/rest/board/like",
                        			method: "post",
                        			params:{
                        				boardNo : boardNo,
                        			}
                        		})
                        		.then(resp=>{
                        			console.log(resp.data);
                        			console.log("index " + index);
                        			this.boardList[index].boardListVO.isLike = resp.data;
                        		});
                        	},
                    },
                    // watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
                    watch:{
                        
                    },
                    //데이터 및 구성요소 초기화 전
                    beforeCreate(){},
                    //데이터 및 구성요소 초기화 후, data에 접근 가능하므로 ajax를 여기서 사용하여 데이터를 불러온다
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
                    	
                    	axios({
                    		url: "${pageContext.request.contextPath}/rest/follow/recommend_list",
                    		method:"get"
                    	})
                    	.then(resp=>{
                    		this.recommendList = resp.data;
                    	});
                    },
                    //데이터가 화면에 마운트 되기 전(View 생성 전)
                    boeforeMount(){},
                    mounted(){
                    	//스크롤이벤트 최하단 도달 시 게시글 3개씩 더 읽어옴
                    	$(window).scroll((resp)=>{
                    		  var scrT = $(window).scrollTop();
                    		  console.log(scrT); //스크롤 값 확인용
                    		  const bottom = ($(document).height() - $(window).height() - 10);
                    		  console.log("값 = " + bottom);
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