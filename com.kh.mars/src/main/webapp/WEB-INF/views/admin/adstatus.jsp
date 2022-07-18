<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
 $(function () {
    
 	$.ajax({
	  url: "${pageContext.request.contextPath}/rest/status/interestAd/",
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
          label: '유형별 광고',  //차트 범례
          backgroundColor: [
            
        	 
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
  	  url: "${pageContext.request.contextPath}/rest/status/adsum/",
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
      	  count.push(resp[i].sum);
        }
        //data : 차트에 표시될 데이터
        var data = {
          labels: labels,
          datasets: [{
            label: '광고별 매출액',  //차트 범례
            backgroundColor: [
              
          	 
                '#00ADB5'
              
            ], //배경색
            borderColor: 'white', //테두리색
            data: count, //데이터
          }]
        };
        //차트의 형태 등을 설정(옵션, 환경설정)
        var config = {
          type: 'bar', //차트의 모양
          data: data, //차트의 데이터
          options: {
          
          }
        };
        //차트 생성 구문
        var myChart = new Chart(
          document.querySelector('#myChart1'), //차트 적용 대상
          config //차트 옵션
          );
      }
    });
     
 });
</script>
    
    <div class="container" style="width: 1000px;">
        <div class="row text-center">
            <h1>광고 유형 현황</h1>
        </div>
        <div class="row">
            <canvas id="myChart"></canvas>
        </div>
        <div class="row text-center">
            <h1>광고별 매출액</h1>
        </div>
        <div class="row">
            <canvas id="myChart1"></canvas>
        </div>
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>