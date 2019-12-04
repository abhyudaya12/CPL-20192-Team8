<html>
<head>

</head>
<body>
	<div id="pop_stock_stock_detail" class="dialog-popup" style="width:900px;">
		<div id='pop'>
			<div class='title'>
				<h2>상세보기</h2>
				<a href="javascript:;" class='pop_close' onclick="javascript:hideDetailPopup();">닫기</a>
			</div>

			<div class='row_bx'>
				<div class='row_01'>
					<div class='sch_reslt_bx'>
						<p>
							<input name="detail_serial_no" id="detail_serial_no" type="text" class='w70p' />
							<input name="" type="button" value='검색' class='s_button w50'
								onclick="javascript:getDetailList();" />
						</p>
						<div class='sch_reslt' id="detail_sch_result">
							<p>검색결과 (<em>1</em>)</p>
							<ul>
								<!-- ajax loading : getDetailList() -->
							</ul>
						</div>
					</div>
				</div>

				<div class='row_02' id="detail_info">
					<!-- ajax loading : getDetailInfo() -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>