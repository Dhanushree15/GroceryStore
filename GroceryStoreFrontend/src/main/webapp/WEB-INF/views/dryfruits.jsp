<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  
  <c:url value="/resources/images/" var="img"/>
 <c:url value="/resources/css/" var="css"/>
 <c:url value="/resources/js/" var="js"/>
</head>
<style>
fieldset
{
margin:50px 450px;
}
  
img{
float:left;
}
</style>
<body>
<div class="img">
<div class="container">
  <h3>Almond</h3>  
  <img src="${img}/almond.jpeg" class="img-rounded" alt="almond" width="350px">
 </div>
 
  
 
  <fieldset>
  <legend>Almond</legend>
  <p>The almond is a species of tree native to the Middle East, the Indian subcontinent and North Africa. Almond is also the name of the edible and widely cultivated seed of this tree</p>
  price = Rs.1000<br>
  quantity = 1kg<br>
  Quality = good<br>
  Cholesterol = 0mg	<br>
  Sodium = 1mg	<br>
  Potassium = 705mg<br>
  Total Carbohydrate = 22g<br>
  Protein = 21g
 
</fieldset>   

</div>
</body>
</html>