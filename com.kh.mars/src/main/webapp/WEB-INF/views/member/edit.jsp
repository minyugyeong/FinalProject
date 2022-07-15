<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-fluid">

	<!-- 개인 계정으로 전환하는 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">개인 계정으로 전환하시겠어요?</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>개인 계정으로 전환하시겠습니까? 
		        <br><br>광고로 등록되었던 게시글들이 더 이상 광고로 노출되지 않습니다.</p>
		      </div>
		      <div class="modal-footer">
		      <form action="personal" method="post">
		        <button type="submit" class="btn btn-primary">전환</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 회원 탈퇴 모달 -->
		<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="deleteModalLabel">회원 탈퇴</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <form action="exit" method="post">
		      <div class="modal-body">
		        <p>회원 탈퇴를 진행하시겠습니까?
		        <br><br>비밀번호를 입력해 주세요</p>
		        <input type="password" name="memberPassword" class="form-control">
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary">탈퇴하기</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>

	<!-- 메뉴 -->
	<div class="row">
        <div class="col-3">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active first" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">프로필 편집</a>
            <a class="list-group-item list-group-item-action second" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">비밀번호 변경</a>
            <c:if test="${memberDto.memberGrade =='일반회원'}">
            <a href="professional" class="btn">프로페셔널 계정 전환</a>
            </c:if>
            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#deleteModal" style=color:red;>
            	회원 탈퇴하기
            </button>
            
            <c:if test="${memberDto.memberGrade =='비즈니스회원'}">
            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  개인 계정으로 전환
			</button>
            </c:if>
            
          </div>
        </div>
   
   

   
   
   <!-- 프로필 편집 -->
        <div class="col-6 offset-1">
          <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active first" id="list-home" role="tabpanel" aria-labelledby="list-home-list">

	<!-- 프로필 사진 편집 -->
				<div class="mb-3 row">
					
					
					<form action="deleteProfile" method="post">
					
						<c:if test="${attachNo != 0 }"><button type="submit" class="btn btn-danger">삭제</button></c:if>
					
					</form>
					
					<div>
						<img src="${pageContext.request.contextPath}${profileUrl}"
		 				width = "150" style="border-radius: 70%;">
	 				</div>
					${memberDto.memberNick }
					<form action="profile" method="post" id="profileEditBtn" enctype="multipart/form-data">
						<label class="btn" for="memberProfile">프로필 사진 바꾸기</label>
						<input type="file" id="memberProfile" name="memberProfile" class="form-input fill input-round" accept=".jpg, .png" style="display:none;">
						<div class="col-6">
						<button type="submit"  class="btn btn-primary mt-3">변경</button>
						</div>
					</form>
				</div>
				
	<!-- 프로필 정보 편집 -->
					<form action="edit" method="post">
	
				<div class="mb-3 row">
                    <label for="inputmemberName" class="col-sm-5 col-form-label">이름</label>
                    <div class="col-7">
                      <input type="text" name="memberName" class="form-control" id="inputmemberName" value="${memberDto.memberName }">
                      <h6 class="card-subtitle mb-2 mt-3 text-muted text-center">사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.</h6>
                    </div>
                </div>
				
                <div class="mb-3 row">
                    <label for="inputmemberNick" class="col-sm-5 col-form-label">닉네임</label>
                    <div class="col-7">
                    	<input type="text" name="memberNick" class="form-control" id="inputmemberNick" value="${memberDto.memberNick }">
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="inputmemberIntroduce" id="intro" class="col-sm-5 col-form-label">소개</label>
                    <div class="col-7">
                    	<textarea name="memberIntroduce" id="introduce" class="form-control">${memberDto.memberIntroduce }</textarea>
                    <div id="cnt">(0/1000)</div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberPhone" class="col-sm-5 col-form-label">전화번호</label>
                    <div class="col-7">
                    	<input type="tel" name="memberPhone" class="form-control" id="inputmemberPhone" value="${memberDto.memberPhone }">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="high" class="col-sm-5 col-form-label">고등학교</label>
                    <div class="col-7">
                    	<input type="text" name="memberHighschool" class="form-control" id="high" value="${memberDto.memberHighschool }">
                    	<ul id="highList"></ul>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="univ" class="col-sm-5 col-form-label">대학교</label>
                    <div class="col-7">
                    	<input type="text" name="memberUniversity" class="form-control" id="univ" value="${memberDto.memberUniversity }">
                    	<ul id="univList"></ul>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="inputmemberGender" class="col-sm-5 col-form-label">성별</label>
		          	<div class="form-check form-check-inline">
		              <input <c:if test="${memberDto.memberGender == '0' }">checked</c:if> class="form-check-input" type="radio" name="memberGender" id="inlineRadio1" value="0">
		              <label class="form-check-label" for="inlineRadio1">남</label>
		            </div>
		            <div class="form-check form-check-inline">
		              <input <c:if test="${memberDto.memberGender == '1' }">checked</c:if>  class="form-check-input" type="radio" name="memberGender" id="inlineRadio2" value="1">
		              <label class="form-check-label" for="inlineRadio2">여</label>
		            </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberInterest" class="col-sm-5 col-form-label">관심사</label>
                    <div class="col-7">
                        <select class="form-select" name="memberInterest">
                            <option value="" <c:if test="${memberDto.memberInterest == null }">selected</c:if>>선택</option>
                            <option <c:if test="${memberDto.memberInterest == '예술' }">selected</c:if>>예술</option>
                            <option <c:if test="${memberDto.memberInterest == '패션' }">selected</c:if>>패션</option>
                            <option <c:if test="${memberDto.memberInterest == '요리' }">selected</c:if>>요리</option>
                            <option <c:if test="${memberDto.memberInterest == '스포츠' }">selected</c:if>>스포츠</option>
                            <option <c:if test="${memberDto.memberInterest == '뷰티' }">selected</c:if>>뷰티</option>
                            <option <c:if test="${memberDto.memberInterest == '여행' }">selected</c:if>>여행</option>
                        </select>
                    </div>
                </div>
                
                <c:if test="${memberDto.memberGrade != '비즈니스회원' }">
                <div class="mb-3">
                	<label for="inputmemberPrivate" class="col-sm-5 col-form-label">계정공개 범위</label>
		          	<div class="form-check form-switch form-check-inline">
					  <input <c:if test="${memberDto.memberPrivate == '1'}">checked</c:if> class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="memberPrivate" value="1">
					  <label class="form-check-label" for="flexSwitchCheckDefault">비공개 계정</label>
					</div>
                </div>
                </c:if>
                
                <div class="row">
		            <button type="submit" class="btn btn-primary mt-3">변경</button>
		        </div>
	</form>
            </div>
            
            <!-- 비밀번호 변경 -->
            <div class="tab-pane fade second" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                <form action="changePassword" method="post" class="change-password">
                <div class="mb-3 row">
                    <label for="inputPassword1" class="col-sm-2 col-form-label">이전 비밀번호</label>
                    <div class="col-10">
                      <input type="password" class="form-control" id="inputPassword1" name="currentPassword">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword2" class="col-sm-2 col-form-label">새 비밀번호</label>
                    <div class="col-10">
                      <input type="password" class="form-control" id="inputPassword2" name="changePassword">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">새 비밀번호 확인</label>
                    <div class="col-10">
                      <input type="password" class="form-control" id="inputPassword3" name="checkPassword">
                    </div>
                </div>
                
                <c:if test="${param.error != null }">
                <div class="row text-center">
                	<h4 style="color:red;">비밀번호가 일치하지 않습니다</h4>
                </div>
                </c:if>
                
                <div class="row">
		            <button type="submit" class="btn btn-primary mt-3">변경</button>
		        </div>
                </form>
            </div>
          </div>
        

    	</div>
    	</div>
   </div>
    
    <script>
    	$(function(){
    		var error = ${param.error != null}
    		console.log(error);
    		
    		var passworderror = ${param.passworderror != null}
    		console.log(passworderror);
    		
    		//소개 글자수 제한
		
		   $(document).ready(function(){
			  $('#introduce').on('keyup', function(){
				  $('#cnt').html("("+$(this).val().length+" / 1000)");
				  
		            if($(this).val().length > 1000) {
		                $(this).val($(this).val().substring(0, 1000));
		                $('#cnt').html("(1000 / 1000)");
		            }
			  });
		   });

		    

    		
    		
    		if(passworderror == true){
    			alert("비밀번호가 다릅니다");
    		}
    		
    		if(error == true){
				$(".first").removeClass("active show");
				$(".second").addClass("active show");
				$(".second").removeClass("fade");
				
			}
    		
    		console.log($("#memberProfile").val());
    		$("#profileEditBtn").submit(function(){
    			if($("#memberProfile").val()!=""){
    				return true;
    			}else{
    				return false;
    			}
    		});
    		
    		let status = {
    				memberPasswordCheck : false,
    				memberPasswordSame : false,
    			};
    			console.log(status);
    			
    			$(".change-password").submit(function(){
    				passwordSame.call($("input[name=checkPassword]"));
    				if(status.memberPasswordCheck && status.memberPasswordSame){
    					return true;
    				}
    				else{
    					alert("다시 입력해주세요");
    					return false;
    				}
    				
    			});
    		
    		$("input[name=changePassword]").blur(function(){
    			var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
    			var memberPassword = $(this).val();
                var memberPasswordTest = regex.test(memberPassword);
                
                $(this).removeClass("is-valid is-invalid");
                $(this).addClass(memberPasswordTest ? "is-valid" : "is-invalid");
                if(memberPasswordTest == true){
                	status.memberPasswordCheck = true;
                }
                else{
                	status.memberPasswordCheck = false;
                }
                console.log(status);
    		});
    		
    		$("input[name=checkPassword]").blur(passwordSame);
    		console.log(status);
    		
    		function passwordSame(){
    			var memberPasswordLength = $("input[name=changePassword]").val().length > 0;
    			var memberPassword = $("input[name=changePassword]").val() == $(this).val();
    			
    			if(memberPasswordLength){
    				if(memberPassword){
    					$(this).removeClass("is-valid is-invalid");
    					$(this).addClass("is-valid");
    					status.memberPasswordSame = true;
    				}
    				else{
    					$(this).removeClass("is-valid is-invalid");
    					$(this).addClass("is-invalid");
    					status.memberPasswordSame = false;
    				}
    			}
    			else{
    				$(this).removeClass("is-valid is-invalid");
    				$(this).addClass("is-invalid");
    				status.memberPasswordSame = false;
    			}
    			console.log(status);
    		};
    		
    		//대학교 검색
			$("#univ").on("input",function(){
            
            
            var word = $("#univ").val();
            var encodeWord = encodeURI(word);
            
            $.ajax({
                type : 'GET',
                dataType : 'json',
                url : "http://www.career.go.kr/cnet/openapi/getOpenApi?"
                +"apiKey=3f143116ee8d4868928505ddaf0a16b7"
                +"&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list"
                +"&searchSchulNm="+encodeWord,
                
                success : function(data) {
                    
                    $("#univList").empty();
                    var checkWord = $("#univ").val(); //검색어 입력값
                    
                    if(checkWord.length > 0 && data.dataSearch.content.length > 0){
                        
                        for (i = 0; i < data.dataSearch.content.length; i++) {
                            
                            $("#univList")
                            .append(
                                "<li class='univList' value='"
                                + data.dataSearch.content[i].schoolName
                                + data.dataSearch.content[i].campusName
                                + "' data-input='"
                                + data.dataSearch.content[i].schoolName
                                + data.dataSearch.content[i].campusName
                                + "'>"
                                + "<a class='univ' href='#'>"
                                    + data.dataSearch.content[i].schoolName
                                    + "("
                                    + data.dataSearch.content[i].campusName
                                    + ")"
                                    + "</a>"
                                    + "</li>");

                                }
                                $(".univ").click(function(e){
                                    e.preventDefault();
                                    $('#univ').val($(this).text());
                                    $('#univList').children().remove();
                                });
                            }
                        }
                    });
                });
        //고등학교 검색
			$("#high").on("input",function(){
			    
			    var word = $("#high").val();
			    var encodeWord = encodeURI(word);
			    
			    $.ajax({
			        type : 'GET',
			        dataType : 'json',
			        url : "http://www.career.go.kr/cnet/openapi/getOpenApi?"
			        +"apiKey=3f143116ee8d4868928505ddaf0a16b7"
			        +"&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list"
			        +"&searchSchulNm="+encodeWord,
			        
			        success : function(data) {
			            
			            $("#highList").empty();
			            var checkWord = $("#high").val(); //검색어 입력값
			            
			            if(checkWord.length > 0 && data.dataSearch.content.length > 0){
			                
			                for (i = 0; i < data.dataSearch.content.length; i++) {
			                    
			                    $("#highList")
			                    .append(
			                        "<li class='highList' value='"
			                        + data.dataSearch.content[i].schoolName
			                        + "' data-input='"
			                        + data.dataSearch.content[i].schoolName
			                        + "'>"
			                        + "<a class='high' href='#'>"
			                            + data.dataSearch.content[i].schoolName
			                            + "</a>"
			                            + "</li>");
			
			                        }
			                        $(".high").click(function(e){
			                            e.preventDefault();
			                            $('#high').val($(this).text());
			                            $('#highList').children().remove();
			                        });
			                    }
			                }
			            });
			        });
        
        
    		
    	})
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>