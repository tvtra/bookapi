<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div align="center">
    <h2>Update Price of the Book "${foundBook.getTitle()}"</h2>
    <form:form action="../updateBook/${foundBook.getBookID()}"
                method="post"
                modelAttribute="book">

        <form:label path="price">Price:</form:label>
        <form:input path="price" type="int" value="${foundBook.getPrice()}"/><br/>
        <form:errors path="price" cssClass="error"/><br/>

        <form:button>Change</form:button>
    </form:form><br/>

    <form:form action="../deleteBook/${foundBook.getBookID()}"
               method="post"
               onsubmit="return confirm('Do you want to delete this book?')">
<%--        <form:button path="bookID" type="submit">Delete</form:button>--%>
        <input type="submit" value="Delete"/>
    </form:form>
</div>

</body>
</html>