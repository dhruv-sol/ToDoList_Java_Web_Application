<%-- 
    Document   : deleteuser
    Created on : 8 Nov, 2022, 7:16:34 AM
    Author     : Dhruv
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:choose>
            <c:when test="${param.id==sessionScope.z1}">
                <sql:update dataSource="${conn}" var="count">
                        delete from user where id=?;
                        
            <sql:param value="${param.id}"/>
            </sql:update>
                        <c:redirect url="Begin.html">
                        </c:redirect>
                        </c:when>
                <c:otherwise>
                    <c:set var="param.email" value="${sessionScope.x_email}" scope="session"></c:set>
                    <c:set var="param.password" scope="session" value="${sessionScope.x_pass}" />
                    <% 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Account ID is not Correct !!!');");
                        out.println("location='user01.jsp';");
                        out.println("</script>");
                    %>
                
                </c:otherwise>
        </c:choose>
    </body>
</html>
