<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/journal/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <style>
        
    </style>
</head>
<body>
    <div id="app">
        <div class="container col-lg-4 card p-5 mt-5">
    <form action="login" method="post">
            <div class="img p-4 text-center">
                <div>로고 자리</div>
            </div>
            <div class="form-floating mb-3 row">
                <input type="text" class="form-control" id="floatingInput" placeholder="이메일" name="memberEmail">
                <label for="floatingInput">이메일</label>
            </div>
            <div class="form-floating mb-3 row">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="memberPassword">
                <label for="floatingPassword">비밀번호</label>
            </div>
            <div class="row">
                <button class="btn btn-primary">로그인</button>
            </div>
    </form>
            <div class="row text-center m-3">
                <a href="#">비밀번호를 잊으셨나요?</a>
            </div>
        </div>
    
        <div class="container col-lg-4 card p-4 mt-3">
            <div class="text-center">
                계정이 없으신가요 ?  <a href="join">가입하기</a>
            </div>
        </div>

    </div>

    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script>
        const app = Vue.createApp({
            data(){
                return {
                    
                };
            },
            computed:{
                
            },
            methods:{
                
            },
            watch:{
                
            },
        });
        app.mount("#app");
    </script>
</body>
</html>