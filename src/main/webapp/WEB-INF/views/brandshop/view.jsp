<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.register{
		float: right;
	
	}
	.cartList{
		float : right;
	}
	.container{
		display: flex;	/* 상품 한 줄 정렬 */
		flex-direction: row; /* 가로방향으로 배치*/
		flex-wrap: wrap;	/* 페이지 넘어가지않고 밑으로 내리기 */
		gap : 8px;	/* 상품 간격 지정 */
		

	}
	.product{
		display : inline-flex;
		
	}
	.container img{
		width : 200px;	/* 상품이미지 사이즈 */
	}
	#box{
		float: left;
		width: 200px;
	}
	.sub{
		display: none;
	}



</style>
</head>
<body>
<!-- ------------------------장바구니, 등록 버튼-------------------- -->
	<div>
	<div><a class = "cartList" href="/brandCart/brandCart">장바구니</a></div>
	<br/><a class="register">등록</a></div><br/><br/>
<!-- ------------------체크박스 카테고리 시작------------------------ -->
<div id = "box">
	<ul>
		<li class = "menu">
			<p>카테고리</p>
				<ul class = "sub">
					<li><input type ="checkbox" value = "top">  상의</li>
					<li><input type ="checkbox" value = "bottom">  하의</li>
					<li><input type ="checkbox" value = "shoes">  신발</li>
					<li><input type ="checkbox" value = "acc">  패션잡화</li>
				</ul>
		</li>
		
		<li class = "menu">
			<p>브랜드</p>
				<ul class = "sub" >
					<li><input type ="checkbox" value = "51">  LE17SEPTEMBRE</li>
					<li><input type ="checkbox" value = "52">  Polar Skate Co.</li>
					<li><input type ="checkbox" value = "53">  Punch Drunk Parties</li>
					<li><input type ="checkbox" value = "54">  THE IDENTITY PROJECT</li>
					<li><input type ="checkbox" value = "55">  The Museum Visitor</li>
				</ul>
		</li>
		
		<li class = "menu">
			<p>가격</p>
				<ul class = "sub" >
					<li><input type ="checkbox" value = "상의">  상의</li>
					<li><input type ="checkbox" value = "하의">  하의</li>
					<li><input type ="checkbox" value = "패션잡화">  패션잡화</li>
					<li><input type ="checkbox" value = "신발">  신발</li>
				</ul>
		</li>
	</ul>
</div>
<!-- ------------------체크박스 카테고리 끝------------------------ -->	

<div>
   <img id="logo" src=logo_info()>
    <!--    <script>document.getElementById('logo').src=logo_info()</script> -->
                   
   <img id="title" src="">
      <!--  <script>document.getElementById('title').src=title_info()</script> -->
</div>
<!-- -----------------------상품리스트 시작--------------------------->
	   <div class="middle_content">
         <div class="middle_content_inner">
               <div>
                        <div class ="brand">
						</div>
               </div>
         </div>
      </div>
