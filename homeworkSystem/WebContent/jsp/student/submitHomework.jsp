<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="nju.edu.homework.vo.OnlineUserVO"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交课程作业</title>
<link href="<%=localPath %>/css/basic.css" rel="stylesheet" type="text/css"/>
<link href="<%=localPath %>/css/dropzone.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<s:include value="../student/courseSide.jsp"></s:include>
		<div class="right-content">
			<s:hidden name="courseId" value="%{courseId}"/>
		<div class="homework-title">
			<div class="h-title-top">
				<div class="h-title-name">
					<span id="h-title-name"><s:property value="homework.name"/></span>
					<span id="h-title-id">No.<s:property value="homework.id"/></span>
				</div>
				<div class="h-title-time" id="s-h-submit-ddl">
					<span>提交截止：<s:property value="homework.studentDDL"/></span>
				</div>
			</div>
			<div class="h-title-mid">
				<s:if test="%{homework.description == ''}">
					<span class="homework-des">无作业描述</span>
				</s:if>
<%-- 				<s:elseif test="%{homework.description.length()>30}">
					<span class="homework-des"><s:property value="homework.description.substring(0,30)"/>...</span>
				</s:elseif> --%>
				<s:else><span class="homework-des">${ homework.description }</span></s:else>
			</div>
			<div class="h-title-bottom">
				<div class="h-title-btm-left"></div>
				<div class="h-title-btm-right">
					<span>作业提交格式：<s:property value="homework.fileType"/></span>
                	<span id="h-title-attach">
	                	<s:if test="%{homework.fileId != 0}">
				            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" id="download-file"><img alt="下载" src="../../image/down-white.png"> 附件</a>
				        </s:if>
				       	<s:else>无附件</s:else>
               		</span>
				</div>
			</div>
		</div>
			
			<div>
			
				<!-- 提交中 -->
				<s:if test="%{homework.state == 'commit' && homework.studentDDL > currentTime}"> 
					<div class="homework-commit-state">
						<form action="submitHomework.action"  method="post" 
						class="dropzone" id="my-awesome-dropzone"  enctype="multipart/form-data" >  
							<s:hidden name="courseId" value="%{courseId}"/>
			        		<s:hidden name="homeworkId" value="%{homework.id}"/>
			         		<br/>
			    		 </form> 
					</div>
					<s:if test="%{submit}"><span id="submitted">您已经提交过，再次提交将会进行覆盖</span></s:if>
				</s:if>
				<!-- 批改中 -->
				<s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime}">
					<span>批改中</span>
				</s:elseif>
				<s:elseif test="%{homework.state=='approval'}">
					<span class="homework-done">审批中</span>
				</s:elseif>
				<!-- 已经公布／ -->
			    <s:elseif test="%{homework.state=='pass'}">
			    	<div id="student-grade">
			    		<div id="s-grade-left">
			    			<span id="s-grade-span">
			    				<s:if test="%{homeworkVO.grade != ''}"><s:property value="homeworkVO.grade"/><span>分</span></s:if>
			    				<s:else>无</s:else>
			    			</span>
			    			<span id="s-comment-span">
			    				<s:if test="%{homeworkVO.comment != '' }"><s:property value="homeworkVO.comment"/></s:if>
			    				<s:else>无点评</s:else>
			    			</span>
			    		</div>
			    		<div id="s-grade-right">
			    			<span>
				    			<a href="downloadAttachment.action?fileId=${ studentHomework.publishFileId }" class="">
				    			<img alt="下载" src="../../image/down-white.png">样例&点评
				    			</a>
			    			</span>
			    			<span>
				    			<a href="downloadHomework.action?studentId=<%=((OnlineUserVO)session.getAttribute("onlineUser")).getId()%>&homeworkId=<s:property value="homework.id"/>">
				    			<img alt="下载" src="../../image/down-white.png">作业下载
				    			</a>
			    			</span>
			    		</div>
			    	</div>
			    	
			    	
			    	<!-- <div class="s-h-stat" id="s-hs-stat"> -->
			    		<div class="homework-stat">
							<div class="h-stat-card">
								<div class="h-stat-header">作业情况分析 <a onclick="fillTable(grades[0])" class="a-show">显示全部</a></div>
								<div class="h-stat-chart"></div>
								<div class="h-stat-data" id="diagram"  style="min-width: 310px; max-width: 800px; height: 300px; margin: 0 auto" >
									<!-- by dxh 方图表的地方-->
						
								</div>
							</div>
						</div>  
			    	<!-- </div> -->
			    	<!-- <div class="s-h-stat" id="s-allh-stat"> -->
			    		<div class="homework-scores" id="homework-scores">
			 				<!-- 放表 -->
			            
			       		 </div>
			    	
			    	<!-- </div> -->
			    	
			    </s:elseif>
			    <s:else>
			    	<span>未公布</span>
			    </s:else>
        	
			<%-- <div>
				<div class="s-homework-stat">
				</div>
				<div>
					<span>我的成绩<s:property value="studentHomework.grade"/></span>
					<br/>
					<span><a href="downloadAttachment.action?fileId=${ studentHomework.publishFileId }" class="download-td-a">样例&点评</a></span>
					<span></span>
				</div>
			</div> --%>
        </div>
		</div>
	</div>

</body>
<script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="../../js/dropzone.js"></script>
<script type="text/javascript">
	Dropzone.options.myAwesomeDropzone = {
		paramName: "file", // The name that will be used to transfer the file
		dictDefaultMessage: "拖拽至此或者点击上传",
		maxFiles: 1,
		addRemoveLinks: true,
	};
</script>

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


//下面是自己的成绩变化
var myValues = new Array();
var myX = new Array();
var n = 1;
<s:iterator value="studentAllGrades" id="i">
	myX.push("作业" + n);
	myValues.push(<s:property value="i"/>);
	n += 1;
</s:iterator>
</script>

<script>
$(function () {
	$('#homework-scores').highcharts({
        chart: {
            type: 'line'
        },
        title: {
            text: '我的作业'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
        	categories: myX
        },
        yAxis: {
            min: 0,
            title: {
            	text: '成绩'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0"></td>' +
                '<td style="padding:0"><b>{point.y} </b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        legend: {
            enabled:false
         },
        series: [{
            name: '作业',
            data: myValues
        }]
    });
});

<script>
$(function () {
	if (x.length == 0) return;
	$('#diagram').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '本次作业'
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
<script type="text/javascript" src="<%=localPath %>/js/approval.js" charset="utf-8"></script>
</html>