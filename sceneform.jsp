<%@ page import="com.movieprod.model.Plateau" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movieprod.model.Acteur" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/20/2023
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% long idfilm = (long) request.getAttribute("idfilm"); %>
<% List<Plateau> list = (List<Plateau>) request.getAttribute("list"); %>
<% List<Acteur> acteurs = (List<Acteur>) request.getAttribute("acteurs"); %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>

<div class="col-12 grid-margin stretch-card">
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">Formulaire d'ajout de scène</h4>
      <p class="card-description">
        Ajouter une scène ici
      </p>
      <form class="forms-sample" action="<%=request.getContextPath()%>/Scene/addprocess" method="POST">
        <div class="form-group">
          <label for="exampleInputName1">Libellé</label>
          <input type="text" class="form-control" id="exampleInputName1" name="scenelabel" placeholder="...">
        </div>
        <div class="form-group">
          <label for="exampleInputEmail3">Durée</label>
          <input type="number" class="form-control" id="exampleInputEmail3" name="duree" placeholder="en minutes">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword4">Ordre</label>
          <input type="number" class="form-control" id="exampleInputPassword4" name="ordre" placeholder="...">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword7">Auteur</label>
          <input type="text" class="form-control" id="exampleInputPassword7" name="auteur" placeholder="auteur">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword5">Plateau</label>
          <select class="form-control" id="exampleInputPassword5" name="idplateau">
            <% for(Plateau p:list) { %>
              <option value="<%= p.getId() %>"><%= p.getNomplateau() %></option>
            <% } %>
          </select>
        </div>
        <div class="form-group">
          <label for="exampleInputPassword6">Acteur(s)</label>
          <select class="js-example-basic-multiple w-100" multiple="multiple" id="exampleInputPassword6" name="acteurs">
            <% for(Acteur a: acteurs){ %>
              <option value="<%= a.getId() %>"><%= a.getNom() +" "+ a.getPrenom() %></option>
            <% } %>
          </select>
        </div>
        <input type="hidden" name="idfilm" value="<%= idfilm %>">
        <button type="submit" class="btn btn-primary mr-2">Ajouter</button>
      </form>
    </div>
  </div>
</div>

<%@include file="footer.jsp"%>
