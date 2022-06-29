<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
	<div id="app" @scroll="onScroll">
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
	                                            <div v-for="(attach, index2) in boardList[index].attachList" :key="index2" class="carousel-item" :class="{'active':index2==0}">
	                                                <img src="https://via.placeholder.com/470" class="d-block">
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
                                        <i class="fa-regular fa-heart fa-lg"></i>
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
                                    <p class="card-text text-muted" style="font-size: 0.4em;">
                                        {{board.boardListVO.boardDate}}
                                    </p>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div class="card-body" style="padding-top: 0px; padding-left: 40px; padding-right: 0; padding-bottom: 0px!important; position: relative;">
                                    <span style="position: absolute; left:0; top: 6px; z-index: 999;">임티</span>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="댓글" style="border: none;" aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button class="btn btn-primary" type="button" id="button-addon2">작성</button>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <div class="row follow-recomand">

                    <div class="card border-light mb-3" style="width: 20rem;">
                        <div class="card-header">내 아이디</div>
                        <div class="card-body">
                          <h4 class="card-title">회원 추천</h4>
                          <p class="card-text">회원아이디</p>
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
        					memberNo: 1,
        					pageCount: 1,
        					boardList:[],
                        };
                    },
                    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
                    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
                    computed:{
                        
                    },
                    //method : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
                    methods:{
                        onScroll() {
                        	console.log(arguments);
                        	console.log("움직임");
                            if(scrollTop + clientHeight >= scrollHeight) {
                              console.log("바닥");
                            }
                        }
                    },
                    // watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
                    watch:{
                        
                    },
                    //데이터 및 구성요소 초기화 전
                    beforeCreate(){},
                    //데이터 및 구성요소 초기화 후, data에 접근 가능하므로 ajax를 여기서 사용하여 데이터를 불러온다
                    created(){
                    	axios({
                    		url: "${pageContext.request.contextPath}/rest/board/main?pageCount=" + this.pageCount +"&uptoNo="+this.uptoNo,
                    		method: "get"
                    	})
                    	.then(resp=>{
                    		console.log(resp.data);
                    		this.boardList.push(...resp.data);
                    		this.pageCount++;
                    		this.uptoNo = this.boardList[0].boardListVO.boardNo;
                    	});
                    },
                    //데이터가 화면에 마운트 되기 전(View 생성 전)
                    boeforeMount(){},
                    mounted(){
                    	$(window).scroll(function(){
                    		console.log("움직임");
                    	});
                    },
                    beforeUpdate(){},
                    updated(){},
                });
                app.mount("#app");
            </script>
</article>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>