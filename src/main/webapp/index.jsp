<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Upload Image!" %>
</h1>
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
    <form action="/UploadImage?action=upload" method="post" enctype="multipart/form-data">
        <input type="file" name="image" multiple>
        <input type="file" name="avatar">
        <input type="submit" value="Upload" name="action">
    </form>
</table>
</body>
</html>