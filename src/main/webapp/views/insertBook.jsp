<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Book</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div align="center">
    <h2>Add a New Book</h2>
    <form:form action="insertBook"
               method="post"
               modelAttribute="book">
        <form:label path="bookID">Book ID:</form:label>
        <form:input path="bookID"/><br/>
        <form:errors path="bookID" cssClass="error"/><br/>

        <form:label path="authorID">Author ID:</form:label>
        <form:select path="authorID">
            <c:forEach var="author" items="${authors}">
                <form:option value="${author.getAuthorID()}" label="${author.getAuthorName()}"/>
            </c:forEach>
        </form:select><br/>

        <form:label path="title">Title:</form:label>
        <form:input path="title"/><br/>
        <form:errors path="title" cssClass="error"/><br/>

        <form:label path="totalPages">Total Pages:</form:label>
        <form:input path="totalPages" type="int"/><br/>
        <form:errors path="totalPages" cssClass="error"/><br/>

        <form:label path="price">Price:</form:label>
        <form:input path="price" type="int"/><br/>
        <form:errors path="price" cssClass="error"/><br/>

        <form:button>Insert</form:button>
    </form:form>
</div>

</body>
</html>