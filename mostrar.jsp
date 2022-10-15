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
         ResultSet res = st.executeQuery("SELECT * FROM cliente");%>
            <table>
            <tr>
            <th> CLAVE_CLI </th>
            <th> NOMBRE </th>
            <th> APELLIDOS </th>
            <th> DIRECCION </th>
            <th> CORREO </th>
             <th> TELEFOMO </th>
            <th> PASSWORD </th>
            </tr>
            <%
               while(res.next()){
               int clave_cli = Integer.parseInt(res.getString("clave_cli"));
               String nombre = res.getString("nombre");
               String apellidos = res.getString("apellidos");
               String  direccion = res.getString("direccion");
               String correo = res.getString("correo");
               String telefono = res.getString("telefono");
               String password = res.getString("password");
                  %>  
                  <tr>
                  <td><%=clave_cli%></td>
                  <td><%=nombre%></td>
                  <td><%=apellidos%></td>
                  <td><%=direccion%></td>
                  <td><%=correo%></td>
                   <td><%=telefono%></td>
                  <td><%=password%></td>
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