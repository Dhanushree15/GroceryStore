<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  
  <title>Category-form</title>
  
  <c:url value="/resources/images/" var="img"/>
 <c:url value="/resources/css/" var="css"/>
 <c:url value="/resources/js/" var="js"/>
 
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="${css}/style2.css">
</head>

<nav class="navbar navbar-default" style="background-color:#1E90FF">
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
  ${msg1}
  <c:url value="/addCategory" var="cat"/>
<form:form action="${cat}" method="post" commandName="category" style="margin-left:450px;">   
   <div class="con">
   <header class="head-form">
      <h2>CATEGORY FORM</h2>   
   </header>

<br>
   <div class="field-set">
       <form:input class="form-input" id="txt-input" type="text" placeholder="Category-ID" path="catId" required="required"/>
    <b></b>
       <form:input class="form-input" type="text" placeholder="Category-name" id="txt-input"  name="Category-name" path="catName" required="required"/>
     <span>
        <i aria-hidden="true"  type="button"></i>
     </span> 
    <br>
  <button class="btn submits sign-up"> Submit </button>
  <button class="btn submits sign-up">Cancel</button>
 </div>
</div>
</form:form>
</div> 

<table border=1px solid grey>
<tr>
<th>CatId</th>
<th>CatName</th>
<th>Actions</th>
</tr>
<c1:forEach items="${categories}" var="cat">
<tr>
<td>${cat.getCatId()}</td>
<td>${cat.getCatName()}</td>
<td><a href="<c:url value='/editCategory/${cat.getCatId()}'/>">EditCategory</a>/<a href="<c:url value='/deleteCategory/${cat.getCatId()}'/>">DeleteCategory</a></td>
</tr>
</c1:forEach>
</table>

    <script  src="js/index.js"></script>
</body>
</html>
