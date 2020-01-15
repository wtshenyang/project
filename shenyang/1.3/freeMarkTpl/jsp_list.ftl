<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<cmt:includeJs scriptsArr="qui,ztree,selectTree,flyui,layer,tools,validation,WdatePicker"/>
<div class="accept-case-info-content">
    <form action="${"$"}{ctx}/ajcj/doSaveJbWzmSt.do" method="post" id="myForm">
    	<input type="hidden" value="${"$"}{dataInfo.xxzjbh}" name="xxzjbh" />
        <table class="accept-case-info-table">
        	<#list columnList as column>
        	<#if (column_index%3==0)>
        		<tr>
        			<#if (columnList[column_index]??) >
                    <td<#if (column_index==0)> style="width: 12%"</#if>>${columnList[column_index].remarks}：</td>
                    <td>
                    	<input type="text" class="validate[length[0,${(columnList[column_index].length/2)?int}]]" value="${"$"}{dataInfo.${columnList[column_index].javaProperty}}" name="${columnList[column_index].javaProperty}"/>
                    </td>
                    </#if>
                   <#if (columnList[column_index+1]??) >
                     <td>${columnList[column_index+1].remarks}：</td>
                    <td>
                    	<input class="validate[length[0,${(columnList[column_index+1].length/2)?int}]]" type="text" value="${"$"}{dataInfo.${columnList[column_index+1].javaProperty}}" name="${columnList[column_index+1].javaProperty}"/>
                    </td>
                    </#if>
                    <#if (columnList[column_index+2]??) >
                     <td>${columnList[column_index+2].remarks}：</td>
                     <td>
                     	<input class="validate[length[0,${(columnList[column_index+2].length/2)?int}]]" type="text" value="${"$"}{dataInfo.${columnList[column_index+2].javaProperty}}" name="${columnList[column_index+2].javaProperty}"/>
                     </td>
                    </#if>
            	</tr>
            	</#if>
			</#list>
        </table>
    </form>
   </div>
<script type="text/javascript">
function saveInfo(){
	var valid = ${"$"}('#myForm').validationEngine({returnIsValid: true});
	if(valid){
		var index = parent.layer.getFrameIndex(window.name);
		doSubmit(${"$"}('#myForm').attr("action"),"",${"$"}("#myForm").serialize(),function(data){
			   if(data.ok){
				   layer.msg('操作成功', {
					    time: 1000 //1s后自动关闭
					  });
				   location.href=location.href;
				}else{
					layer.msg('操作失败', {
					    time: 1000 //1s后自动关闭
					  });
				}
		  });
	}
}

${"$"}('input[type="checkbox"]').on('change', function() {
	   ${"$"}(this).siblings('input[type="checkbox"]').prop('checked', false);
	});
</script>
</body>
</html>