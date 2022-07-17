<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.message-wrapper > .message {
		display:flex;
	}
	.message-wrapper > .message > .user {
		padding:0.25em;
		min-width:150px;
	}
	.message-wrapper > .message > .text {
		padding:1em;
		font-size: 10px;		
		text-align: right;
		margin: 2px;
		
	}
	.message-wrapper > .message > .time {
		padding:0.25em;
	}
	.messageList{
		padding:1em;
		font-size: 10px,
		margin:1px;
	}
	.container{
		width: 800px;
	}
	
	.send {
		text-align: right;
	}
	
	.hide{
		display:none!important;
	}
	
	.dm-btn{
		border: 1px solid #ced4da;
		opacity:0.5; 
		color: var(--bs-primary); 
		backgorund-color:white;
	}
	.dm-btn:hover{
		opacity: 1;
		color: var(--bs-primary);
		background-color: white;
	}
	.receive{
		background-color: #eb64640a!important;
	}
	
	.overflowY{
		overflow-y:scroll;
	}
	
	.write{
       	opacity: 0.7;
    }
    
    .write:hover {
       	opacity: 1;
    }
    
    .selectIndex{
    	background-color: #eb68641a!important;
    }
    
    .roomList:hover{
    	background-color: #eb68640f;
    }
    .dateShow{
    	display:block!important;
    }
</style>

<%-- <h2>로그인? ${login}</h2> --%>

<article>

