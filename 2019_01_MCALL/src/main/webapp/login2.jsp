<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>

<div id="loading" style="display:none">
	<div class="loading">처리중입니다. 잠시만 기다려주십시오.</div>
</div>

<script>
	function doLogin(){
		//if($('input[name="shop_tp"]').is(':checked') == false){alert("업체유형을 선택해 주세요"); $('input[name="shop_tp"]:eq(0)').focus(); return false;}
		if($('#id').val() == ''){alert("아이디를 입력해 주세요"); $('#id').focus(); return false;}
		if($('#pw').val() == ''){alert("비밀번호를 입력해 주세요"); $('#pw').focus(); return false;}

		$.ajax({
			type:"POST",
			dataType : 'dataString',
			url: './login_proc.jsp',
			data: $('#frm').serialize(),
			async: false,
			success: function(obj){
				//alert(obj.status);
				//return false;
				
				if(obj.status == 0){
					if(obj.msg != "") alert(obj.msg);
					if(obj.url != "") location.replace(obj.url);
					return false;
				}else{
					if(obj.msg != "") alert(obj.msg);
					location.replace(obj.url);
				}
			},
			error: function(request, status, error){
				alert('Find Error -> '+ status);
				return false;
				//console.log(request);
				//console.log(status);
				//console.log(error);
			}
		});
	}

	function doEnter(){
		if(event.keyCode == 13){
			doLogin();
		}
	}
	
	function Gohome() {
		location.href="/home/index.php";
	}
</script>

<!--wrap-->
<div id='login'>
	<div class='login'>
		<h1><img src='/images/common/logo_m.png' /></h1>
		<form method="post" name="frm" id="frm" action="">
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
					<p><input type='button' value='로그인' tabIndex='3' class='btn_lgn' onclick="javascript:doLogin();">
					</p>
				</div>
				<div class='go_join'><a href='javascript:;' onclick="javascript:doJoin();">회원가입 가기</a></div>
			</fieldset>
		</form>
		<p class='copy'>COPYRIGHT (C) M Call ALL RIGHTS RESERVED.</p>
	</div>
</div>
<!--//wrap-->
</body>
<%@ include file="/common_inc/html_footer_inc.jsp" %>