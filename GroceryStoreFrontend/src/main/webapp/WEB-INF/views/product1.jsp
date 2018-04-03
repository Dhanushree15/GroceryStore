<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Product-form</title>
  
  <c:url value="/resources/images/" var="img"/>
  <c:url value="/resources/css/" var="css"/>
  <c:url value="/resources/js/" var="js"/>
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="${css}/style2.css">
</head>

<nav class="navbar navbar-default" style="background-color:#1E90FF" "padding:10em;">
  <div class="container-fluid">
    <div class="navbar-header" style="padding:1em">
      <a class="navbar-brand"></a>
    
    <ul class="nav navbar-nav">
      <li class="active1"><a style="color:white" "align:center">Grocery Offer Zone Top Deals & Discounts</a>
    </ul>
	</div>
  </div>
</nav>

<body>
  <div class="overlay">
  ${msg3}
  <c:url value="/addProduct" var="prod"/>
<form:form action="${prod}" method="post" commandName="product" enctype="multipart/form-desk" style="margin-left:450px;"> 
   <div class="con">
   <header class="head-form">
     <h2>PRODUCT FORM</h2>   
   </header> 
   
<br>
   <div class="field-set">      
    <form:input class="form-input"  id="txt-input" type="text" placeholder="Product-ID" path="productId" required="required"/>  
<br>	
	<form:input class="form-input" type="text" placeholder="Product-name" path="productName" required="required"/>
<br>
    <form:input class="form-input" type="text" placeholder="Description"  path="productDesc"    required="required"/>
 <br>
    <form:input class="form-input" type="text" placeholder="Price"  path="productPrice" required="required"/>
 <br>
    <form:input class="form-input" type="number" placeholder="Quantity" path="productQty" required="required"/>
    <br>
   <form:input path="pimg" type="file" name="image" value="Upload File"/>    
    <button class="btn submits sign-up"> Submit </button>
    
	<button class="btn submits sign-up">Cancel</button>
</div>
</div>
</form:form>
</div>  

<table border=1px solid grey>
<tr>
<th>ProductImage</th>
<th>ProductId</th>
<th>ProductName</th>
<th>ProductDesc</th>
<th>ProductPrice</th>
<th>ProductQuantity</th>
<th>Actions</th>
</tr>

<c1:forEach items="${products}" var="prod">
<tr>
<td>
<img src="<c:url value="/resources/images/${prod.getproductId()}.jpg"/>">
</td>
<td>${prod.getProductId()}</td>
<td>${prod.getProductName()}</td>
<td>${prod.getProductDesc()}</td>
<td>${prod.getProductPrice()}</td>
<td>${prod.getProductQty()}</td>

<td>
<a href="<c:url value='/editProduct/${prod.getProductId()}'/>">EditProduct/</a>
<a href="<c:url value='/deleteProduct/${prod.getProductId()}'/>">EditProduct</a>
</td>
</tr>
</c1:forEach>
</table>

<script  src="js/index.js">
</script>

</body>
</html>
