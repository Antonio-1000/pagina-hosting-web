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
         ResultSet res = st.executeQuery("SELECT * FROM empleado");%>
            <table>
            <tr>
            <th> ID_EMPLE </th>
            <th> NOMBRE </th>
            <th> EDAD </th>
            <th> NUMERO </th>
            <th> PUESTO </th>
             <th> CURP </th>
            </tr>
            <%
               while(res.next()){
               int id_emple = Integer.parseInt(res.getString("id_emple"));
               String nombre = res.getString("nombre");
               String edad = res.getString("edad");
               String  numero = res.getString("numero");
               String puesto = res.getString("puesto");
               String curp = res.getString("curp");

                  %>  
                  <tr>
                  <td><%=id_emple%></td>
                  <td><%=nombre%></td>
                  <td><%=edad%></td>
                  <td><%=numero%></td>
                  <td><%=puesto%></td>
                   <td><%=curp%></td>
                 
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