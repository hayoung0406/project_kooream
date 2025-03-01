<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>
<style>
	.btnTd{
		text-align: center;
		padding: 15px;
	}
	.titleTd{
		font-weight: bold;
		height: 45px;
		width: 80px;
		color: gray !important;
	}
	.contentTd{
		width: 300px;
		border-bottom: 1px solid gray;
	}
	#submitTd{
		display:none;
	}
	table td input{
		height: 40px;
 	   width: 298px;
	}
	#mask {
	    position: absolute;
	    left: 0;
	    top: 0;
	    z-index: 999;
	    background-color: #000000;
	    display: none; 
    }
	#modifyForm table {
		min-width: 700px;
		margin: 50px auto 0 auto;
	}
	.profile-img img{
		width: 150px;
		height: 150px;
		border-radius: 50%;
		border: 3px solid #555;
	}
	.profile-img label {
		display: inline-block;
		text-align: center;
		line-height: 30px;
		width: 100px;
		height: 30px;
		border: none;
		border-radius: 10px;
		font-size: 15px;
		color: white;
		background-color: black;
		font-weight: bold;
	}
	.profile-img label:hover {
		cursor: pointer;
		background-color: lightgray; 
	}
	#mainContainer {
		float: left;
	}
	#mainContainer table tr:nth-child(1) h1 {
		font-size: 25px;
		border-bottom: 2px solid #000;
		padding-bottom: 25px;
	}
	#mainContainer table .td-img {
		height: 200px;
		border-bottom: 1px solid #ccc;
	}
	#mainContainer table tr:not(:first-child):not(:nth-child(2)):not(:last-child) {
		height: 50px;
	}
	#mainContainer table tr:not(:first-child):not(:nth-child(2)) td:first-child:not(#modifyTd):not(#submitTd) {
		width: 170px;
	}
	#mainContainer table tr:not(:first-child):not(:nth-child(2)):not(:last-child) td:first-child span {
		font-weight: bold;
	}
	#mainContainer table tr:not(:first-child):not(:nth-child(2)):not(:last-child) td span {
		font-size: 17px;
	}
	#mainContainer table #modifyButtons button,
	#mainContainer table #submitButtons button {
		width: 150px;
 		height: 30px;
		border: none;
		border-radius: 10px;
		font-size: 15px;
		padding: 0px;
		margin: 30px 0 30px 0;
	}
	#mainContainer table #modifyButtons button:first-child,
	#mainContainer table #submitButtons button:first-child {
		color: white;
		background-color: black;
		font-weight: bold;
	}
	#mainContainer table #modifyButtons button:nth-child(2),
	#mainContainer table #submitButtons button:nth-child(2) {
		color: black;
		background-color: lightgray;
		font-weight: bold;
	}
	#mainContainer table #modifyButtons button:hover:first-child,
	#mainContainer table #submitButtons button:hover:first-child {
		cursor: pointer;
		background-color: lightgray;
	}
	#mainContainer table #modifyButtons button:not(:first-child):hover,
	#mainContainer table #submitButtons button:not(:first-child):hover{
		cursor: pointer;
		color: white;
		background-color: black;
	}
	#mainContainer table #submitButtons {
		display: none;
	}
	.layerpop {
	    display: none;
	    z-index: 1000;
	    background: #fff;
	}
	.layerpop_area #title {
	    padding: 10px 10px 10px 10px;
	    border: 0px solid #aaaaaa;
	    background: #f1f1f1;
	    color: white;
	    font-size: 1.3em;
	    font-weight: bold;
	    line-height: 24px;
	    background-color: black;
	    border-top-right-radius: 13px;
	    border-top-left-radius: 13px;
	    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
    }
	.layerpop_area .layerpop_close {
	    width: 25px;
	    height: 25px;
	    display: block;
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    background: transparent url('btn_exit_off.png') no-repeat;
	    color: white;
	    font-weight: bold;
    }
	.layerpop_area .layerpop_close:hover {
	    background: transparent url('btn_exit_on.png') no-repeat;
	    cursor: pointer; 
    }
	.layerpop_area #content {
	    width: 96%;    
	    margin: 2%;
	    color: black;
	    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	}
	#content{
		font-size: 30px; 
		text-align: center; 
		font-weight: bold;  
		
	}
	.pwTitle{
		font-size: 15px;
		text-align: left;
		margin-top: 15px;
	}
	.newPwDiv{
		text-align: left;
		border-bottom: 1px solid #c9bdbd;
    	width: 443px;
    	margin-left: 10px;
	}
	article div{
		margin-bottom: 5px;
	}
	.checkText{
		font-size: 3px;
		color: red;
		text-align: left;
		height: 15px;
		margin-left: 17px;
	}
	#loginInfo{
		margin-top: 150px;
    	display: inline-block;
		ont-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	}
	table button{
		border: 1px solid #d3d3d3;
		background-color: white;
		padding: 15px;
		border-radius: 3px;
		width: 126px;
	}
	h2{
		    width: 800px;
    border-bottom: 3px solid black;
    margin-bottom: 27px;
	}
	button:active {
 		background-color: rgba(34,34,34,.8);
	}
	#matchPwBtn{
		border: 0;
		width: 280px;
		height: 53px;
		border-radius: 7px;
		color: white;
		background-color: black;
		cursor: pointer;
		margin: auto;
	}
