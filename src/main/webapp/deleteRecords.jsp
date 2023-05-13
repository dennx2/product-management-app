<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Record Form</title>
</head>
<body>
	<form method="get">
		Enter Product No: <input type="text" name="prodNum">
        <br><br>
        <button type="submit" name="submit" value="submitted">Delete the Product</button>
        <br><br>
	</form>
	
	
	<!-- establish db connection -->
	<sql:setDataSource var="mydb" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/a3" user="root" password="root" />
		
	<c:if test="${not empty param.submit}">
		<c:catch var="exception">
			<sql:update dataSource="${mydb}" var="count">
		      DELETE FROM product WHERE productNo = ?;
		      <sql:param value="${param.prodNum}" />
			</sql:update>
		</c:catch>
	
		<c:if test="${not empty exception}">
			<p style="color: red;">There was an error: ${exception.message}</p>
		</c:if>
	
		<c:if test="${count gt 0}">
			<p>Product deleted successfully.</p>
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