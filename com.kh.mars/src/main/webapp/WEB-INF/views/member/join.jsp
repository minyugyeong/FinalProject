<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VueJS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/journal/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <style>
        
    </style>
</head>
<body>

    <div id="app">
        <form novalidate autocomplete="off" class="require-validation">
            <div class="container col-lg-4 card p-5 mt-5 page">
                <div class="img p-4 text-center">
                    <div>로고 자리</div>
                </div>
        
                <div class="mb-2 text-center">
                    <h4>친구들의 사진과 동영상을 보려면 가입하세요.</h4>
                </div>
        
                <div class="mb-2 text-center"><a href="#">facebook로그인</a></div>
        
                <div class="mb-4 text-center">또는</div>
        
                <div class="row form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="memberId" v-model="memberId">
                    <label for="floatingInput">이메일 주소</label>
                </div>
        
                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="nickName" name="memberNick" v-model="memberNick" v-on:input="memberNick = $event.target.value">
                    <label for="floatingInput">닉네임</label>
                </div>
        
                <div class="row form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="memberPassword" v-model="memberPassword">
                    <label for="floatingPassword">비밀번호</label>
                    <div class="invalid-feedback">영문 대/소문자, 특수문자, 숫자가 반드시 포함된 8~16자로 작성하세요</div>
                </div>

                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNumber" placeholder="PhoneNumber" name="memberPhone" v-model="memberPhone">
                    <label for="floatingNumber">전화번호</label>
                </div>
                
                <div class="row">
                    <button type="button" class="btn btn-primary btn-next">가입</button>
                </div>
            </div>  
        
            <div class="container col-lg-4 card p-5 mt-5 page">

                <label>성별</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="memberGender" id="inlineRadio1" value="0">
                    <label class="form-check-label" for="inlineRadio1">남</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="memberGender" id="inlineRadio2" value="1">
                    <label class="form-check-label" for="inlineRadio2">여</label>
                  </div>
                
                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNumber" placeholder="memberHigh" name="memberHigh" v-model="memberHigh">
                    <label for="floatingNumber">고등학교</label>
                </div>

                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNumber" placeholder="memberUniv" name="memberUniv" v-model="memberUniv">
                    <label for="floatingNumber">대학교</label>
                </div>

                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNumber" placeholder="memberInterest" name="memberInterest" v-model="memberInterest">
                    <label for="floatingNumber">관심사</label>
                </div>


        
                <div class="row">
                    <button type="button" class="btn btn-primary btn-next mb-2">다음</button>
                    <button type="button" class="btn btn-secondary btn-prev">돌아가기</button>
                </div>
            </div>
        
            <div class="container col-lg-4 card p-5 mt-5 page">
                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingCertNum" placeholder="certNum" name="certNum" v-model="certNum">
                    <label for="floatingCertNum">인증번호</label>
                    <button type="submit" class="btn btn-primary mt-3">가입</button>
                </div>
            </div>
        </form>
        
        <div class="container col-lg-4 card p-4 mt-3 mb-3">
            <div class="text-center">
                계정이 있으신가요 ?  <a href="#">로그인</a>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        const app = Vue.createApp({
            data(){
                return {
                    memberId:"",
                    memberName:"",
                    memberNick:"",
                    memberPw:"",
                    memberBirth:"",
                    memberPhone:"",
                    certNum:""
                };
            },
            computed:{
                memberIdJudge(){
                    const regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                    return regex.test(this.memberId);
                },
                memberNameJudge(){},
                memberNickJudge(){
                    const regex = /^[0-9a-zA-Z가-힣-_]{3,13}$/;
                    return regex.test(this.memberNick);
                },
                memberPwJudge(){},
                memberBirthJudge(){},
                memberPhoneJudge(){},
                certNumJudge(){},
            },
            methods:{
                
            },
        });
        app.mount("#app");
        
    </script>
</body>
</html>