<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>

<div id='wrap'>
   <div id='lnb'>
      <h1><a href='/'><img src='/images/common/logo.png' /></a></h1>
      <h2>설정</h2>
      <div style="text-align:right">

      <font color=red size=4>관리자</font> 
      </div>
      
      <ul class='sub'>

         <!-- if($DS_USER['SHOP_TP'] == 'SH_AG') -->
         <li class='sel'><a href='/page/setting/setting'>기본정보 관리</a></li>
         <li class=''><a href='/page/setting/A'>직원관리</a></li>   
         <li class=''><a href='/page/setting/B'>입고처 관리</a></li>
         <li class=''><a href='/page/setting/C'>소속처 관리</a></li>
         <li class=''><a href='/page/setting/D'>거래처 관리</a></li>
         <li class=''><a href='/page/setting/E'>대리점 정책</a></li>
         <li class=''><a href='/page/setting/F'>서식 자료실</a></li>
         
         
      </ul>
   </div>

   <div id='contain'>

      <!-- 상단메뉴 [START] -->
      <%@ include file="/common_inc/top_menu_inc.jsp" %>
      <!-- 상단메뉴 [END] -->

      <div id='content_wrap'>
         <!-- 100%의 전체 컨텐츠 영역-->
         <script>
            $(document).ready(function () {
               getNowDatetime();
               setInterval("getNowDatetime()", 1000);
            });

            
         </script>

         <div class='now_bx'>
            <dl>
               <dt>
                  <!-- ><?=date('Y-m')?> --> 2019-11</dt>
               <dd>
                  <ul>
                     <li>
                        <span>입고 <em class='current_num m5'>
                              <!-- <?=number_format($DS_GOODS_STAT['GD_IN'])?> -->0</em> </span>
                        <span class='pl15'>단말기 <em class='current_num m5'>
                              <!-- <?=number_format($DS_GOODS_STAT['PHONE'])?> -->5</em></span>
                        <span class='pl15'>유심 <em class='current_num m5'>
                              <!-- <?=number_format($DS_GOODS_STAT['USIM'])?> -->0</em></span>
                        <span class='pl15'>개통 <em class='current_num m5'>
                              <!-- <?=number_format($DS_GOODS_STAT['GD_OP'])?> -->0</em></span>
                        <p class='now_time'>
                           <!-- getNowDatetime() -->
                        </p>
                     </li>
                  </ul>
               </dd>
            </dl>
         </div>

         
            

      </div>
      
      <div id='pop'>
         <div class='title'>
            <h2>계정 기본 정보</h2>
            <a href="javascript:;" class='pop_close' onclick="javascript:hideGoodsModifyPopup();">닫기</a>
         </div>
         
         <br>
         <div class='row_bx'>
            <table class="tb_01 mt10" width="30%" cellspacing="0"
                  cellpadding="0" border="2">
                  <tbody id="stock_table">
                     <tr>
                        <td width="80" class="bg_blue"><b>ID</b></td>
                        <td ><p style="text-align:left;">종프8조</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>Pass</b></td>
                        <td><p style="text-align:left;">******</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>소속</b></td>
                        <td><p style="text-align:left;">비전팩토리</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>이름</b></td>
                        <td><p style="text-align:left;">종프8조</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>이동번호</b></td>
                        <td><p style="text-align:left;">010-0000-0000</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>일반번호</b></td>
                        <td><p style="text-align:left;">053-000-0000</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>생년월일</b></td>
                        <td><p style="text-align:left;">19551234</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>이메일</b></td>
                        <td><p style="text-align:left;">asdf@asdf.com</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>주소</b></td>
                        <td><p style="text-align:left;">대구광역시 북구 대학로80 경북대학교</p> </td>
                     </tr>
                     <tr>
                        <td width="80" class="bg_blue"><b>권한</b></td>
                        <td><p style="text-align:left;">판매</p> </td>
                     </tr>
                     </tbody>
                     </table>
                           
            
            </p>

            <div class='row_02' id="detail_info">
               <!-- ajax loading : getDetailInfo() -->
            </div>

         <div id="goods_modify_ajax"></div>

         <div class='center mt20'>
            <input type='button' value='저장' class='btnp_01 w100' onclick="javascript:doSaveModify();" />
         </div>
         </div>
      </div>
      
      <!--// 전체 100% CONTENTS    -->

   </div>
   <!--//contain-->

</div>
<!--//wrap-->




<%@ include file="/common_inc/html_footer_inc.jsp" %>