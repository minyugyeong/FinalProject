<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	${memberDto.memberNo}의 페이지
	프로필 사진 :
	<br><br>
	<a href="edit">프로필 편집</a>
	<br><br>
	닉네임 : ${memberDto.memberNick }
	<br><br>
	게시물 수 : ${boardNum }
	<br><br>
	팔로워 수 : ${follower }
	<br><br>
	팔로잉 수 : ${follow }
	
	<!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app" class="container w950 m30">
    <!-- 화면 영역 -->
    <!-- Button trigger modal -->
<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="followList">
    팔로우 ${follow}
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">팔로우</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p v-for="(f,index) in follow" v-bind:key="index">
                프로필사진{{f.attachNo}}
                {{f.memberNick}}
            </p>
        </div>
      </div>
    </div>
  </div>

  <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal2" @click="followerList">
    팔로워 ${follower }
  </button>

  <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">팔로워</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p v-for="(fm,index) in follower" v-bind:key="index">
              프로필사진{{fm.attachNo}}
              {{fm.memberNick}}
          </p>
        </div>
      </div>
    </div>
  </div>

</div> 
    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            // data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return{
                    follow:[],
                    follower:[],
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                followList(){
                    axios({
                        url:"http://localhost:8080/mars/follow?memberNo="+ ${memberDto.memberNo},
                        method:"get"
                    })
                    .then((resp)=>{
                        this.follow=resp.data;
                    })
                },
                followerList(){
                    axios({
                        url:"http://localhost:8080/mars/follower?memberNo=" + ${memberDto.memberNo}, 
                        method:"get"
                    })
                    .then((resp)=>{
                        this.follower=resp.data;
                    })
                },
            },
            created(){
               
            }
        });
        app.mount("#app");
    </script>

	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>