<%@ page import="com.movieprod.model.Plateau" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/22/2023
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Plateau> list = (List<Plateau>) request.getAttribute("list"); %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Entrer une indisponibilité de plateau(x)</h4>
            <form class="forms-sample" action="<%=request.getContextPath()%>/Plateau/process" method="POST">
                <div class="form-group">
                    <select class="js-example-basic-multiple w-100" multiple="multiple" name="plateaux">
                        <% for(Plateau p:list){ %>
                        <option value="<%= p.getId() %>"><%= p.getNomplateau() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">Date</label>
                    <input type="date" class="form-control" id="exampleInputEmail3" name="date">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword4">Observation</label>
                    <textarea class="form-control" id="exampleInputPassword4" name="observation" placeholder="..."></textarea>
                </div>
                <button type="submit" class="btn btn-primary mr-2">Confirmer</button>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>