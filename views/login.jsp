<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>

<div id="loading" style="display:none">
	<div class="loading">처리중입니다. 잠시만 기다려주십시오.</div>
</div>

<!--wrap-->
<div id='login'>
	<div class='login'>
		<h1><img src='/images/common/logo_m.png' /></h1>
		<!--  <form method="post" name="frm" id="frm" action=""> -->
		<form action = "loginCheck" method="post">
			<fieldset>
				<!--
<p>
<input name="shop_tp" id="sh_ag" type="radio" value="SH_AG" /> <label for="sh_ag">도매 대리점</label>
<span><input name="shop_tp" id="sh_sa" type="radio" value="SH_SA" /> <label for="sh_sa">판매점</label></span>
</p>
-->
				<div class='lg_bx'>
					<ul>
						<li><label for='id'>ID</label><input type='text' name='id' id='id' class='lg_txt'
								style='ime-mode:disabled;' tabIndex='1' onkeydown="javascript:doEnter();"></li>
						<li><label for='pw'>PASSWORD</label><input type='password' name='pw' id='pw' class='lg_txt'
								style='ime-mode:disabled;' tabIndex='2' onkeydown="javascript:doEnter();"></li>
					</ul>
					<p>
					
					<!-- <input type='button' value='로그인' tabIndex='3' class='btn_lgn' onclick="javascript:doLogin();"> -->
					<input type = 'submit' class='btn_lgn' value="로그인하기"/>
					
					</p>
				</div>
				<div class='go_join'><a href='/join' onclick="javascript:doJoin();">회원가입 가기</a></div>
			</fieldset>
		</form>
		<p class='copy'>COPYRIGHT (C) M Call ALL RIGHTS RESERVED.</p>
	</div>
</div>

<!--//wrap-->
</body>
<%@ include file="/common_inc/html_footer_inc.jsp" %>