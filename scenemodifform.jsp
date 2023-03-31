<%@ page import="com.movieprod.model.Scene" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movieprod.model.Plateau" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/21/2023
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Scene s = (Scene) request.getAttribute("scene"); %>
<% long idfilm = (long) request.getAttribute("idfilm"); %>
<% List<Plateau> list = (List<Plateau>) request.getAttribute("list"); %>
<% Plateau plateau = (Plateau) request.getAttribute("plateau"); %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Formulaire de modification de scène</h4>
            <p class="card-description">
                Modifier une scène ici
            </p>
            <form class="forms-sample" action="<%=request.getContextPath()%>/Scene/modify" method="POST">
                <input type="hidden" name="id" value="<%= s.getId() %>">
                <div class="form-group">
                    <label for="exampleInputName1">Libellé</label>
                    <input type="text" class="form-control" id="exampleInputName1" name="scenelabel" placeholder="..." value="<%= s.getScenelabel() %>">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">Durée</label>
                    <input type="number" class="form-control" id="exampleInputEmail3" name="duree" placeholder="en minutes" value="<%= s.getDuree() %>">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword4">Ordre</label>
                    <input type="number" class="form-control" id="exampleInputPassword4" name="ordre" placeholder="..." value="<%= s.getOrdre() %>">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword7">Auteur</label>
                    <input type="text" class="form-control" id="exampleInputPassword7" name="auteur" placeholder="..." value="<%= s.getAuteur() %>">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword5">Etat</label>
                    <input type="number" min="<%= s.getEtat() %>" class="form-control" id="exampleInputPassword5" name="etat" placeholder="..." value="<%= s.getEtat() %>">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword6">Plateau</label>
                    <select class="form-control" id="exampleInputPassword6" name="idplateau">
                        <% for(Plateau p:list) { %>
                            <% if(plateau.getId() == p.getId()) { %>
                                <option value="<%= plateau.getId() %>"><%= plateau.getNomplateau() %></option>
                            <% } %>
                            <% if(plateau.getId() != p.getId()) { %>
                                <option value="<%= p.getId() %>"><%= p.getNomplateau() %></option>
                            <% } %>
                        <% } %>
                    </select>
                </div>
                <input type="hidden" name="idfilm" value="<%= idfilm %>">
                <input type="hidden" name="idscene" value="<%= s.getId() %>">
                <button type="submit" class="btn btn-primary mr-2">Confirmer</button>
            </form>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