</style>

<!-- 회원정보 불러오기 -->
<div id="mainContainer">
	<sec:authentication property="principal.member" var="pri"/>
	<div id="loginInfo">
		<h2>로그인정보</h2>
		<form id="modifyForm" method="post">
		<table>
			<tr>
				<td colspan="2">
					<h1>프로필 정보</h1>
				</td>
			</tr>
			<tr>
				<td class="td-img" colspan="2">
					<div class="profile-img">
						<c:url value="/displayImage" var="imgSrc"><!-- c:url 자동 인코딩  -->
							<c:param name="fileName" value="${pri.uploadPath }/${pri.uuid }_${pri.fileName }"></c:param>
						</c:url>
						<input type="hidden" name="uploadPath" value="${pri.uploadPath }">
						<input type="hidden" name="uuid" value="${pri.uuid }">
						<input type="hidden" name="fileName" value="${pri.fileName }">
						<img alt="profile-img" src="${imgSrc }">
					</div>
				</td>
			</tr>
			<tr>
				<td class="td-id">
					<span>아이디</span>
				</td>
				<td class="contentTd" id="titleId">
					<span>${pri.m_id}</span>
					<input type="hidden" name="m_id" value="${pri.m_id}">
				</td>
			</tr>
			<tr>
				<td class="td-nickname">
					<span>닉네임</span>
				</td>
				<td class="contentTd">
					<span>${pri.m_nickname}</span>
					<input type="hidden" name="m_nickname" value="${pri.m_nickname}">
				</td>
			</tr>
			<tr>
				<td class="td-name">
					<span>이름</span>
				</td>
				<td class="contentTd">
					<span class="info" name="m_name">${pri.m_name}</span>
				</td>
			</tr>
			<tr>
				<td class="td-birth">
					<span>생년월일</span>
				</td>
				<td class="contentTd">
					<span class="info" name="m_bday">${pri.m_bday}</span>
				</td>
			</tr>
			<tr>
				<td class="td-addr">
					<span>주소</span>
				</td>
				<td class="contentTd">
					<span id="addr_Span" name="m_addr"><c:out value="${fn:split(pri.m_addr,'/')[0]}"/></span>
				</td>
			</tr>
			<tr>
				<td class="td-addr2">
					<span>상세주소</span>
				</td>
				<td class="contentTd">
					<span id="addr_detail_Span" name="m_Detail_addr"><c:out value="${fn:split(pri.m_addr,'/')[1]}"/></span>
				</td>
			</tr>
			<tr>
				<td class="td-email">
					<span>이메일</span>
				</td>
				<td class="contentTd">
					<span class="info" name="m_email">${pri.m_email}</span>
					<div id="emailCheck" class="checkText"></div>
				</td>
			</tr>
			<tr>
				<td class="td-phone">
					<span>핸드폰번호</span>
				</td>
				<td class="contentTd">
					<span class="info" name="m_phone">${pri.m_phone}</span>
					<div id="phoneCheck" class="checkText"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="td-buttons">
					<div id="modifyButtons">
						<button id="modifyBtn">개인정보수정</button>
						<button id="deleteBtn">회원탈퇴</button>
					</div>
					<div id="submitButtons">
						<button id="successModify">수정완료</button>
						<button id="back">돌아가기</button>
					</div>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
<!----------------------------- 모달창 -------------------------------------------------------------------------->
<div id="modal">
	
    <!-- 팝업뜰때 배경 -->
    <div id="mask"></div>

    <!--Popup Start -->
    <div id="layerbox" class="layerpop" style="width: 500px; height: 300px; border-radius: 13px;">
    	<form id="goPw">
        <article class="layerpop_area">
        	<div id="title">비밀번호를 입력해주세요.</div>
        	<a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a>
        	<input id="content" type="password" name="m_pw" style="height: 56px; margin-top: 54px; border-radius: 12px; border-color: #80808059;">
        	<button id="matchPwBtn" style="margin-left: 110px; margin-top: 28px;">개인정보수정</button>
        </article>
        </form>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api 사용하기 위해 명시 -->
