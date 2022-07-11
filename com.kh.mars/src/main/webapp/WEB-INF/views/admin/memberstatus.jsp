<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
	 $(function () {
	      $.ajax({
	    	  url: "${pageContext.request.contextPath}/rest/status/",
	        type: "get",
	        dataType:"json",
	        success: function (resp) {
	          //차트 생성
	          //console.log(resp);
	          //label : X축에 표시될 항목들
	          var labels = [];
	          for (var i = 0; i < resp.length; i++) {
	        	  labels.push(resp[i].gender);
	          }
	          var count = [];
	          for (var i = 0; i < resp.length; i++) {
	        	  count.push(resp[i].count);
	          }
	          //data : 차트에 표시될 데이터
	          var data = {
	            labels: labels,
	            datasets: [{
	              label: '성별별 가입현황',  //차트 범례
	              backgroundColor: [
	            	'#EA2027',
	                '#00ADB5'
	                
	              ], //배경색
	              borderColor: 'white', //테두리색
	              data: count, //데이터
	            }]
	          };
	          //차트의 형태 등을 설정(옵션, 환경설정)
	          var config = {
	            type: 'doughnut', //차트의 모양
	            data: data, //차트의 데이터
	            options: {
	            	responsive : false
	            }
	          };
	          //차트 생성 구문
	          var myChart = new Chart(
	            document.querySelector('#myChart'), //차트 적용 대상
	            config //차트 옵션
	            );
	        }
	      });
	      
	      $.ajax({
	    	  url: "${pageContext.request.contextPath}/rest/status/interest/",
	        type: "get",
	        dataType:"json",
	        success: function (resp) {
	          //차트 생성
	          //console.log(resp);
	          //label : X축에 표시될 항목들
	          var labels = [];
	          for (var i = 0; i < resp.length; i++) {
	            labels.push(resp[i].memberInterest);
	          }
	          var count = [];
	          for (var i = 0; i < resp.length; i++) {
	        	  count.push(resp[i].count);
	          }
	          //data : 차트에 표시될 데이터
	          var data = {
	            labels: labels,
	            datasets: [{
	              label: '회원 관심사',  //차트 범례
	              backgroundColor: [
	            	  '#9980FA',
	            	  '#EE5A24',
	            	  '#A3CB38',
	            	  '#aaa69d',
	            	  '#fff200',
	            	  '#7158e2',
	                  '#00ADB5'
	                
	              ], //배경색
	              borderColor: 'white', //테두리색
	              data: count, //데이터
	            }]
	          };
	          //차트의 형태 등을 설정(옵션, 환경설정)
	          var config = {
	            type: 'doughnut', //차트의 모양
	            data: data, //차트의 데이터
	            options: {
	            	responsive : false
	            }
	          };
	          //차트 생성 구문
	          var myChart = new Chart(
	            document.querySelector('#myChart1'), //차트 적용 대상
	            config //차트 옵션
	            );
	        }
	      });
	      
	      $.ajax({
	    	  url: "${pageContext.request.contextPath}/rest/status/maninterest/",
	        type: "get",
	        dataType:"json",
	        success: function (resp) {
	          //차트 생성
	          //console.log(resp);
	          //label : X축에 표시될 항목들
	          var labels = [];
	          for (var i = 0; i < resp.length; i++) {
	            labels.push(resp[i].memberInterest);
	          }
	          var count = [];
	          for (var i = 0; i < resp.length; i++) {
	        	  count.push(resp[i].count);
	          }
	          //data : 차트에 표시될 데이터
	          var data = {
	            labels: labels,
	            datasets: [{
	              label: '남성 관심사',  //차트 범례
	              backgroundColor: [
	            	  '#9980FA',
	            	  '#EE5A24',
	            	  '#A3CB38',
	            	  '#aaa69d',
	            	  '#fff200',
	            	  '#7158e2',
	                  '#00ADB5'
	              ], //배경색
	              borderColor: 'white', //테두리색
	              data: count, //데이터
	            }]
	          };
	          //차트의 형태 등을 설정(옵션, 환경설정)
	          var config = {
	            type: 'doughnut', //차트의 모양
	            data: data, //차트의 데이터
	            options: {
	            	responsive : false
	            }
	          };
	          //차트 생성 구문
	          var myChart = new Chart(
	            document.querySelector('#myChart2'), //차트 적용 대상
	            config //차트 옵션
	            );
	        }
	      });
	      
	      $.ajax({
	    	  url: "${pageContext.request.contextPath}/rest/status/womeninterest/",
	        type: "get",
	        dataType:"json",
	        success: function (resp) {
	          //차트 생성
	          //console.log(resp);
	          //label : X축에 표시될 항목들
	          var labels = [];
	          for (var i = 0; i < resp.length; i++) {
	            labels.push(resp[i].memberInterest);
	          }
	          var count = [];
	          for (var i = 0; i < resp.length; i++) {
	        	  count.push(resp[i].count);
	          }
	          //data : 차트에 표시될 데이터
	          var data = {
	            labels: labels,
	            datasets: [{
	              label: '여성 관심사',  //차트 범례
	              backgroundColor: [
	                
	            	  '#9980FA',
	            	  '#EE5A24',
	            	  '#A3CB38',
	            	  '#aaa69d',
	            	  '#fff200',
	            	  '#7158e2',
	                  '#00ADB5'
	                
	              ], //배경색
	              borderColor: 'white', //테두리색
	              data: count, //데이터
	            }]
	          };
	          //차트의 형태 등을 설정(옵션, 환경설정)
	          var config = {
	            type: 'doughnut', //차트의 모양
	            data: data, //차트의 데이터
	            options: {
	            	responsive : false
                
	            }
	          };
	          //차트 생성 구문
	          var myChart = new Chart(
	            document.querySelector('#myChart3'), //차트 적용 대상
	            config //차트 옵션
	            );
	        }
	      });
	    });
</script>

	<div class="container">
        <div class="row">
            <canvas id="myChart" width="300" height="300"></canvas>
        </div>
        
        <div class="row">
	            <canvas id="myChart1" width="300" height="300" class="col-4"></canvas>
		        <canvas id="myChart2" width="300" height="300" class="col-4"></canvas>
	        	<canvas id="myChart3" width="300" height="300" class="col-4"></canvas>
        </div>
        
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>