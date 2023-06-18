<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books by Author ID</title>
    <style>
        table, th, td {
            border: 1px solid;
        }
    </style>
</head>
<body>
    <div align="center">
        <h2>All Books of Author "${authorName}"</h2>
        <table>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Total Pages</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td align="center">${book.getBookID()}</td>
                    <td align="center">${book.getTitle()}</td>
                    <td align="center">${book.getTotalPages()}</td>
                    <td align="center">${book.getPrice()}</td>
                    <td>
                        <a href="../updateBook/${book.getBookID()}" style="color: crimson">Update Book</a>
                    </td>
                </tr>
            </c:forEach>
        </table><br/>
    </div>

    <div align="center">
        <a href="../insertBook" style="font-size: 20px; color: deeppink">
            Add New Book
        </a><br/><br/>
    </div>

    <div align="center">
        <a href="../../authors" style="font-size: 20px">Back to List of All Authors</a>
    </div>
</body>
</html>