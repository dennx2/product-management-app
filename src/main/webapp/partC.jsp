<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p> step 1: </p>
	<%!int p = 500;%>
	<%=p%>
	<p>step 2:</p>
	<c:set var="q" value="600" />
	<c:out value="${q}" />
	<c:out value="${p}" />
	<p>step 3:</p>
	<p>${p}${q}</p>

	<h3>-----------Seperator-----------</h3>


	<p> step 1: </p>
	<c:set var="p" value="500"/>
	<%=p%>
	<p>step 2:</p>
	<c:set var="q" value="600" />
	<c:out value="${q}" />
	<c:out value="${p}" />
	<p>step 3:</p>
	<p>${p}${q}</p>


</body>
</html>