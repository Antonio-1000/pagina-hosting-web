<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Mostrar</title>
</head>
<body>
    <% Connection con = null;
    try{
   Class.forName("com.mysql.jdbc.Driver"); //carpeta com.mysql.jdbc. archivo DRIVER
   con=DriverManager.getConnection("jdbc:mysql://localhost/tintoreria?characterEncoding=latin1&useConfigs=maxPerformance", "root", "junio1910");
      if(con!=null){

         Statement st = con.createStatement();
         ResultSet res = st.executeQuery("SELECT * FROM inventario");%>
            <table>
            <tr>
            <th> CLAVE_CLI</th>
            <th> ID_MAQUINARIA </th>
            <th> ID_PROVE</th>
            <th> ID_SUMIN </th>
            <th> ID_MATE </th>
            
            </tr>
            <%
               while(res.next()){
             
               int clave_inv = Integer.parseInt(res.getString("clave_inv"));
               String id_maquinaria = res.getString("id_maquinaria");
               String id_prove = res.getString("id_prove");
               String  id_sumin  = res.getString("id_sumin");
               String id_mate = res.getString("id_mate");
                  %>  
                  <tr>
                  <td><%=clave_inv%></td>
                  <td><%=id_maquinaria%></td>
                  <td><%=id_prove%></td>
                  <td><%=id_sumin%></td>
                  <td><%=id_mate%></td>
                   
                 
                  </tr>  
                  <%       
                }//fin del while
            %>
            <table>
        <%
      }//fin del if
}//fin del try    
catch(ClassNotFoundException e){%>
   <h1><%=e%></h1>
<%}//fin catch
catch(SQLException e){%>
   <h1><%=e%></h1>
<%}//fin catch
%>
</body>
</html>