<!-- -----------------------상품리스트 끝--------------------------->
<!-- -----------------------스크립트 시작--------------------------->
<script type="text/javascript">
	var test = '${list}';
	//console.log(test);
	

	
	//상품 클릭 이벤트----------------------------------------------------------------------------------

			
			
			
			
			// <a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
 			//e.preventDefault();	// 기본 href 경로 이동 방지
		//	actionForm.attr("action", "/branshop/get");
			  /* var str=''; */ 	// up& 되지 않도록 하는 방법
			   	
		         /* str += '<input type="hidden" name="p_no" value="'+$(this).attr("href")+'">'; */
		       //  actionForm.html(str);
		          
			//actionForm.append('<input type="hidden" name="bno" value="'+$(this).attr("href")+'">'); // this 내 자신	// url에 밑에 3개 다 보이게 하기위해서는 append 사용
			//actionForm.html('<input type="hidden" name="bno" value="'+$(this).attr("href")+'">');	// html로 하면 url에서 pageNum, amount, bno를 다 날린다 
		/* 	actionForm.submit(); */
	
	
	
	
	/*    $(".brand").click(function(e) {
    	e.preventDefault();
    	actionForm.attr("action", "/brandshop/get");
       
    	var str='';
    	str += '<input type="hidden" name="p_no" value="'+$(this).attr("href")+'">';
        actionForm.html(str);         
       
        actionForm.submit();
       
       });  */
    
 //상품 클릭 이벤트 end------------------------------------------------------------------------------   

 	function logo_info() {
    	   document.getElementById('logo').src=logo_info()
            var b_no = ${b_no};
            var img_src;
            for(var i=51; i<=55; i++) {
                if(b_no == i) {
                img_src = '../resources/img/'+ i + '_logo.png';
                }
            }
            return img_src;
        }
 
    function title_info() {
    		var b_no = ${b_no};
            var img_src;
            for(var i=1; i<=17; i++) {
                if(user_area == i) {
                img_src = '../public/img/'+ i + '_title.png';
                }
            }
            return img_src;
        }
 
 
	$(".register").click(function (e) {
		e.preventDefault();
		
		var b_no = "${b_no}";
		location.href = '/brandshop/register?b_no=' + b_no;
		
	})
 
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 p 태그를 클릭했을때
        $(".menu>p").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 접고 아니면 아래로 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
       // 상품 이미지 리스트에 보여주기--------------------------------------------------------
 	$(function() {		// 상품이미지 보여주기
 		
 		var bno = '${b_no}';
 		//console.log(bno + "123454654654645");
 		
 		$.ajax({
 			url:'/brandshop/getList',
 			type: 'get',
 			data : {b_no:bno},	// 
 			dataType:"json",
 			contentType:"application/json",
 		})
 		.done(function(json) {
			var str='<div class="container">';
			console.log(json);
			for(var i=0; i<json.length; i++) {
				str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
						// brandshop(컨트롤러) 에서 /get을 탐  
				
				
				// 이미지 하나만 보여주기 
				
				
				if(json[i].attachList.length > 0) {
					var uploadPath = json[i].attachList[0].uploadPath;
					var uuid = json[i].attachList[0].uuid;
					var fileName = json[i].attachList[0].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
					str += '<div class = "product">'
					str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';	// 이미지
				}
				//상품 이미지 태그 추가	// 이건 이미지 여러개 보여줄때 사용
// 				for(var j=0; j<json[i].attachList.length; j++) {
// 					var uploadPath = json[i].attachList[j].uploadPath;
// 					var uuid = json[i].attachList[j].uuid;
// 					var fileName = json[i].attachList[j].fileName;
// 					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
// 					str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';
// 				}
				/* str += '<div>{vo2.b_name}</div>' */
				str += '<div style="font-weight: bold; font-size: 15px;">'+json[i].b_name+'<img style= "width : 25px; " src =../resources/img/check.png/></div>';
				str += '<div style="font-weight: bold; font-size: 15px; ">'+json[i].p_name_en+'</div>';
				str += '<div style="color: gray; font-size: 15px;">'+json[i].p_name_ko+'</div>';
				str += '<div style="font-weight: bold; font-size: 15px;">'+json[i].p_release_price+'원</div>';
				str += '</a>'
				str += '</div>'
				str += '<br/>'
				
				
				
			}
			
			str += '</div>'
			str += '<br/>';
			$('.brand').append(str);
		});

 			
 			
 		
 	});
   	var result = '<c:out value="${result}"/>';
	// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때(데이터 변경) 알림 메소드 실행
	if(result != ''){
		checkResult(result);
	}
	// 뒤로 가기 할 때 문제가 될 수 있으므로,
	// history 객체를 조작({정보를 담은 객체}, 뒤로 가기 버튼 문자열 형태의 제목, 바꿀 url)
	history.replaceState({}, null, null);
	function checkResult(result){
		if(result === '' || history.state){	// 뒤로가기 방지
			return;
		}
		if(result === 'success'){	// 수정 및 삭제
			alert("처리가 완료되었습니다.");
			return;
		}
		if(result === 'ok'){	// 삽입
			alert("게시글이 등록되었습니다.");
		}
	}
 
 
 
 </script>

		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>