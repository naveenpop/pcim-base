<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>User Form</title></head>
<body>
<h2>${user.id > 0 ? 'Edit' : 'New'} User</h2>
<form method="post" action="/sybase-crud-1.0/save">
<input type="hidden" name="id" value="${user.id}">
       Name: <input type="text" name="name" value="${user.name}"><br>
       Email: <input type="text" name="email" value="${user.email}"><br>
<input type="submit" value="Save">
</form>
<a href="/sybase-crud-1.0">Back</a>
</body>
</html>