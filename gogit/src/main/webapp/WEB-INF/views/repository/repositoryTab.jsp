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

		#repository-tab>a{
			text-decoration: none;
			color: gray;
			margin: 20px;
			padding: 10px;
			font-size: 18px;
		}
	</style>
</head>
<body>
	<div id="repository-tab">
		<a href="#" id="code">code</a>
		<a href="#" id="issue">issue</a>
		<a href="list.pullrq" id="pull-request">Pull request</a>
	</div>
</body>
</html>