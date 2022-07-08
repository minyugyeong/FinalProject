<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.title{
    font-size: xx-large;
    color: #eb6864;
    text-align: center;
    font-weight: bold;
  }
  
  .btn-primary {
    color: #fff;
    background-color: #eb6864;
    border-color: #eb6864;
    width: 120px;
	}
	
	.btn-secondary {
    color: #fff;
    background-color: #aaa;
    border-color: #aaa;
    width: 120px;
	}
	
</style>

<div id="app" class="container" style="width: 1000px;">
	
	<div class="row-mt-5 mt-2">
		<div class="col-md-6 offset-md-3">
			<div class="title">광고 관리</div>
		</div>
	</div>
	
	<div class="row mb-5"></div>
	
	<!-- 등록/수정 영역 -->
	<div class="row mb-5">
		
		<div class="col-2">
			<input type="text" class="form-control" placeholder="번호" v-model.number="currentData.adNo" readonly>
		</div>
		
		<div class="col-3">
			<input type="number" step="1000" class="form-control" placeholder="노출수" v-model="currentData.adCount">
		</div>
		
		<div class="col-3">
			<input type="number" step="10000" class="form-control" placeholder="가격" v-model="currentData.adPrice">
		</div>
		
		<div class="col-2 text-center">
			<button type="button" class="btn btn-primary" v-on:click="addAd">{{mode}}</button>
		</div>
		
		<div class="col-2 text-center">
			<button type="button" class="btn btn-secondary" v-on:click="clearAd()">취소</button>
		</div>
		
	</div>
	
	<!-- 리스트 영역 -->
	<div class="row-mt-5">
		<div class="col">
			<table class="table table-hover border" style="width: 100%;">
				<thead>
					<tr class="text-center">
						<th>번호</th>
						<th>노출수(회)</th>
						<th>가격(원)</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(ad, index) in adList" v-bind:key="index"  class="text-center align-middle">
						<td>{{ad.adNo}}</td>
						<td>{{ad.adCount}}</td>
						<td>{{ad.adPrice}}</td>
						<td width="20%">
							<a href="#" class="btn btn-outline-success" v-on:click.prevent="selectAd(index);">수정</a>&nbsp;
							<a href="#" class="btn btn-outline-danger" v-on:click.prevent="deleteAd(index);">삭제</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</div>


<!-- ----------------------------------------------------------------------------->
<script>
  //div[id=app]을 제어할 수 있는 Vue instance를 생성
  const app = Vue.createApp({
    //data 영역 : 화면을 구현하는데 필요한 데이터를 작성해둔다.
    data(){
      return {
        adList:[],
        currentData:{
        	adNo:"",
        	adCount:"",
        	adPrice:"",
        },
        
        index: -1,
      };
    },

    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    //- 3줄보다 많다면 사용하지 않는 것을 권장한다.(복잡한 계산 시 성능 저하가 발생)
    computed:{
    		
    	mode(){
    		return this.index < 0 ? "등록" : "수정";
    	},
    	
    	insertMode(){
    		return this.mode == "등록";
    	},
    	
    	editMode(){
    		return this.mode == "수정";
    	},
    
    },

    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
    	
    	//입력창 지우기
    	clearAd(){
    		this.currentData = {
    				adNo:"",
    				adCount:"",
    				adPrice:""
    		}
    		this.index = -1;
    	},
    	
    	//선택하기
    	selectAd(index){
    		this.currentData = this.adList[index];
    		this.index = index;
    	},
     
    	//광고 추가, 수정
    	addAd(){
    		let type;
    		if(this.insertMode){
    			type = "post";
    		}
    		else if(this.editMode){
    			type="put";
    		}
    		
    		if(!type) return;
    		
    		axios({
    			url: "${pageContext.request.contextPath}/rest/ad/",
    			method: type,
    			data: this.currentData
    		})
    		.then((resp)=>{
    			if(this.insertMode){
    				this.adList.push(resp.data);
    				this.clearAd();
    				window.alert("등록 완료");	
    			}
    			else if(this.editMode){
    				this.adList[this.index] = resp.data;
    				this.clearAd();
    				window.alert("수정 완료");
    				
    			}
    			
    		});
    	},
    	
    	//삭제
    	deleteAd(index){
    		let choice = window.confirm("정말 삭제하시겠습니까?");
    		if(choice == false) return;
    		
    		const adNo = this.adList[index].adNo;
    		axios({
    			url: "${pageContext.request.contextPath}/rest/ad/" + adNo,
    			method: "delete"
    		})
    		.then(()=>{
    			this.adList.splice(index, 1);
    		});
    	}
    	
    },

    created(){
    	axios({
    		url: "${pageContext.request.contextPath}/rest/ad/",
    		method: "get"
    	})
    	.then((resp)=>{
    		this.adList.push(...resp.data);
    	})
    },
    
    

  });
  app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

