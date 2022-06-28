<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div id="app" class="container-fluid">
	
	<div class="row mt-4 center">
		<div class="col-md-8 offset-md-2">
			<h1 class="text-danger">새 게시물 만들기</h1>
		</div>
	</div>
	
	<form action="insert" method="post" enctype="multipart/form-data">
	
		<div class="row mt-4">
			<div class="col-md-8 offset-md-2">
				<label>첨부파일</label>
				<input type="file" name="boardAttach">
			</div>
		</div>
	
	</form>
	
</div>


<script>
  //div[id=app]을 제어할 수 있는 Vue instance를 생성
  const app = Vue.createApp({
    //data 영역 : 화면을 구현하는데 필요한 데이터를 작성해둔다.
    data(){
      return {
        
      };
    },

    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    //- 3줄보다 많다면 사용하지 않는 것을 권장한다.(복잡한 계산 시 성능 저하가 발생)
    computed:{
      
    },

    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
     
    },

    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다.
    watch:{
      
    },

  });
  app.mount("#app");
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

