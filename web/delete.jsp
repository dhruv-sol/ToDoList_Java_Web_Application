<%-- 
    Document   : delete
    Created on : 7 Nov, 2022, 3:41:20 PM
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

<sql:update dataSource="${conn}" var="count">
                        delete from todos where id=?;
                        
            <sql:param value="${param.id}"/>
            </sql:update>

                        <c:redirect url="select.jsp">
                        </c:redirect>

    </body>
</html>
