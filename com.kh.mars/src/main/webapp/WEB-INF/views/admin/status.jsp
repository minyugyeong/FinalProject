<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

$(function(){
	
	//성별 관심 유형 현황(전체)
	$.ajax({
		url: "${pageContext.request.contextPath}/rest/status/genderInterest/",
		type: "get",
		dataType: "json",
		success: function(resp){
			let labels = [];
			for(let i = 0; i < resp.length; i++){
				labels.push(resp[i].memberInterest);
			}
			let count = [];
			for(let i = 0; i < resp.length; i++){
				count.push(resp[i].countGenderAll);
			}
			
			let data = {
				labels: labels,
				datasets: [{
					label: labels,
					backgroundColor: [
						'#e74b46',
        	  '#cf201a',
        	  '#941613',
            '#eb6864',
            '#590d0b',
            '#3b0907'
					],
					borderColor: 'white',
					data: count,
				}]
			};
			
			let config = {
				type: 'doughnut',
				data: data,
				options: {
					responsive: false
				}
			};
			
			let myChart = new Chart(
				document.querySelector('#myChartGenderAll'),
				config
			);
		}
	});
	
	//성별 관심 유형 현황(남성)
	$.ajax({
		url: "${pageContext.request.contextPath}/rest/status/manInterest/",
		type: "get",
		dataType: "json",
		success: function(resp){
			let labels = [];
			for(let i = 0; i < resp.length; i++){
				labels.push(resp[i].memberInterest);
			}
			let count = [];
			for(let i = 0; i < resp.length; i++){
				count.push(resp[i].countGenderMan);
			}
			
			let data = {
				labels: labels,
				datasets: [{
					label: labels,
					backgroundColor: [
						'#e74b46',
        	  '#cf201a',
        	  '#941613',
            '#eb6864',
            '#590d0b',
            '#3b0907'
					],
					borderColor: 'white',
					data: count,
				}]
			};
			
			let config = {
				type: 'doughnut',
				data: data,
				options: {
					responsive: false
				}
			};
			
			let myChart = new Chart(
				document.querySelector('#myChartGenderMan'),
				config
			);
		}
		
	});
	
	//성별 관심 유형 현황(여성)
	$.ajax({
		url: "${pageContext.request.contextPath}/rest/status/womanInterest/",
		type: "get",
		dataType: "json",
		success: function(resp){
			let labels = [];
			for(let i = 0; i < resp.length; i++){
				labels.push(resp[i].memberInterest);
			}
			let count = [];
			for(let i = 0; i < resp.length; i++){
				count.push(resp[i].countGenderWoman);
			}
			
			let data = {
				labels: labels,
				datasets: [{
					label: labels,
					backgroundColor: [
						'#e74b46',
        	  '#cf201a',
        	  '#941613',
            '#eb6864',
            '#590d0b',
            '#3b0907'
					],
					borderColor: 'white',
					data: count,
				}]
			};
			
			let config = {
				type: 'doughnut',
				data: data,
				options: {
					responsive: false
				}
			};
			
			let myChart = new Chart(
				document.querySelector('#myChartGenderWoman'),
				config
			);
		}
		
	});
	
	//광고 유형별 현황
	$.ajax({
		url: "${pageContext.request.contextPath}/rest/status/adInterest/",
		type: "get",
		dataType: "json",
		success: function(resp){
			let labels = [];
			for(let i = 0; i < resp.length; i++){
				labels.push(resp[i].memberInterest);
			}
			let count = [];
			for(let i = 0; i < resp.length; i++){
				count.push(resp[i].countAd);
			}
			
			let data = {
				labels: labels,
				datasets: [{
					label: labels,
					backgroundColor: [
						'#e74b46',
        	  '#cf201a',
        	  '#941613',
            '#eb6864',
            '#590d0b',
            '#3b0907'
					],
					borderColor: 'white',
					data: count,
				}]
			};
			
			let config = {
				type: 'doughnut',
				data: data,
				options: {
					responsive: false
				}
			};
			
			let myChart = new Chart(
				document.querySelector('#myChartAdInterest'),
				config
			);
		}
		
	});
	
	//광고 유형별 매출액
	$.ajax({
		url: "${pageContext.request.contextPath}/rest/status/adSales/",
		type: "get",
		dataType: "json",
		success: function(resp){
			
			let labels = [];
			labels.push('예술');
			labels.push('스포츠');
			labels.push('여행');
			labels.push('뷰티');
			labels.push('패션');
			labels.push('요리');
			 
			let sumArt = [];
			let sumSport = [];
			let sumTravel = [];
			let sumBeauty = [];
			let sumFashion = [];
			let sumCook = [];
			
			for(let i = 0; i < resp.length; i++){
				sumArt.push(resp[i].sumArt);
				sumSport.push(resp[i].sumSport);
				sumTravel.push(resp[i].sumTravel);
				sumBeauty.push(resp[i].sumBeauty);
				sumFashion.push(resp[i].sumFashion);
				sumCook.push(resp[i].sumCook);
			}
			
			let data = {
				labels: labels,
				datasets: [{
						label: '',
						data: [sumArt, sumSport, sumTravel, sumBeauty, sumFashion, sumCook],
						backgroundColor: [
							'#e74b46',
	        	  '#cf201a',
	        	  '#941613',
	            '#eb6864',
	            '#590d0b'
						],
						borderColor: 'white',
					},
				]
			};
			
			let config = {
				type: 'bar',
				data: data,
				options: {
						plugins: {
							legend: {
				        display: false
				    	},
							
						},
         }
			};
			
			let myChart = new Chart(
				document.querySelector('#myChartAdSales'),
				config
			);
		}
		
	});
	
	//연도별 매출액
	$.ajax({
		url: "${pageContext.request.contextPath}/rest/status/yearSales/",
		type: "get",
		success: function(resp){
			
			let labels = [];
			for(let i = 0; i < resp.length; i++){
				labels.push(resp[i].year + '년');
			}
			
			let sumPrice = [];
			for(let i = 0; i < resp.length; i++){
				sumPrice.push(resp[i].sumPrice);
			}
			
			let data = {
					labels: labels,
					datasets: [{
						label: '',
						backgroundColor: '#e74b46',
						borderColor: '#e74b46',
						data: sumPrice,
					}]
				};
				
				let config = {
					type: 'line',
					data: data,
					options: {
						responsive: true,
						plugins: {
							legend: {
								display: false
							},
						},
					}
				};
				
				let myChart = new Chart(
					document.querySelector('#myChartYearSales'),
					config
				);
			}
			
		});
	
		$("input[name=year]").click(function(){
	
			$('#myChartMonthSales').remove();
			$('.showChart').append('<canvas id="myChartMonthSales" style="display: inline; width: 65%;"></canvas>');
			let year = $(this).val();
			changeYear(year);
		})
		
		let year = 2022;
		changeYear(year);
		
		//월별 매출액
		function changeYear(year){
			
		$.ajax({
			
			url: "${pageContext.request.contextPath}/rest/status/monthSales?year="+year,
			type: "get",
			success: function(resp){
				
				let labels = [];
				for(let i = 0; i < resp.length; i++){
					labels.push(resp[i].month + '월');
				}
				
				let sumPrice = [];
				for(let i = 0; i < resp.length; i++){
					sumPrice.push(resp[i].sumPrice);
				}
				
				let data = {
						labels: labels,
						datasets: [{
							label: '',
							backgroundColor: '#e74b46',
							borderColor: '#e74b46',
							data: sumPrice,
						}]
					};
					
					let config = {
						type: 'line',
						data: data,
						options: {
							responsive: true,
							plugins: {
								legend: {
									display: false
								},
							},
						}
					};
					
					let myChart = new Chart(
							document.querySelector('#myChartMonthSales'),
							config
						);
				}
			});
		}
		
		
		$(".adBtn").click(function(){
			$(".genderInterest").hide();
			$(".sales").hide();
			$(".adInterest").show();
		});
		
		$(".salesBtn").click(function(){
			$(".genderInterest").hide();
			$(".adInterest").hide();
			$(".sales").show();
		});
		
		$(".genderBtn").click(function(){
			$(".genderInterest").show();
			$(".adInterest").hide();
			$(".sales").hide();	
		});
});

