<%@ page import="com.movieprod.model.Film" %>
<%@ page import="com.movieprod.model.Scene" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/15/2023
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Film f = (Film)  request.getAttribute("film"); %>
<% String months[] = {"janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"}; %>
<% List<Scene> list = (List<Scene>) request.getAttribute("list"); %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title"><%= f.getNomfilm() %></p>
                    <div class="row">
                            <div class="col-md-6 grid-margin stretch-card">
                                <img src="<%=request.getContextPath() +"/"+ f.getAffiche()%>" alt="affiche" width="200" height="350">
                            </div>
                            <div class="col-md-6 grid-margin stretch-card">
                                <table class="table table-borderless report-table">
                                    <tr>
                                        <td class="text-muted">Réalisateur(s)</td>
                                        <td><h5 class="font-weight-bold mb-0"><%= f.getRealisateur() %></h5></td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted">Date de sortie</td>
                                        <% for(int i=1; i<=months.length; i++){%>
                                        <% if(f.getDatesortie().getMonth() == i){ %>
                                        <td><h5 class="font-weight-bold mb-0"><%= f.getDatesortie().getDate() +" "+ months[i] +" "+ (f.getDatesortie().getYear()+1900) %></h5></td>
                                        <% } %>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td class="text-muted">Provenance</td>
                                        <td><h5 class="font-weight-bold mb-0"><%= f.getNationaliteproduction() %></h5></td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted">Durée</td>
                                        <td><h5 class="font-weight-bold mb-0"><%= f.getDuree().getHours() %>h<%= f.getDuree().getMinutes() %>mn</h5></td>
                                    </tr>
                                </table>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Synopsis</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 grid-margin">
            <p class="font-weight-500"><%= f.getSynopsis() %></p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Liste des scènes</h4>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Descriptif</th>
                                <th>Auteur</th>
                                <th>Durée</th>
                                <th>Etat</th>
                                <th>Ordre</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for(Scene s:list){ %>
                            <tr>
                                <td><%= s.getScenelabel() %></td>
                                <td><%= s.getAuteur() %></td>
                                <td><%= s.getDuree() %> minutes</td>
                                <% if(s.getEtat() == 0){ %>
                                    <td>créée</td>
                                <% } else if(s.getEtat() == 10){ %>
                                    <td>en cours d'écriture</td>
                                <% } else if(s.getEtat() == 20){ %>
                                    <td>écriture terminée</td>
                                <% } else if(s.getEtat() == 30){ %>
                                    <td>plannifiée</td>
                                <% } else if(s.getEtat() == 40){ %>
                                    <td>tournée</td>
                                <% } else if(s.getEtat() == 50){ %>
                                    <td>montée</td>
                                <% } %>
                                <td><%= s.getOrdre() %></td>
                                <form action="<%=request.getContextPath()%>/Scene/loadmodifform" method="POST">
                                    <input type="hidden" name="idscene" value="<%= s.getId() %>">
                                    <input type="hidden" name="idfilm" value="<%= s.getFilm().getId() %>">
                                    <td><button type="submit" class="btn btn-inverse-info btn-icon">
                                        <i class="mdi mdi-pencil"></i>
                                    </button></td>
                                </form>
                                <form action="<%=request.getContextPath()%>/Scene/delete" method="POST">
                                    <input type="hidden" name="idscene" value="<%= s.getId() %>">
                                    <input type="hidden" name="idfilm" value="<%= s.getFilm().getId() %>">
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
    </div>
    <div class="row">
        <div class="col-md-12 grid-margin">
            <form action="<%=request.getContextPath()%>/Plan/planform" method="GET">
                <input type="hidden" name="idfilm" value="<%=f.getId()%>">
                <button class="btn btn-primary" type="submit">Plannifier</button>
            </form>
            <br>
            <form action="<%=request.getContextPath()%>/Scene/addform" method="GET">
                <input type="hidden" name="idfilm" value="<%=f.getId()%>">
                <button class="btn btn-primary" type="submit">Rajouter une scène</button>
            </form>
        </div>
    </div>

<%@include file="footer.jsp"%>
