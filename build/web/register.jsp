<%-- 
    Document   : register
    Created on : 2 Nov, 2022, 11:05:47 PM
    Author     : Dhruv
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
 
            <!--create insert command and execute it-->
            <sql:update dataSource="${conn}" var="rowCount" scope="session"
                        sql="insert into user(id,username,email,password) values(?,?,?,?)">
                    <sql:param value="${param.id}"/>
                    <sql:param value="${param.username}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.password}" />
            </sql:update>
            
            <c:if test="${rowCount > 0}">
                Account : ${param.username}
                <c:redirect url="regdone.html" ></c:redirect>
            </c:if>
            
    </body>
</html>
