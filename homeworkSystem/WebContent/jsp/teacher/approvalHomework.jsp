<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="homework.name"/></title>


		<script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
		<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
		
</head>
<body>

<script>
function fillTable(list) {
	var data = ""; 
	data += "<table>"; 
	data += "<tr>" + 
	"<th>学生学号</th>" + 
	"<th>学生姓名</th>" + 
	"<th>作业</th>" + 
	"<th>成绩</th>" +
	"<th>点评</th></tr>"; 
	for (var i = 0; i <list.length; i++) { 
		data += "<tr class=\"homework-line\">"; 
		data += "<td>" + list[i][0] + "</td>";
		data += "<td>" + list[i][1] + "</td>";
		if (list[i][2]) {
			data += "<td><a href=\"downloadHomework.action?studentId=" + list[i][0] +"&homeworkId=<s:property value="homework.id"/>\" class=\"download-td-a\">下载作业</a></td>";
		}
		else {
			data += "<td>未提交</td>";
		}
		data += "<td>" + list[i][3] + "</td>";
		data += "<td>" + list[i][4] + "</td>";
		data += "</tr>"; 
		} 
		data += "</table>"; 
		document.getElementById("homework-scores").innerHTML = data; 
	}
</script>


	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		
		<div class="right-content">
		<s:hidden name="courseId" value="%{courseId}"/>
		<div class="homework-title">
			<div class="h-title-top">
				<div class="h-title-name">
					<span id="h-title-name"><s:property value="homework.name"/></span>
					<span id="h-title-id">No.<s:property value="homework.id"/></span>
				</div>
				<div class="h-title-time">
					<span><s:property value="homework.studentDDL"/></span>
					<span><s:property value="homework.assistantDDL"/></span>
				</div>
			</div>
			<div class="h-title-mid">
				<span><s:property value="homework.description"/></span>
			</div>
			<div class="h-title-bottom">
				<div class="h-title-btm-left"></div>
				<div class="h-title-btm-right">
					<span>作业提交格式：<s:property value="homework.fileType"/></span>
                	<span id="h-title-attach">
	                	<s:if test="%{homework.fileId != 0}">
			            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" class="download-td-a">下载附件</a>
			            </s:if>
			            <s:else>
			            	无附件
			            </s:else>
               		</span>
				</div>
			</div>
		</div>
		<s:if test="%{homework.studentDDL > currentTime}">
			<div class="homework-commit-state">
				<span>正在提交中</span>
				<a href="toModifyHomework.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="courseId"/>" class="a-button">修改作业</a>
			</div>
		</s:if>
		<s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state=='commit'}">
			<div class="homework-commit-state">
				<span>正在批改中</span>
			</div>
			</s:elseif>
		<s:else>
			<div class="homework-example">
	            <s:if test="%{homework.state == 'pass'}">
					<s:if test="%{homework.publishFileId == 0}">
						<span class="info-title">作业样例&点评：</span>
						<span><a id="to-add-example"class="add-td-a">上传样例</a></span>
					</s:if>
					<s:else>
						<span class="info-title">作业样例&点评：</span>
						<span><a href="downloadExample.action?fileId=${homework.publishFileId}" class="download-td-a">下载样例&点评</a></span>
					</s:else>
				</s:if>
		</div>
		
		<!-- 不知道这个按钮往哪放 -->
			<input type="button" onclick="fillTable(grades[0])" value="显示全部"/>
			
		<div class="homework-stat">
			<div class="h-stat-card">
				<div class="h-stat-header">作业情况分析</div>
				<div class="h-stat-chart"></div>
				<div class="h-stat-data" id="diagram"  style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto" >
					<!-- by dxh 方图表的地方-->
					
				</div>
			</div>
			<div class="homework-btns">
				<s:if test="%{homework.state == 'approval'}">
            	<div class="approval-result">
	            	<span><a id="failed-approval" class="delete-td-a">不合格并重新批改</a></span>
	            	<span><a id="pass-approval" class="update-td-a">通过批改并发布成绩</a></span>
	            </div>
	            </s:if>
	            <s:elseif test="%{homework.state == 'pass'}"><a class="forbid-td-a">已经通过审批</a></s:elseif>
	            <s:elseif test="%{homework.state == 'commit'}"><a class="forbid-td-a">等待助教审批</a></s:elseif>
			</div>
		</div>   
		<div class="homework-scores" id="homework-scores">
 			<!-- 放表 -->
            
        </div>
		</s:else>
		
		</div>
		
	</div>
	

	
	<div id="upload-div">
		<h3>上传作业样例及点评</h3>
		<form action="uploadExample.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="courseId"/>" method="post" enctype="multipart/form-data">
			<label>上传文件</label><input type="file" name="file"><br/>
			<button>取消</button>
			<button type="submit" id="upload-example-btn">上传</button>
		</form>
	</div>
	
	<div id="add-example-div">
    	<div id="add-example-body">
    		<div id="add-example-title"><span>上传样例&点评</span></div>
    		<form action="uploadExample.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="courseId"/>" method="post" enctype="multipart/form-data">
				<label>上传文件</label><input type="file" name="file"><br/>
				<button type="button" class="cancel-btn close-btn">取消</button>
				<button type="submit" class="submit-btn close-btn">上传</button>
			</form>
    	</div>
    </div>
<script type="text/javascript" src="<%=localPath %>/js/approval.js" charset="utf-8"></script>

<script>
var full = ${full};
var grades = new Array();		//0的位置上是全部的。
grades.push(new Array());

<s:iterator value="studentList" >
	grades[0].push(['${ studentId }', '${ name }', '${submit}', '${ grade }', '${ comment }']);
</s:iterator>

var i = 1;
<s:iterator value="grades" var="l1">
	grades.push(new Array());
	<s:iterator value="#l1" var="student">
		grades[i].push(['<s:property value="#student.studentId"/>', '<s:property value="#student.name"/>', 
		                '<s:property value="#student.submit"/>',  '<s:property value="#student.grade"/>', 
		                '<s:property value="#student.comment"/>']);
	</s:iterator>
	i += 1;
</s:iterator>

fillTable(grades[0]);

var x = [];
var values = [];

for (var i = 1; i<grades.length; i++) {
	values.push(grades[i].length);
}

if (full == 100) {
	x = ['60以下', '60~69','70~79','80~89','90~100'];
}
else {
	for (var i=0; i<= full; i++) {
		x.push(i);
	}
}
</script>

<script>
$(function () {
	if (x.length == 0) return;
	$('#diagram').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        subtitle: {
            text: ''
        },
        xAxis: {
        	categories: x
        },
        yAxis: {
            min: 0,
            title: {
            	text: '人数'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0"></td>' +
                '<td style="padding:0"><b>{point.y} 人</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.01,
                borderWidth: 0
            },
            series: {        
	        	cursor: 'pointer',        
	        	events: {            
	          	click: function(event) {
	          		fillTable(grades[event.point.x + 1]);
	            }   
	          }   
	        }
        	
        },
        legend: {
            enabled:false
         },
        series: [{
            name: '作业',
            data: values
        }]
    });
});
</script>

</body>
</html>