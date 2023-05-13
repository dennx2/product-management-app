<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product Form</title>
</head>
<body>
	<form method="get">
        
        Product No: <input type="text" name="prodNum">
        <br><br>
        
        Product Name: <input type="text" name="prodName">
        <br><br>
        
        Product Type:
        <input type="radio" name="prodType" id="homeApp" value="Home Appliance" checked> Home Appliance
        <input type="radio" name="prodType" id="hardware" value="Computer Hardware"> Computer Hardware
		<input type="radio" name="prodType" id="game" value="Game Console"> Game Console
		<input type="radio" name="prodType" id="cloth" value="Clothing"> Clothing
    	<br><br>
    	
        Manufacture: <select name="manufacturer">
            <option value="LG">LG</option>
            <option value="Samsung">Samsung</option>
        </select>
		<br><br>
		
        Price: <input type="text" name="price">
		<br><br>
		
        Weight: <input type="text" name="weight">
        <br><br>
        
        <button type="submit" name="submit" value="submitted">Add Product</button><br><br>    
            
    </form>
    
    <% if (request.getParameter("submit") != null ) { %>
	    <p><strong>The following information is received:</strong></p>
	    <p>
			Product No is ${param.prodNum}<br><br>
			Product name is ${param.prodName}<br><br>
			Product type is ${param.prodType}<br><br>
			Manufacturer is ${param.manufacturer}<br><br>
			Price is ${param.price}<br><br>
			Weight is ${param.weight}
		</p>
	<% } %>
    
</body>
</html>

