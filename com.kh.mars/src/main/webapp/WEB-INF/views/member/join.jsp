<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/journal/bootstrap.min.css" integrity="sha512-jt3EWRy/gs+PmzhhDm8quZeSrR/RaXSYeuYEo5bFz9W2uZ1hqh01VVn/dBvqEWgfNZaa0Zg7GJ1L92pTRbbHFg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>

    </style>
</head>
<body>
    <!-- 화면 영역 -->
    
<form action="join" method="post" novalidate autocomplete="off" class="require-validation">
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
            <input type="email" class="form-control member-email" id="floatingInput" placeholder="name@example.com" name="memberEmail">
            <label for="floatingInput">이메일 주소</label>
            <div class="invalid-feedback">사용할 수 없는 이메일 입니다</div>
            <span></span>
        </div>

        <div class="row form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" placeholder="memberNick" name="memberNick">
            <label for="floatingInput">닉네임</label>
            <div class="invalid-feedback">영문 대/소문자,특수문자(-_.) 4~16글자로 작성해주세요</div>
        </div>
        
        <div class="row form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="memberPassword">
            <label for="floatingPassword">비밀번호</label>
            <div class="invalid-feedback">영문 대/소문자, 특수문자, 숫자가 반드시 포함된 8~16자로 작성하세요</div>
        </div>

        <div class="row form-floating mb-3">
            <input type="text" class="form-control" id="floatingNumber" placeholder="PhoneNumber" name="memberPhone">
            <label for="floatingNumber">전화번호</label>
            <div class="invalid-feedback">올바른 형식이 아닙니다</div>
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
                    <input type="text" class="form-control" id="floatingNumber" placeholder="memberHighschool" name="memberHighschool" >
                    <label for="floatingNumber">고등학교</label>
                </div>

                <div class="row form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNumber" placeholder="memberUniversity" name="memberUniversity" >
                    <label for="floatingNumber">대학교</label>
                </div>

                <div class="row form-floating mb-3">
                    <div class="mb-2">
                    <label>관심사</label>
                    </div>
                        <select class="form-select" name="memberInterest">
                            <option>선택</option>
                            <option>예술</option>
                            <option>패션</option>
                            <option>요리</option>
                            <option>스포츠</option>
                            <option>뷰티</option>
                            <option>여행</option>
                        </select>
                    
                </div>

        <div class="row">
            <button type="button" class="btn btn-primary btn-next mb-2 btn-send-mail">다음</button>
            <button type="button" class="btn btn-secondary btn-prev">돌아가기</button>
        </div>
    </div>

    <div class="container col-lg-4 card p-5 mt-5 page">
        <div class="row form-floating mb-3">
            <input type="text" class="form-control cert-number" id="floatingCertNum" placeholder="certNum" name="certNum">
            <label for="floatingCertNum">인증번호</label>
            <input type="button" value="인증하기" class="btn-cert-check mt-3 btn btn-secondary">
            <button type="submit" class="btn btn-primary mt-3 btn-join">가입</button>
        </div>
    </div>
</form>

<div class="container col-lg-4 card p-4 mt-3 mb-3">
    <div class="text-center">
        계정이 있으신가요 ?  <a href="login">로그인</a>
    </div>
</div>
    <!-- lazy loading 배치 - 기능은 다소 늦게 돌아가지만 화면을 먼저 띄울 수 있다 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        $(function(){
        	$(".btn-join").prop("disabled", true);
            var index=0;
            var object = {
            		memberEmail:"",
            		cert:false,
            };

           /*  $(".page:gt(0)").hide(); */

            $(".btn-send-mail").click(function(){
                var memberEmail = $(".member-email").val();

                $.ajax({
                    url:"${pageContext.request.contextPath}/sendMail",
                    type:"post",
                    data:{
                        memberEmail:memberEmail
                    }, 
                    success:function(resp){
                       object.memberEmail = memberEmail;
                    }
                });
            });

            $(".btn-cert-check").click(function(){
                var memberEmail = object.memberEmail;
                var number = $(".cert-number").val();

                $.ajax({
                    url:"${pageContext.request.contextPath}/certCheck",
                    type:"post",
                    data:{
                        memberEmail:memberEmail,
                        certNumber:number
                    },
                    success:function(resp){
                        if(resp){
                            $(".btn-cert-check").prop("disabled", true);
                            $(".member-email").prop("readonly", true);
                            $(".cert-number").prop("disabled", true);
                            $(".btn-join").prop("disabled", false);
                            object.cert = true;
                            alert("인증 성공");
                        }
                        else{
                            alert("인증번호가 일치하지 않습니다");
                        }
                    },
                    error:function(){
    					console.log("통신 오류");	
    				}
                });
            });

           /*  $(".btn-next").click(function(){
                index++;
                $(".page").hide();
                $(".page").eq(index).show();
            });

            $(".btn-prev").click(function(){
                index--;
                $(".page").hide();
                $(".page").eq(index).show();
            }); */

            $("input[name=memberEmail]").blur(function(){
                var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                var memberEmail = regex.test($(this).val());
                
                /* //형식검사
                if(memberEmail == false){
                	return;
                } */
         		$(this).removeClass("is- valid is-invalid");
                $(this).addClass(memberEmail ? "is-valid" : "is-invalid")
                
                //중복확인
                $.ajax({
                	url : "${pageContext.request.contextPath}/checkEmail",
                	type:"get",
                	data:{
                		memberEmail : memberEmail
                	},
                	success:function(resp){
                		if(resp = true){
                			$(that).next("span").text("아")
                		}
                		else if(resp = false){
                			$(that).next("span").text("아")
                		}
                	}
                })

                
            });
            
            /*  var that = this;
            
            $.ajax({
            	url : "${pageContext.request.contextPath}/checkEmail",
            	type:"get",
            	data:{
            		//<input type="hidden" name="memberEmail" value="데이터">
            		memberEmail : 데이터
            	},
            	success:function(resp){
            		if(resp === "Y"){
            			$(that).next("span").text("이미 사용중인 이메일입니다");
            			object.memberEmail = false;
            		}
            		else if(resp === "N"){
            			$(that).next("span").text("사용 가능한 이메일입니다");
            			object.memberEmail = true;
            		}
            	}
            });  */

            $("input[name=memberPassword]").blur(function(){
                var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
                var memberPassword = regex.test($(this).val());

                $(this).removeClass("is-valid is-invalid");
                $(this).addClass(memberPassword ? "is-valid" : "is-invalid")
            });

            $("input[name=memberPhone]").blur(function(){
                var regex = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
                var memberPhone = regex.test($(this).val());

                $(this).removeClass("is-valid is-invalid");
                $(this).addClass(memberPhone ? "is-valid" : "is-invalid");
            });

            $("input[name=memberNick").blur(function(){
                var regex = /^(?=.*[a-zA-Z])[-a-zA-Z0-9_.]{4,16}$/;
                var memberNick = regex.test($(this).val());

                $(this).removeClass("is-valid is-invalid");
                $(this).addClass(memberNick ? "is-valid" : "is-invalid");
            });
        });



    </script>
</body>
</html>