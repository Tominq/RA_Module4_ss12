<%--
  Created by IntelliJ IDEA.
  User: AD
  Date: 11/15/2023
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <td>ID</td>
        <td>IMAGE</td>
    </tr>
    <c:forEach items="${images}" var="image" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <img width="100" height="100" style="object-fit: cover" src="uploads/${image}" alt="#">
        </tr>
    </c:forEach>
</table>
</body>
</html>