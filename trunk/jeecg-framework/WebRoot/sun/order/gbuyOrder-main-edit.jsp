<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc.jsp"></jsp:include>
	<style>
	.huibd {
		border: 1px solid #000000;
			}
	td {
		white-space: nowrap;
		font-size: 12px;
		}
	</style>
<link rel="stylesheet" href="<%=basePath%>/main/include/css/button-usr.css" type="text/css"></link>
<script language="javascript" type="text/javascript" src="<%=basePath%>/main/include/js/form_valid.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>/jslib/datepicker/WdatePicker.js"></script>
<link rel="stylesheet" href="<%=basePath%>/main/css/tablelock.css" mce_href="tablelock.css" /> 
<script type="text/javascript" language="javascript" src="<%=basePath%>/main/js/tablelock.js"></script> 
<script type="text/javascript" charset="utf-8">
var myForm;
$(document).ready(function() {
		$.fn.TableLock({table:'gbuyOrderCustom_table',lockRow:0,lockColumn:0,width:'960px',height:'100%'});
	$.fn.TableLock({table:'gbuyOrderProduct_table',lockRow:0,lockColumn:0,width:'960px',height:'100%'});
	$("#doReturn").click(function(){
		 window.parent.window.closePayoutDialog();
		});
	
	 //订单客户明细追加
	 $("#button_add_gbuyOrderCustom").bind("click", function(){
	  	  var tr =  $("#add_gbuyOrderCustom_table_template tr").clone();
	 	 $("#add_gbuyOrderCustom_table").append(tr);
	 	  resetTrNum('add_gbuyOrderCustom_table');
	 });
	 //订单客户明细删除
	 $("#button_del_gbuyOrderCustom").bind("click", function(){
	  	$("#add_gbuyOrderCustom_table").find("input:checked").parent().parent().remove(); 
	 	 resetTrNum('add_gbuyOrderCustom_table');
	 });
	 //订单产品明细追加
	 $("#button_add_gbuyOrderProduct").bind("click", function(){
	  	  var tr =  $("#add_gbuyOrderProduct_table_template tr").clone();
	 	 $("#add_gbuyOrderProduct_table").append(tr);
	 	  resetTrNum('add_gbuyOrderProduct_table');
	 });
	 //订单产品明细删除
	 $("#button_del_gbuyOrderProduct").bind("click", function(){
	  	$("#add_gbuyOrderProduct_table").find("input:checked").parent().parent().remove(); 
	 	 resetTrNum('add_gbuyOrderProduct_table');
	 });
	 
	 //提交Form
	 myForm = $('#myForm').form({
			url : 'gbuyOrderAction!editMain.action',
			success : function(data) {
				var json = $.parseJSON(data);
				 window.parent.window.closePayoutDialog();
				if (json && json.success) {
					//父窗口刷新datagrid,提示操作消息
					window.parent.window.datagrid.datagrid('reload');
					window.parent.window.messageshow('成功',json.msg);
				} else {
				    window.parent.window.messageshow('失败','操作失败!');
				}
			}
		});
});

	 //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select', this).each(function(){
				var $this = $(this), name = $this.attr('name'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
			});
		});
	}

	//form提交
 	function dosubmit(){
		if($('#myForm').form('validate')){
			myForm.submit();
			window.parent.window.closePayoutDialog();
		}
   	}
