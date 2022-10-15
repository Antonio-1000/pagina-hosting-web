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
         ResultSet res = st.executeQuery("SELECT * FROM suministros");%>
            <table>
            <tr>
            <th> ID_SUMIN</th>
            <th> NOMBRE </th>
            <th> PRECIO</th>
          
            </tr>
            <%
               while(res.next()){
              int id_sumin = Integer.parseInt(res.getString("id_sumin"));
               String nombre = res.getString("nombre");
               String precio = res.getString("precio");
                  %>  
                  <tr>
                  <td><%=id_sumin%></td>
                  <td><%=nombre%></td>
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