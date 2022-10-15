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
         ResultSet res = st.executeQuery("SELECT * FROM servicios");%>
            <table>
            <tr>
            <th> CLAVE_SER</th>
            <th> NOMBRE_SERVICIO </th>
            <th> PRECIO</th>
          
            
            </tr>
            <%
               while(res.next()){
             int clave_ser = Integer.parseInt(res.getString("clave_ser"));
               String nombre_servicio = res.getString("nombre_servicio");
               String precio = res.getString("precio");
              


                  %>  
                  <tr>
                  <td><%=clave_ser%></td>
                  <td><%=nombre_sevicio%></td>
                  <td><%=precio%></td>
                 
                 
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