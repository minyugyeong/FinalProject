<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<h2>로그인? ${login != null}</h2>

<div id="app">
	<div class="container">
		<div class="row mt-3">
			<div class="card col-md-4">
		  		<div class="card-body">
		   			<button v-for="(room, index) in roomList" :key="index" class="roomList btn btn-light" @click="enterRoom(room.roomNo)">
		   				<div>{{room.memberNick}}</div>
		   				<div>{{room.dmRecordTime}} &nbsp; {{room.dmContent}}</div>  
		   			</button>
		  		 </div>
			</div>
			
			<div class="card col-md-8">
		  		<div class="card-body">
		   <!-- 메세지 출력 공간 -->
					<div class="message-wrapper">
						<div v-for="(dm, index) in messageList" :key="index">
							<div><span class="badge bg-light messageList">{{dm.dmContent}}</span><span>{{dm.dmRecordTime}}</span></div>
						</div>
					</div>
					
					<div>
					<input type="text" class="send-input form-control"><input type="button" class="btn-send btn btn-primary" value="전송">
					<!-- <button class="btn-send btn btn-primary">전송</button> -->
					</div>
		 	 	</div>
		 	 </div>
		  </div>
	</div>
</div>
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
	
</style>


<script>
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
			roomList:[],
			messageList:[],
			
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    computed:{

    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
    	enterRoom(roomNo){
    		axios({
    			url: "${pageContext.request.contextPath}/rest/dm/room_record/"+roomNo,
    			method: "get"
    		})
    		.then(resp=>{
    			console.log(resp.data);
    			this.messageList = resp.data;
    		});
    	},

    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{

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
		
		socket.onopen = function(e){
			connectOperation();
			console.log("${param.roomNo}");
			//접속하자마자 나의 채널명을 서버로 전송해야한다(입장메세지)
			var message = {
				type:1,
				roomNo:"${param.roomNo}"
			};
			var json = JSON.stringify(message);
			socket.send(json);
		};
		socket.onclose = function(e){
			/* disconnectOperation(); */
		};
		socket.onerror = function(){
			alert("서버와의 연결 오류가 발생하였습니다");
			/* disconnectOperation(); */
		};
		socket.onmessage = function(e){
			var data = JSON.parse(e.data);//json을 객체로 복구
			var timeObject = moment(data.time).format("hh:mm");//날짜 객체로 변환(momentJS)
			
			var div = $("<div>").addClass("message");
			
			
			var span2 = $("<span>").addClass("text badge bg-secondary").text(data.content);
			var span3 = $("<span>").addClass("time").text(timeObject);
			
			div.append(span3).append(span2);
			$(".message-wrapper").append(div);
		};
			
		
		$(".btn-send").click(function(){
			//채팅메세지를 보내야 한다
			var text = $(".send-input").val();
			if(!text) return;
			
			var message = {
				type:2,
				roomNo:"${param.roomNo}",
				message:text,
				
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