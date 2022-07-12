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

	<!-- 메뉴 -->
	<div class="row">
        <div class="col-3">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">프로필 편집</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">비밀번호 변경</a>
            <c:if test="${memberDto.memberGrade =='일반회원'}">
            <a href="professional" class="btn">프로페셔널 계정 전환</a>
            </c:if>
            
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
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">

	<!-- 프로필 사진 편집 -->
				<div class="mb-3 row">
					<form action="profile" method="post" id="profileEditBtn" enctype="multipart/form-data">
						<label class="btn" for="memberProfile">프로필 사진 바꾸기</label>
						<input type="file" id="memberProfile" name="memberProfile" class="form-input fill input-round" accept=".jpg, .png" style="display:none;">
						<div class="col-6">
						<button type="submit"  class="btn btn-primary mt-3">변경</button>
						</div>
					</form>
					
					
					<form action="deleteProfile" method="post">
					
						<c:if test="${attachNo != 0 }"><button type="submit" class="btn btn-danger">삭제</button></c:if>
					
					</form>
					
					<div>
						<img src="${pageContext.request.contextPath}${profileUrl}"
		 				width = "150" style="border-radius: 70%;">
	 				</div>
					${memberDto.memberNick }
				</div>
				
	<!-- 프로필 정보 편집 -->
					<form action="edit" method="post">
	
				<div class="mb-3 row">
                    <label for="inputmemberName" class="col-sm-5 col-form-label">이름</label>
                    <div class="col-sm-5">
                      <input type="text" name="memberName" class="form-control" id="inputmemberName" value="${memberDto.memberName }">
                      <h6 class="card-subtitle mb-2 mt-3 text-muted text-center">사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.</h6>
                    </div>
                </div>
				
                <div class="mb-3 row">
                    <label for="inputmemberNick" class="col-sm-5 col-form-label">닉네임</label>
                    <div class="col-sm-5">
                    	<input type="text" name="memberNick" class="form-control" id="inputmemberNick" value="${memberDto.memberNick }">
                    </div>
                </div>
                
                <div class="mb-3 row">
                    <label for="inputmemberIntroduce" class="col-sm-5 col-form-label">소개</label>
                    <div class="col-sm-5">
                    	<textarea name="memberIntroduce" class="form-control">${memberDto.memberIntroduce }</textarea>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberPhone" class="col-sm-5 col-form-label">전화번호</label>
                    <div class="col-sm-5">
                    	<input type="tel" name="memberPhone" class="form-control" id="inputmemberPhone" value="${memberDto.memberPhone }">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberHighschool" class="col-sm-5 col-form-label">고등학교</label>
                    <div class="col-sm-5">
                    	<input type="text" name="memberHighschool" class="form-control" id="inputmemberHighschool" value="${memberDto.memberHighschool }">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputmemberUniversity" class="col-sm-5 col-form-label">대학교</label>
                    <div class="col-sm-5">
                    	<input type="text" name="memberUniversity" class="form-control" id="inputmemberUniversity" value="${memberDto.memberUniversity }">
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
                    <div class="col-sm-5">
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
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                <form action="changePassword" method="post">
                <div class="mb-3 row">
                    <label for="inputPassword1" class="col-sm-2 col-form-label">이전 비밀번호</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword1" name="currentPassword">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword2" class="col-sm-2 col-form-label">새 비밀번호</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword2" name="changePassword">
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">새 비밀번호 확인</label>
                    <div class="col-sm-5">
                      <input type="password" class="form-control" id="inputPassword3" name="checkPassword">
                    </div>
                </div>
                
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
    		
    		console.log($("#memberProfile").val());
    		$("#profileEditBtn").submit(function(){
    			if($("#memberProfile").val()!=""){
    				return true;
    			}else{
    				return false;
    			}
    		})
    	})
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>