</script>

<div class="container">
	
	<!-- 버튼 영역 -->
	<div class="row mt-4">
		<div class="col-2"></div>
		<div class="col-8 text-center">
			<button class="btn btn-outline-success btn-lg genderBtn">회원 관심 유형</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-outline-success btn-lg adBtn">광고 유형별 현황</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-outline-success btn-lg salesBtn">매출액 현황</button>
		</div>
		<div class="col-2"></div>
	</div>
	
	<div class="row mt-5"></div>
	
	<!-- 회원 관심 유형 -->
	<div class="row mt-4 genderInterest">
		<div class="row text-center">
			<div class="col mb-4">
				<h2 style="color: #eb6864;">&lt;&nbsp;성별 관심 유형 현황(전체)&nbsp;&gt;</h2>
			</div>
		</div>
		<div class="row text-center">
			<div class="col">
				<canvas id="myChartGenderAll" style="display: inline; width: 400px;"></canvas>
			</div>
		</div>
		<div class="row mt-5"></div>
		<div class="row text-center mt-5">
			<div class="col-6">
				<div class="row">
					<div class="col mb-4">
						<h2 style="color: #eb6864;">&lt;&nbsp;성별 관심 유형 현황(남성)&nbsp;&gt;</h2>
					</div>
				</div>
				<canvas id="myChartGenderMan" style="display: inline; width: 400px;"></canvas>
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col mb-4">
						<h2 style="color: #eb6864;">&lt;&nbsp;성별 관심 유형 현황(여성)&nbsp;&gt;</h2>
					</div>
				</div>
				<canvas id="myChartGenderWoman" style="display: inline; width: 400px;"></canvas>
			</div>
		</div>
	</div>
	
	
	<!-- 광고 유형별 현황 -->
	<div class="row mt-4 adInterest">
		<div class="row text-center">
			<div class="col mb-4">
				<h2 style="color: #eb6864;">&lt;&nbsp;광고 유형별 현황&nbsp;&gt;</h2>
			</div>
		</div>
		<div class="row text-center">
			<div class="col">
				<canvas id="myChartAdInterest" style="display: inline; width: 400px;"></canvas>
			</div>
		</div>
		
		<div class="row mt-5"></div>
		
		<div class="row text-center mt-5">
			<div class="col">
				<div class="row">
					<div class="col mb-4">
						<h2 style="color: #eb6864;">&lt;&nbsp;광고 유형별 매출액&nbsp;&gt;</h2>
					</div>
				</div>
				<div class="row text-center" style="width: 800px; display: inline;">
					<canvas id="myChartAdSales" style="display: inline; width: 65%;"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 연도별 매출액 -->
	<div class="row mt-4 sales">
		<div class="row text-center mt-5">
			<div class="col">
				<div class="row">
					<div class="col mb-4">
						<h2 style="color: #eb6864;">&lt;&nbsp;연도별 매출액&nbsp;&gt;</h2>
					</div>
				</div>
				<div class="row text-center" style="width: 800px; display: inline;">
					<canvas id="myChartYearSales" style="display: inline; width: 65%;"></canvas>
				</div>
			</div>
		</div>
		
		<div class="row mt-5"></div>
		
		<div class="row text-center mt-5">
			<div class="col">
				<div class="row">
					<div class="col mb-4">
						<h2 style="color: #eb6864;">&lt;&nbsp;월별 매출액&nbsp;&gt;</h2>
					</div>
				</div>
				
				<div class="row form-check">
					<div class="col">
						<label class="form-check-label" for="2022"><input type="radio" value="2022" name="year" class="form-check-input" id="2022" checked>2022년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>					
						<label class="form-check-label" for="2023"><input type="radio" value="2023" name="year" class="form-check-input" id="2023">2023년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>				
						<label class="form-check-label" for="2024"><input type="radio" value="2024" name="year" class="form-check-input" id="2024">2024년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>			
						<label class="form-check-label" for="2025"><input type="radio" value="2025" name="year" class="form-check-input" id="2025">2025년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					</div>
				</div>
				
				<div class="row showChart text-center" style="width: 800px; display: inline;">
					<canvas id="myChartMonthSales" style="display: inline; width: 65%;"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mt-5"></div>
	
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
