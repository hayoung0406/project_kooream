<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/codi/get.css">

<div class="codi_box" data-codi-no="${board.codi_no }">
	<div class="social_title">
		<h1>Codi Shop</h1>
	</div>
	<br/>
	
	<br/><hr/><br/>
	
	<div class="codi_info">
		<div class="title">
			<span class="codi_title">${board.codi_title }</span>
		</div>
		
		<div class="date">
			<span>${board.codi_date } </span>
		</div>
		<div class="form_section">
   			<div class="form_section_title">
   			
   			</div>
   			<div class="form_section_content">
				<div class="uploadResult">
				</div>
			</div>
			
      	</div>
      	
      	<div class="product_list">
      		<ul></ul>
      	</div>
		<div class="model_info">
			<div class="codi_model">
				<span>모델 정보</span>
			</div>
			<span>${board.codimodel_name }</span>
			<span>${board.codi_cm } </span>
			<span>${board.codi_kg } </span>
		</div>
		
		<div class="content">
		
			<span>${board.codi_content } </span>
		</div>
		
		<div class="container social">
			<span name="tag">Tag</span>
			<div class="keyword_brand">
				<div id="uploadTag">
				</div>
			</div>
		</div>
	
		<div >
			<input type="button" value="목록" id="List_go">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<input type="button" value="수정" id="modify_go">
				<input type="button" value="삭제" id="remove_go">
			</sec:authorize>
		</div>
	</div>			
	<br/>
	<hr/>
	<br/>
	<sec:authentication property="principal" var="pri"/>
	<c:if test="${pri ne 'anonymousUser' }">
		<c:set var="nickname" value="${pri.member.m_nickname }"/>
	</c:if>
	<input type="hidden" name="pri_m_nickname" value="${nickname }"/>
	
	<div class="comment">
		<div class="comment_textarea">
		
			<span style="font-weight: bold;" id="replyer">${nickname }</span>
       		<!-- <button id="goodsHideBtn">댓글 취소</button> -->
			<textarea class="comment-inner-text" id="replytext" name="content" tabindex="1" placeholder="댓글 입력해 주세요."></textarea>			
		</div>
		<div class="comment_btn">
			<input type="button" class="submit-content" id="btnReply" value="등록" tabindex="2" style="float: right;">
				<c:if test="${pri ne 'anonymousUser' }">
					<button id="goodsBtn" style="float: right;">댓글 입력</button>
				</c:if>
			<span class="btn_hide" style="display:none"></span>
			<!-- <input type="button" class="submit_hide" value="취소" style="float: right;"> -->
		</div>
		<br><br><br><br><br>
		<div class = "panel-body">
			<ul class = "chat">
				<!-- start reply -->
				<li class = "left clearfix" data-rno = '12'>
					<div>
						<div class = "header">
							<strong class = "primary-font"></strong>
							<small class = "pull-right text-muted">2018-01-01 13:13</small>								
						</div>
						<p></p>
					</div>
				</li>
				<!-- end reply -->
			</ul>
			<!-- ./ end ul -->
		</div> <!-- panel-body -->
		
	</div>
		
</div> <!-- codi_box .....end -->
<br/><br/><br/><br/><br/><br/>

<script type="text/javascript" src="/resources/js/codi/codiReply.js"></script>
<script type="text/javascript" src="/resources/js/codi/util.js"></script>
<script type="module" src="/resources/js/codi/get.js"></script>

<jsp:include page="../include/footer.jsp"/>