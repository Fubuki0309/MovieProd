<%@ page import="com.movieprod.model.Planning" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movieprod.model.Plateau" %>
<%@ page import="com.movieprod.model.Scene" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/27/2023
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<% List<Planning> list = (List<Planning>) request.getAttribute("list"); %>
<% List<Scene> scenes = (List<Scene>) request.getAttribute("scenes"); %>
<% String months[] = {"janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"}; %>
<% int i = 1; %>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Planning suggéré</h4>
            <% for(Planning p: list){ %>
            <form class="forms-sample" action="<%=request.getContextPath()%>/Film/validate" method="POST">
                <div class="form-group">
                    <% for(int j=1; j<=months.length; j++){%>
                        <% if(p.getDate().getMonth() == j){ %>
                            <label><%= p.getDate().getDate() +" "+ months[j] +" "+ (p.getDate().getYear()+1900) %> - Jour <%= i %></label>
                        <% } %>
                    <% } %>
                    <ul>
                    <% for(Plateau pt: p.getList()){ %>
                        <li><%= pt.getNomplateau() %></li>
                        <ul>
                            <table class="table table-striped">
                            <% for(Scene s:scenes){ %>
                                <tr>
                                <% if(s.getIdplateau() == pt.getId()){ %>
                                    <td><%= s.getScenelabel() %></td>
                                    <td><%= s.getAuteur() %></td>
                                    <td><%= s.getOrdre() %></td>
                                    <td><%= s.getDuree() %> minutes</td>
                                    <td>
                                        <form action="<%=request.getContextPath()%>/Plan/deletescene" method="POST">
                                            <input type="hidden" name="idscene" value="<%= s.getId() %>">
                                            <button type="submit" class="btn btn-inverse-info btn-icon">
                                            <i class="mdi mdi-delete"></i>
                                            </button>
                                        </form>
                                    </td>
                                <% } %>
                                </tr>
                            <% } %>
                            </table>
                        </ul>
                    <% } %>
                    </ul>
                </div>
            <% i++; %>
            <% } %>
                <button type="submit" class="btn btn-primary mr-2">Valider</button>
            </form>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>