<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Shipping-form</title>
  
  <c:url value="/resources/images/" var="img"/>
 <c:url value="/resources/css/" var="css"/>
 <c:url value="/resources/js/" var="js"/>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="${css}/style2.css">
</head>
<body>
  <div class="overlay">
<form>
   <div class="con">
   <header class="head-form">
     <h2>BILLING FORM</h2>   
   </header> 
<br>
   <div class="field-set">      
    <input class="form-input" type="text" placeholder="BillID" required>
 <br>
	<input class="form-input" type="text" placeholder="HouseNo" required>
 <br>
	<input class="form-input" type="text" placeholder="Country"  required>
 <br>
    <input class="form-input" type="text" placeholder="Pincode"  required>
 <br>
    <input class="form-input" type="text" placeholder="EmailID"  required>
 <br>
    <input class="form-input" type="text" placeholder="Mobileno"  required>
 <br>
       <button class="btn submits sign-up"> Submit </button>
	   <button class="btn submits sign-up">Cancel</button>
</div>
</div>
</form>

<form>

   <div class="con">
   <header class="head-form">
     <h2>SHIPPING FORM</h2>   
   </header> 
<br>
   <div class="field-set">      
    <input class="form-input" type="text" placeholder="Firstname" required>
 <br>
	<input class="form-input" type="text" placeholder="Lastname" required>
 <br>
	<input class="form-input" type="text" placeholder="Shipping-ID"  required>
 <br>
    <input class="form-input" type="text" placeholder="Houseno"  required>
 <br>
    <input class="form-input" type="text" placeholder="Country"  required>
 <br>
	<input class="form-input" type="text" placeholder="City"  required>
 <br>
    <input class="form-input" type="text" placeholder="Mobileno"  required>
 <br>
	<input class="form-input" type="text" placeholder="EmailID"  required>
 
       
</div>
</div>
</form>

</div>  
<script  src="js/index.js">
</script>
</body>
</html>
