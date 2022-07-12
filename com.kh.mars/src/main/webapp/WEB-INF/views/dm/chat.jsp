<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
		display:none;
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
</style>

<h2>로그인? ${login != null}</h2>

<article>

<div id="app">
	<div class="container-fluid">
	<div class="offset-3">
		<div class="row mt-3" style="min-width:500px;max-width:70%;margin-bottom:0;padding-left:100px; padding-right:100px;height:50px;">
			
			<div class="card col-3 text-center" style="min-width:100px;border-radius:0;">
				
			</div>
			<div class="card col-8" style="border-radius:0;border-left:0;">
				
			</div>
	
		</div>
		<div class="row" style="min-width:500px;max-width:70%;padding-left:100px; padding-right:100px; margin-top:0;">
			<div class="card col-3" style="min-width:100px;border-radius:0;border-top:none;">
		  		<div class="card-body">
		   			<div v-for="(room, index) in roomList" :key="index" class="roomList" @click="enterRoom(room.roomNo)">
			   				<div>{{room.memberNick}}</div>
			   				<div>{{room.dmRecordTime}} &nbsp; {{room.dmContent}}</div>  
		   			</div>
		  		 </div>
			</div>
			
			<div class="card col-8" style="border-radius:0;border-top:none;border-left:0;">
		  		<div class="card-body" style="padding:0;">
		   <!-- 메세지 출력 공간 -->
					<div class="message-wrapper" style="height:500px; overflow-y:scroll;" @scroll="scrollCheck">
						<div v-for="(dm, index) in messageList" :key="index">
							<div class="message-space" :class="{'lend':myNum!=dm.who, 'send':myNum==dm.who}" style="margin-bottom:5px; padding-right:20px;">
								<span :class="{'hide':myNum!=dm.who||timeCheck(index)}" style="margin-right:2px; font-size:0.8em;">{{dateFormat(dm.dmRecordTime)}}</span>
									<span class="badge bg-light messageList" style="max-width:300px; word-break:break-all;white-space:normal;word-wrap:break-word;font-weight:100!important;">{{dm.dmContent}}</span>
								<span :class="{'hide':myNum==dm.who||timeCheck(index)}" style="margin-left:2px; font-size:0.8em;">{{dateFormat(dm.dmRecordTime)}}</span>
							</div>
						</div>
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
</div>

</article>

<script>
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
        	myNum:"${memberNo}",
        	
			roomList:[],
			messageList:[],
			
			roomMember:[],
			
			roomNo:"",
			socket:null,
			
			inputMessage:"",
			
			bottomFlag:true,
			
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    computed:{

    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
    	//방에입장
    	async enterRoom(roomNo){
    		
    		var message = {
				type:1,
				roomNo:roomNo
			};
			var json = JSON.stringify(message);
			this.socket.send(json);
    		await axios({
    			url: "${pageContext.request.contextPath}/rest/dm/room_record/"+roomNo,
    			method: "get"
    		})
    		.then(resp=>{
    			console.log(resp.data);
    			this.messageList = resp.data;
    			this.roomNo = roomNo;
    		});
    		
    		await axios({
    			url: "${pageContext.request.contextPath}/rest/dm/room_member/"+roomNo,
    			method: "get"
    		})
    		.then(resp=>{
    			console.log(resp.data);
    			this.roomMember = resp.data;
    		});
    		
    		this.scrollMove();
    		
    	},
    	//바닥으로 스크롤 이동
    	scrollMove(){
    		$('.message-wrapper').scrollTop(($('.message-wrapper').prop('scrollHeight')-500));
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
    		return moment(milliSec).format('HH:mm');
    	},
    	dateFormat2(milliSec){
    		return moment(milliSec).format('');
    	},
    	
    	scrollCheck(){
    		console.log($('.message-wrapper').scrollTop());
    		console.log("높이" + ($('.message-wrapper').prop('scrollHeight')-500));
    	},
    	
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
    	}
    	

    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{
		messageList(){
			if(this.bottomFlag){
				this.scrollMove();
			}
		}
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
			console.log("내방", this.roomNo);
			console.log(data);
			console.log(data.roomNo);
			
			this.messageList.push(data);
			
		};
			
		
		/* $(".btn-send").click((resp)=>{
			//채팅메세지를 보내야 한다
			var text = $(".send-input").val();
			if(!text) return;
			
			var message = {
				type:2,
				roomNo:this.roomNo,
				message:text,
				
			};
			var json = JSON.stringify(message);
			socket.send(json);//전송 명령
			
			$(".send-input").val("");//초기화
		}); */
		
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", false);//입력창 활성화
			$(".btn-send").prop("disabled", false);//전송버튼 활성화
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", true);//입력창 비활성화
			$(".btn-send").prop("disabled", true);//전송버튼 비활성화
		}
		this.socket = socket;
    },
});


app.mount("#app");


</script>


<!-- <script>
	$(function(){
		
		var uri = "${pageContext.request.contextPath}/ws/dm";
		
		//접속
		socket = new SockJS(uri);
		
		socket.onopen = function(e){
			connectOperation();
			
			//접속하자마자 나의 채널명을 서버로 전송해야한다(입장메세지)
			var message = {
				type:1,
				roomNo:"${no}"
			};
			var json = JSON.stringify(message);
			socket.send(json);
		};
		socket.onclose = function(e){
			disconnectOperation();
		};
		socket.onerror = function(){
			alert("서버와의 연결 오류가 발생하였습니다");
			disconnectOperation();
		};
		socket.onmessage = function(e){
			var data = JSON.parse(e.data);//json을 객체로 복구
			var timeObject = moment(data.time).format("YYYY-MM-DD hh:mm:ss");//날짜 객체로 변환(momentJS)
			
			var div = $("<div>").addClass("message");
			
			var span1 = $("<span>").addClass("user").text(data.memberNo);
			var span2 = $("<span>").addClass("text").text(data.content);
			var span3 = $("<span>").addClass("time").text(timeObject);
			
			div.append(span1).append(span2).append(span3);
			$(".message-wrapper").append(div);
		};
			
		
		$(".btn-send").click(function(){
			//채팅메세지를 보내야 한다
			var text = $(".send-input").val();
			if(!text) return;
			
			var message = {
				type:2,
				roomNo:"${no}",
				message:text
			};
			var json = JSON.stringify(message);
			socket.send(json);//전송 명령
			
			$(".send-input").val("");//초기화
		});
		
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", false);//입력창 활성화
			$(".btn-send").prop("disabled", false);//전송버튼 활성화
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", true);//입력창 비활성화
			$(".btn-send").prop("disabled", true);//전송버튼 비활성화
		}
		//내 메시지 오른쪽 정렬
		/* function resive(data) {
		var LR = (data.senderName != myName)? "left" : "right";
		 appendMessageTag("right", data.senderName, data.message);
			    } */
		
	});
</script> -->