</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" id="TableBody">
  <tbody>
    <tr>
      <td><div align="center"></div>
        <div align="left"></div>
        <div id="chk_idAll">
          <FIELDSET style="BORDER:#82913C 1px solid; BACKGROUND-COLOR:#F4F9F5;padding:5px; margin:0 5px 5px 5px;">
            <LEGEND class="f14px">订单抬头</LEGEND>
            <form name="myForm" id="myForm" method="post">
              <div>
              </div>
              <table border="0" cellpadding="1" cellspacing="0"  style="border-collapse:collapse;margin-left:10px;margin-top:10px; border:1px solid #999;">
                <tbody>
                  <tr bgcolor="#CCE6D1">
                    <td height="30" colspan="8"  align="center" style="font-size:14px;"><strong>订单抬头</strong></td>
                    <input type="hidden" name="obid" value="${gbuyOrderPage.obid }"/>
                  </tr>
					<tr>
                   	 	<td align="left">订单号</td>
                    	<td align="left">
                    	<input name="goOrderCode" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goOrderCode }" data-options="required:true"/>
                    	</td>
                   	 	<td align="left">版本号</td>
                    	<td align="left">
                    	<input name="goVersion" type="text" class="easyui-numberbox" value="${gbuyOrderPage.goVersion }" data-options="required:true"/>
                    	</td>
                   	 	<td align="left">团购ID</td>
                    	<td align="left">
                    	<input name="gbObid" type="text" class="easyui-validatebox" value="${gbuyOrderPage.gbObid }" data-options="required:true"/>
                    	</td>
                   	 	<td align="left">团号</td>
                    	<td align="left">
                    	<input name="gbCode" type="text" class="easyui-validatebox" value="${gbuyOrderPage.gbCode }" data-options="required:true"/>
                    	</td>
					</tr>
					<tr>
                   	 	<td align="left">团购名称</td>
                    	<td align="left">
                    	<input name="gbName" type="text" class="easyui-validatebox" value="${gbuyOrderPage.gbName }" data-options="required:true"/>
                    	</td>
                   	 	<td align="left">订单类型 0</td>
                    	<td align="left">
                    	<input name="goderType" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goderType }" data-options=""/>
                    	</td>
                   	 	<td align="left">订单团购状态</td>
                    	<td align="left">
                    	<input name="goStatus" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goStatus }" data-options=""/>
                    	</td>
                   	 	<td align="left">旅行社ID</td>
                    	<td align="left">
                    	<input name="touristid" type="text" class="easyui-validatebox" value="${gbuyOrderPage.touristid }" data-options=""/>
                    	</td>
					</tr>
					<tr>
                   	 	<td align="left">旅行社门店I</td>
                    	<td align="left">
                    	<input name="agencyId" type="text" class="easyui-validatebox" value="${gbuyOrderPage.agencyId }" data-options=""/>
                    	</td>
                   	 	<td align="left">旅行社名称</td>
                    	<td align="left">
                    	<input name="agencyName" type="text" class="easyui-validatebox" value="${gbuyOrderPage.agencyName }" data-options=""/>
                    	</td>
                   	 	<td align="left">联系人ID</td>
                    	<td align="left">
                    	<input name="linkmenid" type="text" class="easyui-validatebox" value="${gbuyOrderPage.linkmenid }" data-options=""/>
                    	</td>
                   	 	<td align="left">顾客类型 :</td>
                    	<td align="left">
                    	<input name="usertype" type="text" class="easyui-validatebox" value="${gbuyOrderPage.usertype }" data-options=""/>
                    	</td>
					</tr>
					<tr>
                   	 	<td align="left">客户</td>
                    	<td align="left">
                    	<input name="goCusName" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goCusName }" data-options=""/>
                    	</td>
                   	 	<td align="left">销售人</td>
                    	<td align="left">
                    	<input name="goSaleName" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goSaleName }" data-options=""/>
                    	</td>
                   	 	<td align="left">销售人ID</td>
                    	<td align="left">
                    	<input name="goSaleId" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goSaleId }" data-options=""/>
                    	</td>
                   	 	<td align="left">联系人</td>
                    	<td align="left">
                    	<input name="goContactName" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goContactName }" data-options=""/>
                    	</td>
					</tr>
					<tr>
                   	 	<td align="left">区号</td>
                    	<td align="left">
                    	<input name="goZoneNo" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goZoneNo }" data-options=""/>
                    	</td>
                   	 	<td align="left">电话</td>
                    	<td align="left">
                    	<input name="goPhone" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goPhone }" data-options=""/>
                    	</td>
                   	 	<td align="left">手机</td>
                    	<td align="left">
                    	<input name="goTelphone" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goTelphone }" data-options=""/>
                    	</td>
                   	 	<td align="left">传真</td>
                    	<td align="left">
                    	<input name="goFacsimile" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goFacsimile }" data-options=""/>
                    	</td>
					</tr>
					<tr>
                   	 	<td align="left">邮箱</td>
                    	<td align="left">
                    	<input name="goMail" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goMail }" data-options=""/>
                    	</td>
                   	 	<td align="left">订单人数</td>
                    	<td align="left">
                    	<input name="goOrderCount" type="text" class="easyui-numberbox" value="${gbuyOrderPage.goOrderCount }" data-options=""/>
                    	</td>
                   	 	<td align="left">总价(不含返</td>
                    	<td align="left">
                    	<input name="goAllPrice" type="text" class="easyui-numberbox" value="${gbuyOrderPage.goAllPrice }" data-options=""/>
                    	</td>
                   	 	<td align="left">返款</td>
                    	<td align="left">
                    	<input name="goReturnPrice" type="text" class="easyui-numberbox" value="${gbuyOrderPage.goReturnPrice }" data-options=""/>
                    	</td>
					</tr>
					<tr>
                   	 	<td align="left">备注</td>
                    	<td align="left">
                    	<input name="goContent" type="text" class="easyui-validatebox" value="${gbuyOrderPage.goContent }" data-options=""/>
                    	</td>
                   	 	<td align="left">审核状态 0</td>
                    	<td align="left">
                    	<input name="auditorStatus" type="text" class="easyui-validatebox" value="${gbuyOrderPage.auditorStatus }" data-options=""/>
                    	</td>
                   	 	<td align="left">审核人ID</td>
                    	<td align="left">
                    	<input name="auditorObid" type="text" class="easyui-validatebox" value="${gbuyOrderPage.auditorObid }" data-options=""/>
                    	</td>
                   	 	<td align="left">审核人</td>
                    	<td align="left">
                    	<input name="auditorName" type="text" class="easyui-validatebox" value="${gbuyOrderPage.auditorName }" data-options=""/>
                    	</td>
					</tr>
				  

				  <tr>
                    <td align="center" colspan="22" height="1" bgcolor="#D8D8D8"></td>
                  </tr>
                  <tr>
                    <td colspan="8"  align="right" height="3"></td>
                  </tr>
                  <tr>
                    <td colspan="8" align="left" ><strong>&nbsp;&nbsp;订单客户明细&nbsp;&nbsp;</strong>
                    <input type="button" id="button_add_gbuyOrderCustom" class=" wd1 btn" value="添加"/>
                    <input type="button" id="button_del_gbuyOrderCustom" class=" wd1 btn" value="删除"/>
                    </td>
                  </tr>
                 
                   <tr>
                    <td colspan="8"  align="left">
                    <table border="0" cellpadding="2" cellspacing="0" id="gbuyOrderCustom_table">
                        <tr bgcolor="#E6E6E6">
                          <td height="18" align="center" bgcolor="#EEEEEE">序号</td>
							  <td align="left" bgcolor="#EEEEEE">客户英文名</td>
							  <td align="left" bgcolor="#EEEEEE">姓名</td>
							  <td align="left" bgcolor="#EEEEEE">人员类型</td>
							  <td align="left" bgcolor="#EEEEEE">性别</td>
							  <td align="left" bgcolor="#EEEEEE">身份证号</td>
							  <td align="left" bgcolor="#EEEEEE">出生日期</td>
							  <td align="left" bgcolor="#EEEEEE">护照号</td>
							  <td align="left" bgcolor="#EEEEEE">护照有效期</td>
							  <td align="left" bgcolor="#EEEEEE">业务</td>
							  <td align="left" bgcolor="#EEEEEE">同住</td>
							  <td align="left" bgcolor="#EEEEEE">备注</td>
                        </tr>
                        <tr>
                          <td align="center" colspan="20" height="1" bgcolor="#D8D8D8"></td>
                        </tr>
                        <tbody id="add_gbuyOrderCustom_table">
                        <s:if test="gbuyOrderCustomList.size >0">
                        <s:iterator value="gbuyOrderCustomList" var="poVal" status="stuts">
	                        <tr>
	                          <td align="center"><input type="checkbox" name="ck"/><input type="hidden" name="gbuyOrderCustomList[${stuts.index }].obid" value="${po.obid }"/></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocCusNameEn" type="text" value="${poVal.gocCusNameEn }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocCusName" type="text" value="${poVal.gocCusName }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocCusType" type="text" value="${poVal.gocCusType }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocSex" type="text" value="${poVal.gocSex }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocIdcard" type="text" value="${poVal.gocIdcard }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocBirthday" type="text" value="${poVal.gocBirthday }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocPassportCode" type="text" value="${poVal.gocPassportCode }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocPassportEndDate" type="text" value="${poVal.gocPassportEndDate }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocBussContent" type="text" value="${poVal.gocBussContent }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocRoomNum" type="text" value="${poVal.gocRoomNum }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderCustomList[${stuts.index }].gocContent" type="text" value="${poVal.gocContent }" class="easyui-validatebox" style="width:120px;" ></td>
	                        </tr>
                        </s:iterator>
                      	</s:if>  
                       </tbody>
                      </table>
                    </td>
                  </tr>
                  
                  
				  <tr>
                    <td align="center" colspan="22" height="1" bgcolor="#D8D8D8"></td>
                  </tr>
                  <tr>
                    <td colspan="8"  align="right" height="3"></td>
                  </tr>
                  <tr>
                    <td colspan="8" align="left" ><strong>&nbsp;&nbsp;订单产品明细&nbsp;&nbsp;</strong>
                    <input type="button" id="button_add_gbuyOrderProduct" class=" wd1 btn" value="添加"/>
                    <input type="button" id="button_del_gbuyOrderProduct" class=" wd1 btn" value="删除"/>
                    </td>
                  </tr>
                 
                   <tr>
                    <td colspan="8"  align="left">
                    <table border="0" cellpadding="2" cellspacing="0" id="gbuyOrderProduct_table">
                        <tr bgcolor="#E6E6E6">
                          <td height="18" align="center" bgcolor="#EEEEEE">序号</td>
							  <td align="left" bgcolor="#EEEEEE">服务项目类型</td>
							  <td align="left" bgcolor="#EEEEEE">产品名称</td>
							  <td align="left" bgcolor="#EEEEEE">个数</td>
							  <td align="left" bgcolor="#EEEEEE">单位</td>
							  <td align="left" bgcolor="#EEEEEE">单价</td>
							  <td align="left" bgcolor="#EEEEEE">小计</td>
							  <td align="left" bgcolor="#EEEEEE">备注</td>
							  <td align="left" bgcolor="#EEEEEE">团购服务项目</td>
                        </tr>
                        <tr>
                          <td align="center" colspan="20" height="1" bgcolor="#D8D8D8"></td>
                        </tr>
                        <tbody id="add_gbuyOrderProduct_table">
                        <s:if test="gbuyOrderProductList.size >0">
                        <s:iterator value="gbuyOrderProductList" var="poVal" status="stuts">
	                        <tr>
	                          <td align="center"><input type="checkbox" name="ck"/><input type="hidden" name="gbuyOrderProductList[${stuts.index }].obid" value="${po.obid }"/></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopProductType" type="text" value="${poVal.gopProductType }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopProductName" type="text" value="${poVal.gopProductName }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopCount" type="text" value="${poVal.gopCount }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopUnit" type="text" value="${poVal.gopUnit }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopOnePrice" type="text" value="${poVal.gopOnePrice }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopSumPrice" type="text" value="${poVal.gopSumPrice }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopContent" type="text" value="${poVal.gopContent }" class="easyui-validatebox" style="width:120px;" ></td>
								  <td align="left"><input name="gbuyOrderProductList[${stuts.index }].gopProductObid" type="text" value="${poVal.gopProductObid }" class="easyui-validatebox" style="width:120px;" ></td>
	                        </tr>
                        </s:iterator>
                      	</s:if>  
                       </tbody>
                      </table>
                    </td>
                  </tr>
                  
                  
                  <tr>
                    <td height="50" colspan="8"  align="center">
                        <input value=" 关 闭 " type="button" id="doReturn"/>
                      	<input value=" 提 交 " type="button" onClick="dosubmit();"  />
                    </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </FIELDSET>
        </div>
       </td>
    </tr>
    </tbody>
</table>

<table style="display:none">
       <tbody id="add_gbuyOrderCustom_table_template">
          <tr>
             <td align="center"><input type="checkbox" name="ck"/></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocCusNameEn" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocCusName" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocCusType" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocSex" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocIdcard" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocBirthday" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocPassportCode" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocPassportEndDate" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocBussContent" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocRoomNum" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderCustomList[#index#].gocContent" type="text" style="width:120px;"></td>
           </tr>
      </tbody>
       <tbody id="add_gbuyOrderProduct_table_template">
          <tr>
             <td align="center"><input type="checkbox" name="ck"/></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopProductType" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopProductName" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopCount" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopUnit" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopOnePrice" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopSumPrice" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopContent" type="text" style="width:120px;"></td>
				  <td align="left"><input name="gbuyOrderProductList[#index#].gopProductObid" type="text" style="width:120px;"></td>
           </tr>
      </tbody>
</table>
</body>
</html>