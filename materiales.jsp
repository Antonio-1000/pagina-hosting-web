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
         ResultSet res = st.executeQuery("SELECT * FROM materiales");%>
            <table>
            <tr>
            <th> ID_MATE</th>
            <th> NOMBRE </th>
            <th> CANTIDAD</th>
            <th> PRECIO</th>
            
            
            </tr>
            <%
               while(res.next()){
               int id_mate = Integer.parseInt(res.getString("id_mate"));
               String nombre = res.getString("nombre");
               String cantidad = res.getString("cantidad");
               String  precio = res.getString("precio");%>  
                  <tr>
                  <td><%=id_mate%></td>
                  <td><%=nombre%></td>
                  <td><%=cantidad%></td>
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