<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Users</title></head>
<body>
<h2>Users List</h2>
<a href="/sybase-crud-1.0/new">Add New User</a>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>
<c:forEach items="${users}" var="user">
<tr>
<td>${user.id}</td>
<td>${user.name}</td>
<td>${user.email}</td>
<td>
<a href="/sybase-crud-1.0/edit?id=${user.id}">Edit</a> |
<a href="/sybase-crud-1.0/delete?id=${user.id}" onclick="return confirm('Sure?')">Delete</a>
</td>
</tr>
</c:forEach>
</table>
</body>
</html>