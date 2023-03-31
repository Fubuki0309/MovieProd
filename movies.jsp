<%@ page import="com.movieprod.model.Film" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: usush
  Date: 3/13/2023
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Film> list = (List<Film>) request.getAttribute("list"); %>
<% String months[] = {"janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"};%>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
            <div class="row">
                <div class="col-md-12 grid-margin">
                    <div class="row">
                        <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                            <h3 class="font-weight-bold">Bienvenue</h3>
                            <h6 class="font-weight-normal mb-0">Liste des films répertoriés</h6>
                        </div>

                    </div>
                </div>
            </div>
            <% for(Film f:list) { %>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card position-relative">
                        <div class="card-body">
                            <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-start">
                                                <div class="ml-xl-4 mt-3">
                                                    <form action="<%=request.getContextPath()%>/Scene/fiches" method="POST">
                                                    <p class="card-title">Film</p>
                                                    <h3 class="font-weight-500 mb-xl-4 text-primary"><%= f.getNomfilm() %></h3>
                                                    <input type="hidden" name="idfilm" value="<%= f.getId() %>">
                                                    <p class="mb-2 mb-xl-0">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Animi nesciunt similique reprehenderit.</p>
                                                        <br>
                                                    <button type="submit" class="btn btn-primary">Consulter</button>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-xl-9">
                                                <div class="row">
                                                    <div class="col-md-6 border-right">
                                                        <div class="table-responsive mb-3 mb-md-0 mt-3">
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
                                                    <div class="col-md-6 mt-3">
                                                        <img src="<%=request.getContextPath() + "/" + f.getLogo()%>" alt="filmlogo" width="250" height="100">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
<%@include file="footer.jsp"%>