<div id="app">
	<div class="container-fluid">
	<div class="offset-3">
		<div class="row mt-3" style="width:1100px;margin-bottom:0;padding-left:100px; padding-right:100px;height:50px;">
			
			<div class="card col-3" style="width:250px;border-radius:0;padding-bottom:0;align-content: center;flex-wrap: wrap;flex-direction: row;">
				<c:if test="${attachNo!=0}">
					<img src="${pageContext.request.contextPath}/file/download/${attachNo}" width="30" height="30" style="border-radius: 70%;position:absolute;top:20%;">
				</c:if>
				<c:if test="${attachNo==0}">
					<img src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:20%;">
				</c:if>
				<span style="padding-left:35px;word-wrap:normal;">
					${memberDto.memberNick}
				</span>
				<span style="position:absolute;top:10px;right:0;">
					<i class="fa-solid fa-walkie-talkie fa-lg write" style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="chooseDmList"></i>
				</span>
			</div>
			<div class="card col-7" style="border-radius:0;border-left:0;align-content: center;flex-wrap: wrap;flex-direction: row;">
				<img v-if="dmTarget!=null&&dmTarget.attachNo!=0" :src="'${pageContext.request.contextPath}/file/download/'+dmTarget.attachNo" width="30" height="30" style="border-radius: 70%;position:absolute;top:20%;">
				<img v-if="dmTarget!=null&&dmTarget.attachNo==0" src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:20%;">
				<span v-if="dmTarget!=null" style="padding-left:30px;word-wrap:normal;">
 					{{dmTarget.memberNick}}
				</span>
				<button type="button" v-if="roomNo!=''" class="btn btn-outline-primary" style="position:absolute; right:20px; top:6px; padding: 5px 10px;" data-bs-toggle="modal" data-bs-target="#exampleModal2">
					나가기
				</button>
			</div>
	
		</div>
		<div class="row" style="width:1100px;padding-left:100px; padding-right:100px; margin-top:0;">
			<div class="card col-3" style="width:250px;border-radius:0;border-top:none;padding:0;">
		  		<div class="card-body" style="padding:0;padding-top:10px;">
		   			<div v-for="(room, index) in roomList" :key="index" class="roomList" :class="{'selectIndex':index==selectIndex}" @click="enterRoom(room.roomNo, index)" style="padding-bottom: 5px;padding-top: 5px;padding-left: 10px;cursor:pointer;">
			   				<div style="position:relative;">
			   					<img v-if="room.attachNo!=0" :src="'${pageContext.request.contextPath}/file/download/'+room.attachNo" width="30" height="30" style="border-radius: 70%;position:absolute;top:0;">
			   					<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:0;">
			   					<span style="font-size:0.8em;padding-left:35px;word-wrap:normal;">
				   					{{room.memberNick}}
			   					</span>
			   					<span v-if="room.unreadcount>0" style="color:var(--bs-primary);font-size:0.8em;padding-left:1em;">
			   						 {{room.unreadcount}}
			   					</span>
			   					<span v-if="room.unreadcount>0" style="color:var(--bs-primary);position:absolute;right:0;top: 5px;font-size: 10px;">
			   						<i class="fa-solid fa-circle"></i>
			   					</span>
			   				</div>
			   				<div style="word-wrap:normal;margin-top:3px;">
			   					<span style="font-size:0.73em;word-wrap:normal;display: inline-block;width: 50%;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;vertical-align: bottom;">
				   					{{room.dmContent}} &nbsp;
			   					</span>
			   					<span style="font-size:1em;">
			   						·
			   					</span>
			   					<!-- <i class="fa-solid fa-ellipsis"></i> -->
			   					<span style="font-size:0.7em;word-wrap:normal;color:gray;">
				   					&nbsp; {{dateCount(room.dmRecordTime)}} 
			   					</span>
			   				</div>  
		   			</div>
		  		 </div>
			</div>
			
			<div class="card col-7" style="border-radius:0;border-top:none;border-left:0;padding-right:0;">
		  		<div class="card-body" style="padding:0;">
		   <!-- 메세지 출력 공간 -->
					<div class="message-wrapper" :class="{'overflowY':roomNo!=''}" style="height:500px;padding-top:5px;" @scroll="scrollCheck">
						<div v-for="(dm, index) in messageList" :key="index">
							<div :class="{'dateShow':dateCheck(index)}" style="text-align: center;color: gray;font-size: 0.9em;display:none;">
								-------------------- {{dateFormat2(dm.dmRecordTime)}} --------------------
							</div>
							<div class="message-space" :class="{'lend':myNum!=dm.who, 'send':myNum==dm.who}" style="margin-bottom:5px; padding-right:20px;">
								<span style="margin-right:5px; font-size:0.7em;vertical-align: bottom;display:inline-block;">
										<span :class="{'hide':myNum!=dm.who||timeCheck(index)}">{{dateFormat(dm.dmRecordTime)}}</span>
								</span>
								<span class="badge bg-light messageList" :class="{'receive':myNum==dm.who}" style="max-width:300px; word-break:break-all;white-space:normal;word-wrap:break-word;font-weight:100!important;">
									{{dm.dmContent}}
								</span>
								<span style="margin-left:5px; font-size:0.7em;vertical-align: bottom;display:inline-block;">
										<span :class="{'hide':myNum==dm.who}" style="color:var(--bs-primary);">{{dmCheck(dm.dmRecordCheck)}}</span>
										<br>
										<span :class="{'hide':myNum==dm.who||timeCheck(index)}">{{dateFormat(dm.dmRecordTime)}}</span>
								</span>
								
							</div>
						</div>
								<button v-if="!bottomFlag" class="btn btn-outline-primary" style="position:absolute;bottom:60px;left:38%;border-radius:3rem;font-size: 0.8rem;font-weight:100;" @click="scrollMove(bottomFlag=true)">
									최신글 보기
								</button>
					</div>
					
					<div class="row justify-content-between" style="margin-top:10px;margin-bottom:10px;padding-left:calc(var(--bs-gutter-x) * .5);padding-right:calc(var(--bs-gutter-x) * .5);height:38px;">
						<input v-if="roomNo!=''" type="text" v-model="inputMessage" class="send-input form-control" placeholder="메세지 입력" style="border-radius: 3rem;width:75%;" @keyup.enter="send">
						<input v-if="roomNo!=''" type="button" class="btn-send btn btn-outline-light dm-btn col-2" style="border-radius: 3rem;" value="전송" @click="send">
						<!-- <button class="btn-send btn btn-primary">전송</button> -->
					</div>
		 	 	</div>
		 	 </div>
		  </div>
	</div>
	</div>
	
		<!-- 디엠할 사람 찾기 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable" style="width:350px;">
		    <div class="modal-content" style="align-content: center;flex-wrap: wrap;">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">메세지 보내기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="max-height: 500px;margin-bottom: 50px;">
		      		<div style="margin-bottom:10px;">
		      			<input type="text" placeholder="검색" v-model="keyword" class="form-control me-sm-2" @input="keyword = $event.target.value">
		      		</div>
		      		<div v-if="searchDmList.length==0" v-for="(member,index) in chooseDm" :key="index" style="margin-top:20px;position:relative;">
	      				<img v-if="member.attachNo!=0" :src="'${pageContext.request.contextPath}/file/download/'+member.attachNo" width="30" height="30" style="border-radius: 70%;position:absolute;top:10px;">
	      				<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:10px;">
		      			<span style="padding-left:35px;font-size:0.8em;">{{member.memberNick}}</span>
		      			<br>
		      			<span style="padding-left:35px;font-size:0.8em;color:grey;">{{member.memberName}}</span>
		      			<span style="position:absolute;right:0;top:10px;">
			      			<button class="btn btn-outline-primary" style="padding: 0.3rem 0.5rem;font-weight: 100;line-height: 1;font-size:0.8em;" @click="roomSearch(member.memberNo,index)" data-bs-dismiss="modal" data-bs-target="#my-modal" aria-label="Close">
			      				교신
			      			</button>
		      			</span>
		      		</div>
		      		<div v-if="searchDmList.length>0" v-for="(member,index) in searchDmList" :key="index" style="margin-top:20px;position:relative;">
		      			<img v-if="member.attachNo!=0" :src="'${pageContext.request.contextPath}/file/download/'+member.attachNo" width="30" height="30" style="border-radius: 70%;position:absolute;top:10px;">
	      				<img v-else src="${pageContext.request.contextPath}/image/user.jpg" width="30" style="border-radius: 70%;position:absolute;top:10px;">
		      			<span style="padding-left:35px;font-size:0.8em;">{{member.memberNick}}</span>
		      			<br>
		      			<span style="padding-left:35px;font-size:0.8em;color:grey;">{{member.memberName}}</span>
		      			<span style="position:absolute;right:0;top:10px;">
			      			<button class="btn btn-outline-primary" style="padding: 0.3rem 0.5rem;font-weight: 100;line-height: 1;font-size:0.8em;" @click="roomSearch(member.memberNo,index)" data-bs-dismiss="modal" data-bs-target="#my-modal" aria-label="Close">
			      				교신
			      			</button>
		      			</span>
		      		</div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 방 나가기 Modal -->
			<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel2">채팅을 삭제하시겠습니까?</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="color:grey;font-size:0.9em;">
			        삭제하면 회원님의 받은 메시지함에서 채팅이 삭제됩니다. <br>
			        다른 사람의 받은 메시지함에는 계속 표시됩니다.
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" @click="exitRoom" data-bs-dismiss="modal" aria-label="Close">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
</div>

