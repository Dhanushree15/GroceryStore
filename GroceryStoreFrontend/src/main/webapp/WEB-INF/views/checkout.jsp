<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Checkout</title>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="css/style2.css">
  
</head>



<nav class="navbar navbar-default" style="background-color:#1E90FF" "padding:10em;">
  <div class="container-fluid">
    <div class="navbar-header" style="padding:1em">
      <a class="navbar-brand"></a>
    
    <div class="nav navbar-nav">
      <a class="active1"><a style="color:white" "align:center">Grocery Offer Zone Top Deals & Discounts</a>
    </div>
	</div>
  </div>
</nav>

<br>
<br>

<body>
<table border=1px solid pink>
<tr>
<th>ProductId</th>
<th>ProductImage</th>
<th>Price</th>
<th>Category</th>
<th>Actions</th>
</tr>

<tr>
<td>${prod.getProductId()}</td>
<td>${prod.getProductImage()}</td>
<td>${prod.getProductPrice()}</td>
<td>${prod.getCategory()}</td>
<td>
<a href="<c:url value='/removeproduct/${prod.getProductId()}'/>">REMOVE</a> /<a href="<c:url value='/buyProduct/${prod.getProductId()}'/>">BUY</a>
</td>
</tr>
</table>

<button class="btn submits sign-up" style="width:60px" "align:center" > Remove All</button>
  <button class="btn submits sign-up" style="width:40px" "align:center" "float:right" "margin-right:-150px">Buy</button>
<script  src="js/index.js"></script>
</body>
<</html>