<script  type="text/javascript">
	$(function(){
		var nicknameCheckValue = 'y';
		var emailCheckValue = 'y';
		var phoneCheckValue = 'y'
		var emptyCheckValue = 'y'
		
		// 이메일 정규식
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 이메일 조건에 맞는지 확인------------------------------------------------
		$(document).on("keyup", "input[name='m_email']", function(e){
			console.log($("input[name='m_email']").val());
			if(!regEmail.test($("input[name='m_email']").val())){
				$("#emailCheck").text("이메일을 확인하세요.");
				emailCheckValue = 'n';
				return;
			}else{
				$("#emailCheck").text("사용가능한 이메일입니다.");
				emailCheckValue = 'y';
			}
		});
		
		// 전화번호 조건에 맞는지 확인------------------------------------------------
		$("input[name='m_phone']").on("keyup", function(e){
			console.log($("input[name='m_phone']").val());
			if($("input[name='m_phone']").val().length != 13){
				$("#phoneCheck").text("전화번호를 전부 입력하세요.");
				phoneCheckValue = 'n'
				return;
			}else{
				$("#phoneCheck").text("");
				phoneCheckValue = 'y'
			}
		});
		// 개인정보 수정 버튼 클릭 이벤트
		$("#modifyBtn").on("click", function(e){
			e.preventDefault();
			var str='';
			// 프로필 이미지 파일 input 추가
			$(".profile-img").append('<label for="profileImgInput">사진 변경</label>')
			$(".profile-img").append('<input type="file" id="profileImgInput" style="display:none"/>');
			$(".profile-img input[type='file']").on('change', function(e) {
				e.preventDefault();
				var file = Array.from(e.target.files)[0];
				var fileType = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
				if (!file.name.match(fileType)) {
					alert('이미지 파일만 업로드 가능합니다.');
					e.target.value = '';
					return;
				};
				
				var src = URL.createObjectURL(file);
				$(".profile-img img").attr('src', src);
			});
			
			$(".info").each(function(idx,item){
				str = $(this).text();
				$(item).parent().css("border",0);
				if($(item).attr("name")=="m_bday"){
					$(item).contents().unwrap().wrap( '<input type="date" name="'+$(item).attr("name")+'" class="inputInfo" value="'+str+'">' );
					return;
				}
				if($(item).attr("name")=="m_phone"){
					$(item).contents().unwrap().wrap( '<input name="'+$(item).attr("name")+'" class="inputInfo" value="'+str+'" oninput="autoHyphen2(this)" maxlength="13">' );
					return;					
				}
				$(item).contents().unwrap().wrap( '<input class="inputInfo" name="'+$(item).attr("name")+'" value="'+str+'">' ); // item 태그를 없애고 input 태그로 감싼다.
				$(item).contents().unwrap().wrap( '<span></span>' ); 
			});
			// 주소는 적을게 많아서 따로 뺌
			$("#addr_Span").parent().css("border",0)
			$("#addr_detail_Span").parent().css("border",0)
			var addr=$("#addr_Span").text();
			var addr_detail=$("#addr_detail_Span").text();
			$("#addr_Span")
				.contents()
				.unwrap()
				.wrap('<input type="text" id="sample6_address" name="m_addr" onclick="sample6_execDaumPostcode()" class="inputInfo" placeholder="주소" value="'+addr+'">');
			$("#addr_detail_Span").contents().unwrap().wrap('<input type="text" name="m_Detail_addr" id="sample6_detailAddress" class="inputInfo" value="'+addr_detail+'"/>');
			
			// 수정완료, 돌아가기 버튼 보이게
			$("#modifyButtons").css("display", "none");
			$("#submitButtons").css("display", "block");
		});
		
		// 돌아가기 버튼 클릭 이벤트
		$("#back").on("click",function(e){
			e.preventDefault();
			location.href="/member/profile";
		});
			
		// 수정완료 버튼 클릭 이벤트
		$("#successModify").on("click", function(e){
			e.preventDefault();
			$(".inputInfo").each(function(idx, item){
				if(!$(item).val()){
					emptyCheckValue = 'n';
					return false;
				}	
			});
			if(nicknameCheckValue == 'y' 
					&& emailCheckValue == 'y'
					&& phoneCheckValue == 'y'
					&& emptyCheckValue == 'y'){
				
				// 모달창 실행 스크립트
				goDetail();
			}else{
				alert("조건에 맞게 입력해주세요.");
				return;
			}
		});
		// 회원탈퇴 버튼 클릭 이벤트
		$("#deleteBtn").on("click",function(e){
			e.preventDefault();
			if(confirm("정말 탈퇴..하시겠습니까?")){ // 확인창 띄우기
				$("#modifyForm").attr("action", "/member/deleteMember");
				$("#modifyForm").submit();
			};
		});
		
		
		
		// 전화번호 input 클릭이벤트
		$(document).on("click","input[name='m_phone']", function(){
			$("input[name='m_phone']").val("");
		});
			
		// 모달창에서 개인정보 수정 버튼 클릭시 이벤트
		$("#matchPwBtn").on("click", function(e){
			e.preventDefault();
			console.log('hello');
			
			//프로필 이미지 업로드 후 file 경로 정보 반환
			var uploadResult = '';
			var formData = new FormData();
		    var inputFile = $(".profile-img input[type='file']")[0];
		    if (inputFile.files.length !== 0) {
			    var file = Array.from(inputFile.files)[0];
			    formData.append("uploadFile", file);
			    
			    $.ajax({
		            type : 'POST',            
		            url : "/member/ajax/matchPw",      
		            data : {m_pw : $("#content").val()},
		            dataType : 'json',
		            success : function(result){
						if(result){ // 컨트롤러에서 리턴받은 값이 true면.
							$.ajax({
								url: "/uploadImageAWS/member",
					            processData: false,
					            contentType: false,
					            data: formData,
								type: 'POST',
								dataType: 'json',
								success: function(result) {
									inputFile.remove();
									$("input[name='fileName']").attr('value', result[0].fileName);
									$("input[name='uuid']").attr('value', result[0].uuid);
									$("input[name='uploadPath']").attr('value', result[0].uploadPath);
									$("#modifyForm").attr("action", "/member/successModify");
									$("#modifyForm").submit();
								}
							});
						}else{
							alert("비밀번호가 일치하지 않습니다.");
							return;
						}
		            }
		        });
		    } else {
		    	$("#modifyForm").attr("action", "/member/successModify");
				$("#modifyForm").submit();
		    }
			
// 			ajax({
// 	            type : 'POST',            
// 	            url : "/member/ajax/matchPw",      
// 	            data : {m_pw : $("#content").val()},
// 	            dataType : 'json',
// 	            success : function(result){
// 					if(result){ // 컨트롤러에서 리턴받은 값이 true면.
// 						$("#modifyForm").attr("action", "/member/successModify");
// 						$("#modifyForm").submit();
// 					}else{
// 						alert("비밀번호가 일치하지 않습니다.");
// 						return;
// 					}
// 	            }
// 	        });
		});
			
	}); // onload end----------------------------------------------------------------------------------