</article>

<script>
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
        	myNum:"${memberDto.memberNo}",
        	
			roomList:[],
			messageList:[],
			
			dmTarget:null,
			roomMember:[],
			
			roomNo:0,
			socket:null,
			
			inputMessage:"",
			
			//바닥 갱신 여부
			bottomFlag:true,
			
			//채팅창 스크롤 높이
			scrollHeight:"",
			
			//dm 20개씩 가져올때 쓰는 변수
			uptoNo:0,
			dmCount:1,
			
			pointTarget:"",
			
			//메세지 상대 탐색용
			chooseDm:[],
			selectIndex:-1,
			
			isPlusDm:false,
			
			//메세지 상대 검색
			searchDmList:[],
			keyword:"",
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    computed:{
    	scrollChange(){
    		this.scrollHeight = $('.message-wrapper').prop('scrollHeight');
    		return this.messageList.length;
    	}
		
    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
    	//방에입장
    	async enterRoom(roomNo,index){
    		this.dmCount=1;
    		this.roomNo = roomNo;
    		this.messageList = [];
    		this.bottomFlag = true;
    		this.uptoNo = 0;
    		this.roomList[index].unreadcount = 0;
    		var message = {
				type:1,
				roomNo:this.roomNo
			};
			var json = JSON.stringify(message);
			this.socket.send(json);
			//메세지 업데이트 1 나한테 온 것들만
    		await axios({
    			url: "${pageContext.request.contextPath}/rest/dm/dm_check",
    			method: "Post",
    			params: {
    				roomNo:this.roomNo, 
    			}
    		})
    		.then(resp=>{
    			console.log("다읽음");
    		});
    		await axios({
    			url: "${pageContext.request.contextPath}/rest/dm/room_record",
    			method: "get",
    			params:{
    				uptoNo: this.uptoNo,
    				dmCount: this.dmCount,
    				roomNo: this.roomNo,
    			}
    		})
    		.then(resp=>{
    			console.log(resp.data);
    			if(resp.data.length > 0){
	    			this.messageList = resp.data;
	    			this.uptoNo = this.messageList[resp.data.length-1].dmNo;
	    			this.dmCount++;
    			}
    		});
    		//
    		await axios({
    			url: "${pageContext.request.contextPath}/rest/dm/room_member/"+roomNo,
    			method: "get"
    		})
    		.then(resp=>{
    			console.log(resp.data);
    			this.roomMember = resp.data;
    		});
    		
    		this.dmTarget = {
    				memberNick: this.roomList[index].memberNick,
    				attachNo: this.roomList[index].attachNo,
    		};
    		this.selectIndex = index;
    		this.scrollMove();
    		
    		console.log($('.message-wrapper').prop('scrollHeight'));
    	},
    	//바닥으로 스크롤 이동
    	scrollMove(){
	    		$('.message-wrapper').scrollTop(($('.message-wrapper').prop('scrollHeight')-500));
	    		console.log("바닥이동2");
    	},
    	
    	//메세지 전송
    	send(){
    		if(this.inputMessage=="") return;
    		
    		for(let i = 0; i < this.roomMember.length; i++){
    			const message = {
    					type:2,
    					target: this.roomMember[i],
    					roomNo:this.roomNo,
    					message:this.inputMessage
    			}
    			const json = JSON.stringify(message);
    			this.socket.send(json);//전송 명령
    		}
    		
    		this.inputMessage = "";
    	},
    	
    	//시간변환
    	dateFormat(milliSec){
    		return moment(milliSec).format('LT');
    	},
    	dateFormat2(milliSec){
    		return moment(milliSec).format('YYYY-MM-DD');
    	},
    	dateCount(date){
    		if(date == null) return;
			const curTime = moment();
			const minus = (curTime - date) / (1000 * 60 * 60 * 24);
			
			if(minus >= 1){
				return Math.floor(minus) + "일 전";	
			}else{
				return "24시간 이내";
			}
    	},
    	
    	//채팅방 스크롤 체크
    	scrollCheck(){
    		let pointer = $('.message-wrapper').scrollTop();
    		let totalHeight = $('.message-wrapper').prop('scrollHeight')-500;
    		console.log($('.message-wrapper').scrollTop());
    		console.log("높이" + $('.message-wrapper').prop('scrollHeight'));
    		const movePoint = $('.message-wrapper').prop('scrollHeight');
    		if(pointer >= totalHeight){
    			this.bottomFlag=true;
    		}else{
    			this.bottomFlag=false;
    		}
    		this.pointTarget = movePoint;
    		if(pointer<=0&&!this.bottomFlag){
    			this.plusDm();
    		}
    		
    	},
    	
    	//특정포인트로 이동
    	movePoint(point){
    		console.log("보낼 곳"+ this.pointTarget);
    		console.log("갱신된 높이"+ $('.message-wrapper').prop('scrollHeight'));
    		const fP= $('.message-wrapper').prop('scrollHeight')-this.pointTarget;
    		$('.message-wrapper').scrollTop(fP);
    		console.log("어디갔냐진짜"+point);
    	},
    	
    	//추가로 디엠 불러오기
    	plusDm:_.debounce(function(point){
			axios({
	   			url: "${pageContext.request.contextPath}/rest/dm/room_record",
	   			method: "get",
	   			params:{
	   				uptoNo: this.uptoNo,
	   				dmCount: this.dmCount,
	   				roomNo: this.roomNo,
	   			}
	   		})
	   		.then(resp=>{
	   			console.log(resp.data);
	   			this.messageList.unshift(...resp.data);
	   			this.dmCount++;
	   			this.isPlusDm = true;
	   		});
		},250),
    	
    	//시간 묶기
    	timeCheck(index){
    		if(index!=this.messageList.length-1){
	    		const first = this.messageList[index].who;
	    		const second = this.messageList[index+1].who;
	    		if(first!=second) return false;
    		}
    		if(index!=this.messageList.length-1){
	    		const firstT = moment(this.messageList[index].dmRecordTime).format('HH:mm');
	    		const secondT = moment(this.messageList[index+1].dmRecordTime).format('HH:mm');
	    		
	    		if(firstT==secondT){
	    			return true;
	    		}else{
	    			return false;
	    		}
    		}
    		return false;
    	},
    	
    	//날짜 묶기
    	dateCheck(index){
    		if(index!=0){
	    		const firstT = moment(this.messageList[index].dmRecordTime).format('YYYY-MM-DD');
	    		const secondT = moment(this.messageList[index-1].dmRecordTime).format('YYYY-MM-DD');
	    		
	    		if(firstT==secondT){
	    			return false;
	    		}else{
	    			return true;
	    		}
    		}
    		return true;
    	},
    	
    	//dm 읽은지 체크
    	dmCheck(checkNo){
    		if(checkNo==0){
    			return 1;
    		}else{
    			return	"";
    		}
    	},
    	
    	//dm목록 추천
    	chooseDmList(){
    		axios({
    			url: "${pageContext.request.contextPath}/rest/dm/choose_dm",
    			method:"get"
    		})
    		.then(resp=>{
				this.chooseDm = resp.data;   			
    		})
    	},
    	
    	//dm목록 검색
    	chooseDmSearch(){
    		axios({
    			url: "${pageContext.request.contextPath}/rest/dm/dm_member_search",
    			method:"get",
    			params:{
    				keyword:this.keyword
    			}
    		})
    		.then(resp=>{
    			this.searchDmList = resp.data
    		})
    	},
    	
    	//dm 룸 찾기
    	roomSearch(targetNo,index2){
    		console.log(targetNo);
    		axios({
    			url:"${pageContext.request.contextPath}/rest/dm/room_search",
    			method:"post",
    			params:{
    				targetNo:targetNo,
    			}
    		})
    		.then(resp=>{
    			console.log(resp.data);
    			const index = this.roomList.findIndex(v => v.roomNo == resp.data);
    			if(index!=-1){
    				this.enterRoom(resp.data, index);
    				return;
    			}
    			this.roomNo = resp.data;
    			this.roomMember = [targetNo];
    			if(this.keyword==""){
	    			this.roomList.unshift({
	    								attachNo:this.chooseDm[index2].attachNo,
	    								memberNick:this.chooseDm[index2].memberNick,
	    								roomNo:resp.data,
	    								memberNo:this.chooseDm[index2].memberNo,
	    									});
    			}else{
    				this.roomList.unshift({
						attachNo:this.searchDmList[index2].attachNo,
						memberNick:this.searchDmList[index2].memberNick,
						roomNo:resp.data,
						memberNo:this.searchDmList[index2].memberNo,
							});
    			}
    			this.messageList = [];
    			this.selectIndex = 0;
    		})
    	},
    	
    	//채팅방 나가기
    	exitRoom(){
    		axios({
    			url:"${pageContext.request.contextPath}/rest/dm/room_exit",
    			method:"post",
    			params:{
    				roomNo: this.roomNo
    			}
    		})
    		.then(resp=>{
    			this.roomNo = "";
    			this.messageList = [];
    			this.selectIndex = -1;
    			this.roomMember = [];
    			this.dmTarget = null;
    			this.uptoNo=0;
    			this.dmCount=1;
    			this.pointTarget="";
    			this.inputMessage="";
    			this.bottomFlag=true;
    			this.scrollHeight="";
    			axios({
    	    		url: "${pageContext.request.contextPath}/rest/dm/room",
    	    		method: "get"
    	    	})
    	    	.then(resp=>{
    				this.roomList = resp.data;    		
    	    	});
    		});
    	}
    	

    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{
		scrollHeight(){
			if(this.bottomFlag){
				this.scrollMove();
			}else if(!this.bottomFlag&&this.isPlusDm==true) {
				this.movePoint(this.pointTarget);
				this.isPlusDm = false;
			}
		},
		
		keyword:_.throttle(function(){
			if(this.keyword=="") {
				this.searchDmList = [];
				return;
			}
			this.chooseDmSearch();
		}, 300)
    },  
    created(){
    	axios({
    		url: "${pageContext.request.contextPath}/rest/dm/room",
    		method: "get"
    	})
    	.then(resp=>{
			this.roomList = resp.data;    		
    	});
    },
    mounted(){
		var uri = "${pageContext.request.contextPath}/ws/dm";
		
		//접속
		socket = new SockJS(uri);
		
		socket.onopen = event => {
			connectOperation();
			console.log(this.roomNo);
			//접속하자마자 나의 채널명을 서버로 전송해야한다(입장메세지)
			var message = {
				type:1,
				roomNo:this.roomNo
			};
			var json = JSON.stringify(message);
			this.socket.send(json);
		};
		socket.onclose = function(e){
			/* disconnectOperation(); */
		};
		socket.onerror = function(){
			alert("서버와의 연결 오류가 발생하였습니다");
			/* disconnectOperation(); */
		};
		socket.onmessage = (event) => {
			var data = JSON.parse(event.data);//json을 객체로 복구
			
			console.log("메세지가 올텐데요");
			if(data.roomNo==this.roomNo){
				this.messageList.push(data);
				
					axios({
		    			url: "${pageContext.request.contextPath}/rest/dm/dm_check",
		    			method: "Post",
		    			params: {
		    				roomNo:this.roomNo, 
		    			}
		    		})
		    		.then(resp=>{
		    			console.log("다읽음");
		    			axios({
				    		url: "${pageContext.request.contextPath}/rest/dm/room",
				    		method: "get"
				    	})
				    	.then(resp=>{
							this.roomList = resp.data;
							const index = this.roomList.findIndex(v => v.roomNo == this.roomNo);
							this.selectIndex = index;
				    	});
		    		});
				return;
			}
			axios({
	    		url: "${pageContext.request.contextPath}/rest/dm/room",
	    		method: "get"
	    	})
	    	.then(resp=>{
				this.roomList = resp.data;
				const index = this.roomList.findIndex(v => v.roomNo == this.roomNo);
				this.selectIndex = index;
	    	});
		};
		
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", false);//입력창 활성화
			$(".btn-send").prop("disabled", false);//전송버튼 활성화
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", true);//입력창 비활성화
			$(".btn-send").prop("disabled", true);//전송버튼 비활성화
		}
		this.socket = socket;
		
		
		//param이 있으면 방에 바로입장시키기
		if(${param.targetNo != null && param.targetNo != 0}){
			const targetNo2 = "${param.targetNo}";
			const targetAttachNo = "${targetVO.attachNo}";
			const targetMemberNo = "${targetVO.memberNo}";
			const targetMemberNick = "${targetVO.memberNick}";
			axios({
	    			url:"${pageContext.request.contextPath}/rest/dm/room_search",
	    			method:"Post",
	    			params:{
	    				targetNo:targetNo2,
	    			}
	    		})
	    		.then(resp=>{
	    			console.log(resp.data);
	    			const index = this.roomList.findIndex(v => v.roomNo == resp.data);
	    			if(index!=-1){
	    				this.enterRoom(resp.data, index);
	    				return;
	    			}
	    			this.roomNo = resp.data;
	    			this.roomMember = [targetNo2];
	    			this.roomList.unshift({
	    								attachNo:targetAttachNo,
	    								memberNick:targetMemberNick,
	    								roomNo:resp.data,
	    								memberNo:targetMemberNo,
	    									});
	    			this.messageList = [];
	    			this.selectIndex = 0;
	    			history.replaceState(null,null,'dm');
	    		});
		}
		
		
		
		
    },
    updated(){
    },
});


app.mount("#app");


</script>


