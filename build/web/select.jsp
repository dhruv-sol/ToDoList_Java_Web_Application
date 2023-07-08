<%-- 
    Document   : select
    Created on : 6 Nov, 2022, 2:08:49 PM
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
        <sql:setDataSource var="conn" scope="session"
                           user="root" password=""
                           url="jdbc:mysql://localhost:3306/to_do"
                           driver="com.mysql.jdbc.Driver" />
        
        <sql:query dataSource="${conn}" var="rs"> select * from todos where email=?;
            <sql:param value="${sessionScope.x_email}" />
        </sql:query>
   
        <h2 align="center" class="my-3" > All Notes </h2>
        
            <div class="container">
                <form method="post" action="Logout_servlet">
                        <button class="btn btn-danger btn btn-primary my-2" type="submit">Log Out</button>
                        </form>
                    </div>
                        
                <div class="container">
                    <div>
                        <form method="post" action="delete.jsp">
                        <input type="text" class="" name="id" placeholder="Id"/>
                        <button class="btn btn-danger" type="submit">Delete</button>
                        </form>
                    </div>
                    
                    <div>
                        <form method="post" action="updatenote.jsp">
                        <input type="text" class="" name="id" placeholder="Id"/>
                        <button class="btn btn-danger" type="submit">Update</button>
                        </form>
                    </div>
        
                    <table class="table" border="5">
                        <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Title</th>
                                <th scope="col">Content</th>
                                <th scope="col">Target Date</th>
                                <th></th>
                                <th></th>
                        </tr>
                           
                       <c:forEach items="${rs.rows}" var="row">
                            <tr>
                            <td><c:out value="${row.id}" ></c:out></td>
                            <td><c:out value="${row.title}" ></c:out></td>
                            <td><c:out value="${row.content}"></c:out></td>
                            <td><c:out value="${row.target_date}"></c:out></td>
                            </tr>
                        </c:forEach>
                        
                    </table>
                    
                    <div class="text-center">
                    <a href="user01.jsp" class="btn btn-primary my-2">Back</a> 
                </div>
                    </div>
    </body>
</html>
