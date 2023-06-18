<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Author</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div align="center">
        <h2>Insert Author</h2>
        <form:form action="insertAuthor"
        method="post" modelAttribute="author">
            <form:label path="authorID">Author ID:</form:label>
            <form:input path="authorID"/><br/>
            <form:errors path="authorID" cssClass="error"/><br/>

            <form:label path="authorName">Author Name:</form:label>
            <form:input path="authorName"/><br/>
            <form:errors path="authorName" cssClass="error"/><br/>

            <form:button>Insert</form:button>
        </form:form>
    </div>

</body>
</html>