<%-- 
    Document   : savenote
    Created on : 5 Nov, 2022, 11:20:54 AM
    Author     : Dhruv
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
         <h1 align="center"> New Account </h1>
                <sql:setDataSource var="conn" scope="session"
                               user="root" password=""
                               url="jdbc:mysql://localhost:3306/to_do"
                               driver="com.mysql.jdbc.Driver"/>
 
            <sql:update dataSource="${conn}" var="rowCount" scope="session"
                        sql="insert into todos(title,content,target_date) values(?,?,?)">
                    <sql:param value="${param.title}"/>
                    <sql:param value="${param.content}" />
                    <sql:param value="${param.targetdate}" />
            </sql:update>
            <sql:update dataSource="${conn}" var="up1">update todos set email=? where title=?;
            <sql:param value="${sessionScope.x_email}" />
            <sql:param value="${param.title}" />
        </sql:update>
            
            <c:if test="${rowCount > 0}">
                <c:redirect url="select.jsp" ></c:redirect>
            </c:if>
            
    </body>
</html>
