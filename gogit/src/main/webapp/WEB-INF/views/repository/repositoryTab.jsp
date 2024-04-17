<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#repository-area{
	height: 500px;
	margin: auto;
}

#repository-tab{
	margin-top: 20px;
	margin-bottom: 20px;
}

#repository-tab a{
	text-decoration: none;
	color: gray;
	margin: 20px 0;
	padding: 10px;
	font-size: 16px;
}

#repository-tab>div {
	height: 40px;
	display: flex;
}

/* 버전1 */
/* #repository-tab>div>div {
	height: 40px;
	display: flex;
	align-items: center;
	padding-right: 20px;
}

#repository-tab a:hover {
	background: #eeeeee;
}

#repository-tab i {
	padding-right: 5px;
}

#repository-tab a {
	background: white;
	border: 1px solid #e6e6e6;
	border-radius: 7px;
	padding: 5px 10px;
} */

/* 버전2 */
#repository-tab>div {
	height: 50px;
	width: 300px;
	display: flex;
	align-items: center;
	background: whitesmoke;
	border: 1px solid #e6e6e6;
	border-radius: 7px;
	font-weight: 600;
}

#repository-tab a:hover {
	color: #3acdd5;
}

#repository-tab i {
	padding-right: 5px;
} 
</style>
</head>
<body>
	<div id="repository-tab">
		<div>
			<div>
				<a href="detail.rp" id="code"><i class="ti ti-code"></i>Code</a>
			</div>
			<div>
				<a href="list.is" id="issue"><i class="ti ti-circle-dot"></i>Issue</a>
			</div>
			<div>
				<a href="list.pullrq" id="pull-request"><i class="ti ti-git-pull-request"></i>Pull request</a>
			</div>
		</div>
	</div>
</body>
</html>