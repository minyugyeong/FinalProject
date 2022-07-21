<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mars</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/journal/bootstrap.min.css"/>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 파비콘 -->
    <link rel="icon" href="${pageContext.request.contextPath}/image/favicon.png">
    
 		
   <style>
        @media screen and (max-width: 768px) {
            .search0503 {
                display: none!important;
            }
            .navbar-brand{
            margin-right: 300px!important;
        		}
        }

        .container-fluid{
            width: auto!important;
        }

        .navbar-brand{
            margin-right: 100px!important;
        }

        .search0503{
            margin-right: 100px!important;
        }

        .fa-solid{
            width: 30px;
        }
        
        main{
        	position: absolute;
        	top: 100px;
        	width: 100%;
        }
        
        .card-text{
            font-size: 0.8em;
        }
        
        .show {
        	display:block!important;
        }
        
        .showAlram{
        	display:block!important;
        }
        
    </style>
</head>
<body>
    <nav class="navbar navbar-expand fixed-top navbar-light bg-light" id="navi">
        <div class="container-fluid">

                    <a class="navbar-brand" href="${pageContext.request.contextPath}">
                        <img src="${pageContext.request.contextPath}/image/logo.png" width="150">
                    </a>
                    <c:if test="${login != null }">
                    <div class="collapse navbar-collapse" id="navbarColor03">
                        
                        <div class="d-flex search0503" style="position: relative;" @click.stop>
                            <input class="form-control me-sm-2" v-model="keyword" type="text" placeholder="Search" @focus="searchOn" @blur="searchOff" @input="keyword = $event.target.value">
                            <div v-if="searchValue" :class="{'show':searchValue}" style="position: absolute; top: 50px; right: -70px; width: 350px; height: 300px; overflow: auto; border-radius: 0.2em; box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;background-color:white;display:none;" @click.stop="">
                                <div class="card border-light" style="border:none!important;">
                                    <div v-if="keyword == ''" class="card-body">
                                      <h5 class="card-title" style="text-align: center;padding-top: 30%;">검색어를 입력해주세요</h5>
                                      <p class="card-text"></p>
                                    </div>
                                    <div v-else class="card-body" style="padding-bottom:0;">
	                                    <p v-if="searchList.length == 0" class="card-text" style="text-align: center;padding-top: 30%;">검색 결과가 없습니다.</p>
	                                    <div v-for="(search, index) in searchList" class="card-text">
		                                    <a v-if="search.type == 0" :href="'${pageContext.request.contextPath}/member/page?memberNo='+search.no" style="text-decoration:none;color:black;position:relative;">
		                                      <img v-if="search.attachNo != 0" :src="'${pageContext.request.contextPath}/file/download/'+search.attachNo" width="30" height="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                      <img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" height="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                      <p style="margin-bottom:0;padding-left:2.5em;">
		                                       {{search.main}}
		                                      </p>
		                                      <p style="font-weight:normal;margin-bottom:1;font-size:0.8em;color:grey;padding-left:3em;">
		                                       {{search.sub}}
		                                      </p>
		                                    </a>
		                                    <a v-else :href="'${pageContext.request.contextPath}/search/'+search.no" style="text-decoration:none;color:black;position:relative;">
		                                      <img src="${pageContext.request.contextPath}/image/hashtag.png" width="30" height="30" style="border-radius: 70%;position:absolute;top:10%;">
		                                      <p style="margin-bottom:0;padding-left:2.5em;">
		                                       {{search.main}}
		                                      </p>
		                                      <p style="font-weight:normal;margin-bottom:1;font-size:0.8em;color:grey;padding-left:3em;">
		                                       게시글 개수 : {{search.sub}} 개
	                                       	  </p>
		                                    </a>
	                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <ul class="navbar-nav align-right me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}">
                                    <i class="fa-solid fa-earth-asia fa-lg"></i>
                                    <span class="visually-hidden">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item" style="position: relative;">
                                <a class="nav-link" href="${pageContext.request.contextPath}/dm">
                                    <i class="fa-solid fa-walkie-talkie fa-lg"></i>
                                    <i class="fa-solid fa-circle" :class="{'showAlram':chatAlram}" style="display:none;position: absolute;font-size: 0.5em;color: #eb6864;left: 25%;top: 85%;"></i>
                                </a>
                            </li>
                            <c:choose>
                            	<c:when test="${sessionScope.auth == '일반회원'}">
		                            <li class="nav-item">
	                                <a class="nav-link" href="${pageContext.request.contextPath}/board/insert">
	                                  <i class="fa-solid fa-square-plus fa-lg"></i>
	                                </a>
		                            </li>
	                            </c:when>
	                            <c:when test="${sessionScope.auth != '일반회원'}">
		                            <li class="nav-item dropdown">
															    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
															    	 <i class="fa-solid fa-square-plus fa-lg"></i>
															    </a>
															    <div class="dropdown-menu" style="">
															      <a class="dropdown-item" href="${pageContext.request.contextPath}/board/insert">일반 게시물</a>
															      <a class="dropdown-item" href="${pageContext.request.contextPath}/boardAd/insert">광고 게시물</a>
															    </div>
															  </li>
	                            </c:when>
                            </c:choose>
                            <li class="nav-item" style="position: relative;">
                                <a class="nav-link" style="cursor: pointer;" @click.stop="noticeOn(),loadAlram(),checkAlram()">
                                    <i class="fa-solid fa-rocket fa-lg"></i>
                                    <i class="fa-solid fa-circle" :class="{'showAlram':rocketAlram}" style="display:none;position: absolute;font-size: 0.5em;color: #eb6864;left: 10%;top: 60%;"></i>
                                </a>
                                <div v-if="noticeValue" :class="{'show':noticeValue}" style="position: absolute; right: -150px; width: 450px; max-height: 300px; overflow: auto; border-radius: 0.2em; box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;display:none;" @click.stop>
                                    <div class="card border-light">
                                        <div v-for="(alram, index) in alramList" :key="index" class="card-body" style="padding:0;">
                                          <p class="card-title"><hr v-if="alramTime(index)!=''&&alramTime(index)!='오늘'">{{alramTime(index)}}</p>
                                          <div style="position:relative;font-size:0.7em;font-weight:100;height: 30px;">
                                          	<a :href="'${pageContext.request.contextPath}/member/page?memberNo='+alram.memberNo" style="color:black;text-decoration:none;">
	                                          	<img v-if="alram.attachNo > 0" :src="'${pageContext.request.contextPath}/file/download/'+alram.attachNo" width="30" height="30" style="border-radius: 70%;position:absolute;top:0;">
			                                	<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:0;">
												<span style="padding-left:35px;font-weight:600;">{{alram.memberNick}}</span>
                                          	</a>
											<span v-if="alram.type==0&&alram.etc==1">님이 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">게시글에 좋아요를 누르셨습니다!</a></span>
											<span v-if="alram.type==0&&alram.etc>1">님 외 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">{{alram.etc-1}}명이 게시글에 좋아요를 누르셨습니다!</a></span>
											<span v-if="alram.type==1&&alram.etc==1">님이 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">게시글에 좋아요를 누르셨습니다!</a></span>
											<span v-if="alram.type==1&&alram.etc>1">님 외 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">{{alram.etc-1}}명이 게시글에 좋아요를 누르셨습니다!</a></span>
											<span v-if="alram.type==2&&alram.etc==0">
												<span>님이 팔로우 요청을 하셨습니다!</span>
												<span style="position:absolute; right:0;">
													<button class="btn btn-outline-primary" style="margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;" @click="followAccept(alram.memberNo)">승인</button>
													<button class="btn btn-primary" style="margin-right: 2px;padding: 5px 5px;font-weight: 100;font-size: 0.9em;" @click="followRefuse(alram.memberNo)">취소</button>
												</span>
											</span>
											<span v-if="alram.type==2&&alram.etc==1">님이 팔로우 하셨습니다!</span>
											<span v-if="alram.type==3&&alram.etc==1">님이 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">게시글에 댓글을 작성하셨습니다!</a></span>
											<span v-if="alram.type==3&&alram.etc>1">님 외 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">{{alram.etc-1}}명이 게시글에 댓글을 작성하셨습니다!</a></span>
											<span v-if="alram.type==4&&alram.etc==1">님이 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">게시글에 댓글을 작성하셨습니다!</a></span>
											<span v-if="alram.type==4&&alram.etc>1">님 외 <a :href="'${pageContext.request.contextPath}/member/page?memberNo='+${login}+'&boardNo='+alram.boardNo+'&type='+alram.type">{{alram.etc-1}}명이 게시글에 댓글을 작성하셨습니다!</a></span>
											
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/member/page?memberNo=${login}">
                                    <i class="fa-solid fa-user-astronaut fa-lg"></i>
                                </a>
                            </li>
                            <c:if test="${auth == '관리자'}">
	                            <li class="nav-item dropdown">
														    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">
														    	 <i class="fa-solid fa-screwdriver-wrench"></i>
														    </a>
														    <div class="dropdown-menu" style="">
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/member/list/">회원 관리</a>
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/ad">광고 관리</a>
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/boardAdList">광고 신청 관리</a>
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/status">통계</a>
														    </div>
														  </li>
													  </c:if>
                            
                        </ul>
            </div>
            </c:if>
        </div>
    </nav>
        
    <main>
   	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>

    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const navi = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                	noticeValue:false,
                    searchValue:false,
                    keyword:"",
                    
                    searchList:[],
                    searchLength:null,
                    
                    alramList:[],
                    
                    chatAlram:false,
                    rocketAlram:false,
              
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //method : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	noticeOn(){
                    if(this.noticeValue) {
                        this.noticeValue = false;
                    }else{
                        this.noticeValue = true;
                        this.searchValue = false;
                    }
                    
                },
                searchOn(){
                        this.searchValue = true;
                        this.noticeValue = false;
                },
                searchOff(){
                        /* this.searchValue = false; */
                        this.noticeValue = false;
                },
                
                //알람 읽은 체크
                checkAlram(){
                	axios({
                		url:"${pageContext.request.contextPath}/rest/alram/check",
                		method: "Put",
                	})
                	.then(resp=>{
                		this.rocketAlram = false;
                	})
                },
                
                
                
                //알람 불러오기
                loadAlram(){
                	axios({
                		url:"${pageContext.request.contextPath}/rest/alram",
                		method:"get",
                	})
                	.then(resp=>{
                		console.log("허허");
						this.alramList = resp.data;       		
                	});
                	
                },
                
                //알람 날짜계산
                alramTime(index){
                		const today = moment().format("YYYY-MM-DD");
                		const target = moment(this.alramList[index].alramTime).format("YYYY-MM-DD");
                		console.log(index +"ㅎ"+target);
                		if(index==0&&today==target){
                			return "오늘";
                		}
                		else if(index!=0&&today==target){
                			return "";
                		}
                		
                		if(index!=0){
	                		const target2 = moment(this.alramList[index-1].alramTime).format("YYYY-MM-DD");
	                		const thisWeek = moment(moment().startOf('week').valueOf()).format("YYYY-MM-DD");
                		
	                		if(thisWeek<=target&&today==target2){
			                	return "이번 주";
	                		}else if(thisWeek<=target&&target2!=today){
	                			return "";
	                		}
	                		const thisMonth = moment(moment().startOf('month').valueOf()).format("YYYY-MM-DD");
	                		console.log(thisMonth);
	               			if(thisMonth<=target&&thisWeek<=target2){
	               				return "이번 달";
	               			}else if(thisMonth<=target&&thisWeek>target2){
	               				return "";
	               			}else if(thisMonth>target&&thisMonth<=target2){
		                		return "이전 활동";
	               			}
                		}
                		return "";
                },	
                
                followAccept(memberNo){
                	axios({
                		url : "${pageContext.request.contextPath}/rest/follow/follow_accept",
                		method:"post",
                		params:{
                			followWho : memberNo
                		}
                	})
                	.then(resp=>{
                		this.loadAlram();
                		console.log("승인");
                	});
                },
                
                followRefuse(memberNo){
                	axios({
                		url : "${pageContext.request.contextPath}/rest/follow/follow_refuse",
                		method : "Post",
                		params : {
                			followWho : memberNo
                		}
                	})
                	.then(resp=>{
                		this.loadAlram();
                		console.log("거절");
                	});
                }
                
            },
            // watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
            	keyword:_.throttle(function(){
            		if(!this.searchValue) this.searchValue=true;
            		if(this.keyword == "") return;
                    axios({
                        url:"${pageContext.request.contextPath}/rest/search",
                        method:"get",
                        params:{
                        	keyword : this.keyword
                        }
                    })
                    .then((resp)=>{
                    	this.searchLength = resp.data.length;
                        this.searchList = resp.data;
                    })
                }, 200),
            },
            //데이터 및 구성요소 초기화 전
            beforeCreate(){},
            //데이터 및 구성요소 초기화 후, data에 접근 가능하므로 ajax를 여기서 사용하여 데이터를 불러온다
            created(){
            	if(${hashTagName != null}){
            		this.keyword = "${hashTagName}"
            	}
            	
            	axios({
            		url:"${pageContext.request.contextPath}/rest/alram/is_rocket",
            		method:"get"
            	})
            	.then(resp=>{
            		if(resp.data>0){
            			this.rocketAlram = true;
            		}
            	});
            	
            	axios({
            		url:"${pageContext.request.contextPath}/rest/alram/is_chat",
            		method:"get"
            	})
            	.then(resp=>{
            		if(resp.data>0){
            			this.chatAlram = true;
            		}
            	});
            },
            boeforeMount(){},
            mounted(){
            	var uri = "${pageContext.request.contextPath}/ws/dm";
        		
        		//접속
        		socket = new SockJS(uri);
        		
        		socket.onopen = event => {
        			//접속하자마자 나의 채널명을 서버로 전송해야한다(입장메세지)
        			var message = {
        				type:1,
        			};
        			var json = JSON.stringify(message);
        			socket.send(json);
        		};
        		
        		socket.onmessage = (event) => {
        			var data = JSON.parse(event.data);//json을 객체로 복구
        			console.log("메세지가 올텐데요");
        			console.log(data.who);
        			console.log(${login});
        			if(data.who==${login}&&data.dmType==3){
        				console.log("알람 수신 (채팅)");
        				this.chatAlram = true;
        			}
        			if(data.who==${login}&&data.dmType==4){
        				console.log("알람 수신 (로켓)");
        				this.rocketAlram = true;
        			}
        		};
            	
            	$("body,html").click(resp=>{
                    this.noticeValue = false;
                    this.searchValue = false;
                });
            	this.searchValue=false;
            },
            beforeUpdate(){},
            updated(){},
            
        });
        navi.mount("#navi");
    </script>

        <section>
        