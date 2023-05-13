<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Records</title>
</head>
<body>
	<form method="get">
		Product No: <input type="text" name="prodNum"> <br><br> 
		Product Name: <input type="text" name="prodName"> <br><br> 
		Product Type: 
		<input type="radio" name="prodType" id="homeApp" value="Home Appliance" checked> Home Appliance 
		<input type="radio" name="prodType" id="hardware" value="Computer Hardware"> Computer Hardware 
		<input type="radio" name="prodType" id="game" value="Game Console"> Game Console 
		<input type="radio" name="prodType" id="cloth" value="Clothing"> Clothing <br><br> 
		Manufacture: 
		<select name="manufacturer">
			<option value="LG">LG</option>
			<option value="Samsung">Samsung</option>
		</select> <br><br> 
		Price: <input type="text" name="price"> <br><br> 
		Weight: <input type="text" name="weight"> <br><br>

		<button type="submit" name="submit" value="submitted">Add Product</button><br><br>
	</form>


	<!-- establish db connection -->
	<sql:setDataSource var="mydb" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/a3" user="root" password="root" />



	<!-- test use
		<p>Parameters: ${param}</p>
	-->
	
	<!-- use fmt lib to parse String into number -->
	<c:set var="priceString" value="${param.price}" />
	<fmt:parseNumber var="price" type="number" value="${priceString}" />

	<!-- input validation and database insertion -->
	<c:set var="flag" value="true" />
	<c:if test="${not empty param.submit}">
		<c:if test="${price lt 100 or price gt 900}">
			<p style="color: red;">Price must be within range $100-$900</p>
			<c:set var="flag" value="false" />
		</c:if>

		<c:if test="${empty param.prodNum}">
			<p style="color: red;">You must enter a Product ID</p>
			<c:set var="flag" value="false" />
		</c:if>

		<c:if test="${flag}">

			<c:catch var="exception">
				<sql:update dataSource="${mydb}" var="count">
			      INSERT INTO product (productNo, productName, productType, manufacturer, price, weight) 
			      VALUES (?, ?, ?, ?, ?, ?);
			      <sql:param value="${param.prodNum}" />
					<sql:param value="${param.prodName}" />
					<sql:param value="${param.prodType}" />
					<sql:param value="${param.manufacturer}" />
					<sql:param value="${param.price}" />
					<sql:param value="${param.weight}" />
				</sql:update>
			</c:catch>

			<c:if test="${not empty exception}">
				<p style="color: red;">There was an error: ${exception.message}</p>
			</c:if>

			<c:if test="${not empty count}">
				<p>Product added successfully.</p>

			</c:if>

		</c:if>

	</c:if>


	<!-- retrieve all data from the product table -->
	<sql:query dataSource="${mydb}" var="rs">
		select * from product;
	</sql:query>

	<!-- display all rows from fb table as an html table -->
	<table border="1" style="border-collapse: collapse">
		<tr>
			<th>Product No</th>
			<th>Product Name</th>
			<th>Product Type</th>
			<th>Manufacturer</th>
			<th>Price</th>
			<th>Weight</th>
		</tr>
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>${row['productNo']}</td>
				<td>${row['productName']}</td>
				<td>${row['productType']}</td>
				<td>${row['manufacturer']}</td>
				<td>${row['price']}</td>
				<td>${row['weight']}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>




