<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app">
		<table class="table table-hover table-prymary">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
		</table>
    </div>

    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
					member
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{

            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{

            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{

            },
            created:{
            	axios({
					url:"${pageContext.request.contextPath}/rest/exam/",
					method:"get"
				})
				.then((resp)=>{
					this.dataList.push(...resp.data);
				})
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

    
