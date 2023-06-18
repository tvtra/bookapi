<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authors</title>
    <style>
        table, th, td {
            border: 1px solid;
        }
    </style>
</head>
<body>
    <div align="center">
        <h2>List of All Authors</h2>
        <table>
            <tr>
                <th>Author ID</th>
                <th>Author Name</th>
                <th>Action</th>
            </tr>
            <c:forEach var="author" items="${authors}">
                <tr>
                    <td align="center">${author.getAuthorID()}</td>
                    <td align="center">${author.getAuthorName()}</td>
                    <td align="center">
                        <a href="books/getByAuthorID/${author.getAuthorID()}">Show all books of this author</a>
                    </td>
                </tr>
            </c:forEach>
        </table><br/>
    </div>

    <div align="center">
        <a href="authors/insertAuthor" style="font-size: 20px">Insert Author</a><br/><br/>
    </div>

    <div align="center">
        <form:form action="" method="post" modelAttribute="author"
                   onsubmit="return confirm('Do you want to delete this author?')">
            <form:select path="authorID">
                <c:forEach var="author" items="${authors}">
                    <form:option value="${author.getAuthorID()}" label="${author.getAuthorName()}"/>
                </c:forEach>
            </form:select>
            <form:button>Delete Author</form:button>
        </form:form><br/>
    </div>

<%--    <div align="center">--%>
<%--        <a href="../books" style="font-size: 20px; color: chocolate">List of All Books</a>--%>
<%--    </div>--%>
</body>
</html>