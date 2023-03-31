<%@ page import="com.movieprod.model.Disponibilite" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/22/2023
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<% List<Disponibilite> list = (List<Disponibilite>) request.getAttribute("list"); %>

<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Liste des indisponibilités</h4>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Plateau</th>
                        <th>Date</th>
                        <th>Motif</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Disponibilite d:list){ %>
                    <tr>
                        <td><%= d.getPlateau().getNomplateau() %>></td>
                        <td><%= d.getDateprevue() %>></td>
                        <td><%= d.getObservation() %>></td>
                        <form action="<%=request.getContextPath()%>/Scene/deleteindisp" method="POST">
                            <input type="hidden" name="id" value="<%= d.getId() %>">
                            <td><button type="submit" class="btn btn-inverse-info btn-icon">
                                <i class="mdi mdi-delete"></i>
                            </button></td>
                        </form>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>