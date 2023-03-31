<%@ page import="com.movieprod.model.Scene" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/20/2023
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Scene> list = (List<Scene>) request.getAttribute("list"); %>
<% long idfilm = (long) request.getAttribute("idfilm"); %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<form action="<%=request.getContextPath()%>/Plan/plan" method="POST">
<div class="col-md-6 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Scènes</h4>
            <div class="form-group">
                <label>Sélectionnez les scènes à tourner</label>
                <input type="hidden" name="idfilm" value="<%= idfilm %>">
                <select class="js-example-basic-multiple w-100" multiple="multiple" name="scenes">
                    <% for(Scene s:list){ %>
                        <option value="<%= s.getId() %>"><%= s.getScenelabel() %></option>
                    <% } %>
                </select>
            </div>
        </div>
    </div>
</div>
<div class="col-md-6 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Dates</h4>
            <p class="card-description">
                Intervalle de date
            </p>
            <div class="form-group row">
                <div class="col">
                    <label>Début</label>
                    <div id="the-basics">
                        <input class="form-control" type="date" name="datedebut">
                    </div>
                </div>
                <div class="col">
                    <label>Fin</label>
                    <div id="bloodhound">
                        <input class="form-control" type="date" name="datefin">
                    </div>
                </div>
                <div class="col">
                    <button class="btn btn-primary" type="submit">Plannifier</button>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
<%@include file="footer.jsp"%>
