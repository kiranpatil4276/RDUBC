<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<pre>
 <h1>Forget password</h1>
 <form action="Forget.jsp" method="post">
  
         
         User name       : <input name="Username" type="text" id="Username"  placeholder="Add Username" required="required"                           >
         
         New Password    : <input name="NewPassword" type="password" id="NewPassword"  placeholder="Add New Password " required="required"                >
        
         ConfirmPassword : <input name="ConfirmPassword" type="password" id="ConfirmPassword"  placeholder="Add confirm password"  required="required">
        
        
         <input type="submit" class="btn btn-primary" value="login" <a href="Login.jsp" </a> >
        
        
</form>
</pre>


</body>
</html>