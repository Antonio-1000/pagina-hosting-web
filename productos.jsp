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
         ResultSet res = st.executeQuery("SELECT * FROM productos ");%>
            <table>
            <tr>
            <th> ID_PRODU</th>
            <th> PRENDA </th>
            <th> MARCA</th>
            <th> MATERIAL</th>
            <th> COLOR </th>
            <th> PRECIO</th>
            <th> CANTIDAD</th>
            <th> KILOS </th>
            
            </tr>
            <%
               while(res.next()){
              int id_produ = Integer.parseInt(res.getString("id_produ"));
               String prenda = res.getString("prenda");
               String marca = res.getString("marca");
               String  material  = res.getString("material");
               String color = res.getString("color");
                String precio = res.getString("precio");
                 String cantidad = res.getString("cantidad");
                  String kilos = res.getString("kilos");%>
                          

                 <tr>
                  <td><%=id_produ%></td>
                  <td><%=prenda%></td>
                  <td><%=marca%></td>
                  <td><%=material%></td>
                  <td><%=color%></td>
                  <td><%=precio%></td>
                  <td><%=cantidad%></td>
                  <td><%=kilos%></td>
                   
                 
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