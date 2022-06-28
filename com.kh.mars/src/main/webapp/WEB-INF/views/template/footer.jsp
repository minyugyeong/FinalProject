<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</section>
    </main>


    <footer>

    </footer>
    <!-- vue js도 lazy loading을 사용한다 -->
    
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //method : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                
            },
            // watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
            //데이터 및 구성요소 초기화 전
            beforeCreate(){},
            //데이터 및 구성요소 초기화 후, data에 접근 가능하므로 ajax를 여기서 사용하여 데이터를 불러온다
            created(){},
            //데이터가 화면에 마운트 되기 전(View 생성 전)
            boeforeMount(){},
            mounted(){},
            beforeUpdate(){},
            updated(){},
            
        });
        app.mount("#navi");
    </script>
</body>
</html>