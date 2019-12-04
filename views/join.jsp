<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>

<div id='login'>
	<div class='login'>
		<h1>회원가입 | Join the MCALL </h1>
		<form action = "joinCheck" method="post">
			<fieldset>
				<div class='lg_bx'>
					<ul>
						<li><label for='id'>ID</label><input type='text' name='joinID' id='joinID' class='lg_txt'
								style='ime-mode:disabled;' tabIndex='1'></li>
						<li><label for='pw'>PASSWORD</label><input type='password' name='joinPW' id='joinPW' class='lg_txt'
								style='ime-mode:disabled;' tabIndex='2'></li>
						<li><label for='name'>NAME</label><input type='text' name='joinNAME' id='joinNAME' class='lg_txt'
								style='ime-mode:disabled;' tabIndex='3'></li>
						<li><label for='company_name'>회사명</label><input type='text' name='joinCOMPANY' id='joinCOMPANY' class='lg_txt'
								style='ime-mode:disabled;' tabIndex='4'></li>
													
						<!-- <li><label for='name'>업종 선택</label>
						<input type="radio" name="company_radio" style="vertical-align: middle; margin:13px; width:22px;height:22px" value="domae" checked>도매업
						<input type="radio" name="company_radio" style="vertical-align: middle; margin:13px; width:22px;height:22px" value="panmae" checked>판매업</li>	
						 -->
						<li><label for='name'>등급 선택</label>
						<input type="radio" name="member_radio" style="vertical-align: middle; margin:13px; width:22px;height:22px" value="company" checked>업체
						<input type="radio" name="member_radio" style="vertical-align: middle; margin:13px; width:22px;height:22px" value="employee" checked>직원</li>	
								
					</ul>
					<p>
					
					<!-- <input type='button' value='로그인' tabIndex='3' class='btn_lgn' onclick="javascript:doLogin();"> -->
					<input type = 'submit' class='btn_lgn' value="회원가입하기"/>
							
					</p>			
				</div>	
			</fieldset>
							<div class='go_join'><a href='/' style="text-align:center">> 로그인 페이지 가기</a></div>
		</form>
		<p class='copy'>COPYRIGHT (C) M Call ALL RIGHTS RESERVED.</p>
	</div>
</div>