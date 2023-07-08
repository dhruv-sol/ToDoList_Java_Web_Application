<%-- 
    Document   : user
    Created on : 2 Nov, 2022, 9:26:34 PM
    Author     : Dhruv
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="allcss/allcdn.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
                <c:set var="x_email" value="${param.email}" scope="session"></c:set>
                <c:set var="x_pass" scope="session" value="${param.password}" />
        <sql:setDataSource var="conn" scope="session"
                           user="root" password=""
                           url="jdbc:mysql://localhost:3306/to_do"
                           driver="com.mysql.jdbc.Driver" />
        
        <div class="container text-center">
                <form method="post" action="Logout_servlet">
                        <button class="btn btn-danger btn btn-primary my-2" type="submit">Log Out</button>
                        </form>
                    </div>
        
        <sql:query dataSource="${conn}" var="rs"> select * from user where email=?;
            <sql:param value="${x_email}" />
        </sql:query>
        <c:forEach items="${rs.rows}" var="row" >
            <c:set var="x1" value="${row.id}" ></c:set>
            <c:set var="x2" value="${row.username}"></c:set>
            <c:set var="x3" value="${row.email}"></c:set>
            <c:set var="x4" value="${row.password}"></c:set>
        </c:forEach>
            <c:set var="z1" value="${x1}" scope="session"></c:set>
        <c:choose>
            <c:when test="${x_email==x3 && x_pass==x4}">
              
                <h2 align="center">Hello, <c:out value="${x2}"></c:out></h2>
                
                <div class="container">
                    <table class="table" border="1">
                        <tr>
                                <th scope="col"></th>
                                <th scope="col">Id</th>
                                <th scope="col">UserName</th>
                                <th scope="col">Email</th>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                        <c:forEach items="${rs.rows}" var="row">
                            <td><c:out value="${row.id}" ></c:out></td>
                            <td><c:out value="${row.username}" ></c:out></td>
                            <td><c:out value="${row.email}"></c:out></td>
                        </c:forEach>
                        </tr>
                    </table>
                </div>
                
                <br><br>
                <div class="container" >
                    <table class="table">
                        <tr>
                            <td class="text-center"><a href="addnote.html" class="btn btn-primary">Add TODO List</a></td>
                        </tr>
                    </table>
                </div>
                
                <div class="container" >
                    <table class="table">
                        <tr>
                            <td class="text-center"><a href="select.jsp" class="btn btn-primary">See All Notes</a></td>
                        </tr>
                    </table>
                </div>
                
                    <div class="text-center">
                <form method="post" action="deleteuser.jsp">
                    <input type="text" class="" name="id" placeholder="Your ID"/>
                        <button class="btn btn-danger btn btn-primary my-2" type="submit">Delete Account</button>
                        </form>
                    </div>
                
            </c:when>
                <c:otherwise>
                    <c:redirect url="newuser.html"></c:redirect>
                </c:otherwise>
        </c:choose>
                
                 
    </body>
</html>
