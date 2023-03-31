<%--
  Created by IntelliJ IDEA.
  User: miang
  Date: 03/31/2023
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/calendar.css">
    <title>Document</title>
</head>
<body>
<!-- inspired by http://colorhunt.co/c/8184 and
https://dribbble.com/shots/2407357-Calendar%60 -->

<div class="container">
    <div class="calendar">
        <div class="front">
            <div class="current-date">
                <h1>Vendredi 31</h1>
                <h1>Mars 2023</h1>
            </div>

            <div class="current-month">
                <ul class="week-days">
                    <li>LUN</li>
                    <li>MAR</li>
                    <li>MER</li>
                    <li>JEU</li>
                    <li>VEN</li>
                    <li>SAM</li>
                    <li>DIM</li>
                </ul>

                <div class="weeks">
                    <div class="first">
                        <span class="last-month">27</span>
                        <span class="last-month">28</span>
                        <span>01</span>
                        <span>02</span>
                        <span>03</span>
                        <span>04</span>
                        <span>05</span>
                    </div>

                    <div class="second">
                        <span>06</span>
                        <span>07</span>
                        <span>08</span>
                        <span>09</span>
                        <span>10</span>
                        <span>11</span>
                        <span>12</span>
                    </div>

                    <div class="third">
                        <span>13</span>
                        <span>14</span>
                        <span>15</span>
                        <span>16</span>
                        <span>17</span>
                        <span>18</span>
                        <span>19</span>
                    </div>

                    <div class="fourth">
                        <span>20</span>
                        <span>21</span>
                        <span>22</span>
                        <span>23</span>
                        <span>24</span>
                        <span>25</span>
                        <span>26</span>
                    </div>

                    <div class="fifth">
                        <span>27</span>
                        <span class="event">28</span>
                        <span class="event">29</span>
                        <span>30</span>
                        <span class="active">31</span>
                        <span class="last-month">01</span>
                        <span class="last-month">02</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="back">
            <div class="info">
                <div class="date">
                    <p class="info-date">
                        Date: <span>29 mars 2023</span>
                    </p>
                    <p class="info-time">
                        Scène(s): <span>scène4</span>
                    </p>
                </div>
                <div class="address">
                    <p>
                        Plateau(x): <span>Plateau 3</span>
                    </p>
                </div>
                <div class="observations">

                </div>
            </div>

            <div class="actions">
                <button class="dismiss">
                    Retour <i class="ion-android-close"></i>
                </button>
            </div>
        </div>

    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>

<script>
    var app = {
        settings: {
            container: $('.calendar'),
            calendar: $('.front'),
            days: $('.weeks span'),
            form: $('.back'),
            input: $('.back input'),
            buttons: $('.back button')
        },

        init: function() {
            instance = this;
            settings = this.settings;
            this.bindUIActions();
        },

        swap: function(currentSide, desiredSide) {
            settings.container.toggleClass('flip');

            currentSide.fadeOut(900);
            currentSide.hide();
            desiredSide.show();

        },

        bindUIActions: function() {
            settings.days.on('click', function(){
                instance.swap(settings.calendar, settings.form);
                settings.input.focus();
            });

            settings.buttons.on('click', function(){
                instance.swap(settings.form, settings.calendar);
            });
        }
    }

    app.init();
</script>

</body>
</html>
<%@include file="footer.jsp"%>

