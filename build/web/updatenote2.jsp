<%-- 
    Document   : updatenote2
    Created on : 15 Nov, 2022, 3:22:09 PM
    Author     : Home
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
        
         <sql:update dataSource="${conn}" var="up2">update todos set title=?,content=?,target_date=?  where id=?; 
            <sql:param value="${param.title}" />
            <sql:param value="${param.content}" />
            <sql:param value="${param.targetdate}" />
            <sql:param value="${sessionScope.x_id}" />
        </sql:update>
         
         <c:redirect url="select.jsp" ></c:redirect>
    </body>
</html>
