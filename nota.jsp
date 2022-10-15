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
         ResultSet res = st.executeQuery("SELECT * FROM nota");%>
            <table>
            <tr>
            <th> folio</th>
            <th> fecha </th>
            <th> precio_total</th>
            <th> fecha_entrega</th>
            <th> id_produ </th>
            <th> id_emple </th>
            <th> clave_cli </th>
             <th> clave_ser </th>
            
            </tr>
            <%
               while(res.next()){
              int folio = Integer.parseInt(res.getString("folio"));
               String fecha = res.getString("fecha");
               String precio_total = res.getString("precio_total");
               String  fecha_entrega  = res.getString("fecha_entrega");
               String id_produ = res.getString("id_produ");
                String id_emple = res.getString("id_emple");
                 String clave_cli = res.getString("clave_cli");
                  String clave_ser = res.getString("clave_ser");
                  %>  
                  <tr>
                  <td><%=folio%></td>
                  <td><%=fecha%></td>
                  <td><%=precio_total%></td>
                  <td><%=fecha_entrega%></td>
                  <td><%=id_produ%></td>
                  <td><%=id_emple%></td>
                  <td><%=id_cli%></td>
                  <td><%=id_ser%></td>
                   
                 
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