// 	// 프로필 사진 불러오기----------------------------------
// 	$.ajax({
// 		url:'/member/${pri.m_no}',
// 		dataType: 'json',
// 		success: function(result) {
// 			var fileName = result.profileImage.fileName;
// 			var uuid = result.profileImage.uuid;
// 			var uploadPath = result.profileImage.uploadPath;
// 			$('.profile-img img').attr('src', encodeURI('/displayImage?fileName='+uploadPath+"/"+uuid+"_"+fileName));
// 		}
// 	});
	
	
	// 전화번호 조건문--------------------------------------
	const autoHyphen2 = function(target){ 
	// const는 값이 재할당 불가한 변수임. 변수에 함수를 집어넣음으로써 변수선언시 함수가 발동됨. 함수가 발동되게하려면 onload밖에 적어줘야함.
		
		target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
	// 주소 api-----------------------
	function sample6_execDaumPostcode() {
    	new daum.Postcode({
      		oncomplete: function(data) {
      			document.getElementById("sample6_address").value = data.address; // 주소 넣기
                document.querySelector("#sample6_detailAddress").focus(); //상세입력 포커싱
                document.querySelector("#sample6_detailAddress").value='';//주소 넣으면 상세주소 초기화
      		}
    	}).open();
	}
	
	// 모달창 관련-----------------------------------------------
	function wrapWindowByMask() {
	    //화면의 높이와 너비를 구한다.
	    var maskHeight = $(document).height(); 
	    var maskWidth = $(window).width();

	    //문서영역의 크기 
	    console.log( "document 사이즈:"+ $(document).width() + "*" + $(document).height()); 
	    //브라우저에서 문서가 보여지는 영역의 크기
	    console.log( "window 사이즈:"+ $(window).width() + "*" + $(window).height());        

	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	    $('#mask').css({
	        'width' : maskWidth,
	        'height' : maskHeight
	    });

	    //애니메이션 효과
	    //$('#mask').fadeIn(1000);      
	    $('#mask').fadeTo("slow", 0.5);
	}

	function popupOpen() {
	    $('.layerpop').css("position", "absolute");
	    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
	    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
	    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
	    $('#layerbox').show();
	}

	function popupClose() {
	    $('#layerbox').hide();
	    $('#mask').hide();
	}

	function goDetail() {
	    /*팝업 오픈전 별도의 작업이 있을경우 구현*/ 
	    popupOpen(); //레이어 팝업창 오픈 
	    wrapWindowByMask(); //화면 마스크 효과 
	}
</script>
<jsp:include page="../include/footer.jsp"/>