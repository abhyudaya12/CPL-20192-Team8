<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<body>
<div class='row_bx'>
				<div class='sch_reslt' id="detail_sch_result">
					<p>총 N개 </p>
					<br>
					<table class="tb_01 mt10" border="1" >
					<tr>
					<th>통신사</th>
					<th>모델명</th>
					<th>일련번호</th>
					</tr>
					<tr><!-- 첫번째 줄 시작 -->
	    				<td><input type='radio' name='통신사' value='apple' checked/>KT
  							<input type='radio' name='통신사' value='banana' />SK
  							<input type='radio' name='통신사' value='orange' />LG</td>
	    				<td><select name="모델명">
								<option value="1">SM-N930</option>
								<option value="2">SM-N931</option>
								<option value="3">SM-N932</option>
								<option value="4" selected>SM-N93</option>
							</select></td>
						<td><input name="" type="text" value = "일련번호" onclick="javascript:;" /></td>
					</tr><!-- 첫번째 줄 끝 -->
				    </table>
				    <input name="" type="button" value='추가' onclick="javascript:;" />
				</div>
				<br>
				<p style="border:2px solid black;">
					
				<form style = "float:right;">
					<select name="이력 선택">
						<option value="1">A</option>
						<option value="2">B</option>
						<option value="3">C</option>
						<option value="4" selected>이력 선택</option>
					</select>
					<input name="" type="text" onclick="javascript:;" />
					<input name="" type="button" value='저장' onclick="javascript:;" />
				</form>	
				</p>

				<div class='row_02' id="detail_info">
					<!-- ajax loading : getDetailInfo() -->
				</div>

				<div id="goods_history_ajax"></div>
</div>
</body>

</html>