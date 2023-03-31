<%@ page import="com.movieprod.model.Plateau" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movieprod.model.Film" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/29/2023
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Film> list = (List<Film>) request.getAttribute("list"); %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/ajax.js"></script>
</head>
<body>
    <form action="#" method="POST">
        <select name="film" id="film" onchange="loadData(this.value)">
            <% for(Film f: list){ %>
            <option value="<%= f.getId() %>"><%= f.getNomfilm() %></option>
            <% } %>
        </select>
        <table id="table">
            <tr>
                <th>Scène</th>
                <th>Auteur</th>
                <th>Durée</th>
                <th>Etat</th>
            </tr>
        </table>
    </form>
</body>
</html>
