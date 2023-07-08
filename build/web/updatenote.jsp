<%-- 
    Document   : updatenote
    Created on : 15 Nov, 2022, 2:15:21 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="conn" scope="session"
                           user="root" password=""
                           url="jdbc:mysql://localhost:3306/to_do"
                           driver="com.mysql.jdbc.Driver" />
        

            <sql:query dataSource="${conn}" var="rs"> select * from todos where id=?;
            <sql:param value="${param.id}" />
        </sql:query> 
        
         <sql:update dataSource="${conn}" var="up2">update todos set title=?,content=?,target_date=?  where id=?; 
            <sql:param value="${param.id}" />
            <sql:param value="${param.title}" />
            <sql:param value="${param.content}" />
            <sql:param value="${param.target_date}" />
        </sql:update>
        
         <c:set var="x_id" value="${param.id}" scope="session"></c:set>
         
         
         
         
            <br>
   		
   		<br>
   		<form action="updatenote2.jsp" method="post">
  			<div>
    			
                    
                    
                    
                    <!------------------------------------>
                    
                    <!-- Section: Design Block -->
<section class="text-center">
  <!-- Background image -->
  <div class="p-5 bg-image" style="
        background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg');
        height: 150px;
        "></div>
  <!-- Background image -->

  <div class="card mx-4 mx-md-5 shadow-5-strong" style="
        margin-top: -100px;
        background: hsla(0, 0%, 100%, 0.8);
        backdrop-filter: blur(30px);
        ">
    <div class="card-body py-5 px-md-5">

      <div class="row d-flex justify-content-center">
        <div class="col-lg-8">
          <h2 class="fw-bold mb-5">Update Note</h2>
          <div class="container">
         <table class="table " border="5">
                        <tr>
                                
                                <th scope="col">Title</th>
                                <th scope="col">Content</th>
                                <th scope="col">Target Date</th>
                        </tr>
                           
                       <c:forEach items="${rs.rows}" var="row">
                            <tr>
                            <td><c:out value="${row.title}" ></c:out></td>
                            <td><c:out value="${row.content}"></c:out></td>
                            <td><c:out value="${row.target_date}"></c:out></td>
                            </tr>
                        </c:forEach>
                        
                            </table>
         </div>
          
          
            <!-- 2 column grid layout with text inputs for the first and last names -->
            <div class="row">
              <div class="col-md-6 mb-4">
                <div class="form-outline">
                    <input type="text" id="form3Example1" class="form-control" name="title" required/>
                  <label class="form-label" for="form3Example1" >Enter Title</label>
                </div>
              </div>
                
                 <!-- Email input -->
            <div class="col-md-6 mb-4">
                <input type="date" id="form3Example3" class="form-control" name="targetdate" required/>
              <label class="form-label" for="form3Example3"> Target Date </label>
            </div>

                 <div class="text-center">
              <div class=" mb-4 text-center form-outline">
                <div class="form-outline">
                    <textarea type="text" id="form3Example2" class="form-control text-center" name="content" required></textarea>
                    
                    <label class="form-label" for="form3Example2" class="text-center">Enter Note Content</label>
                  </div>
                </div>
              </div>
            </div>

           
           

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">
              Update Note
            </button>

            <!-- Register buttons -->
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            </div>
          
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->
		</form>
    </body>
</html>
