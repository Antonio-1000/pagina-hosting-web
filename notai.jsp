<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insertar</title>
</head>
<body>
  <% Connection con = null;
      int  folio = Integer.parseInt(request.getParameter("folio"));
               String fecha = request.getParameter("fecha");
               String precio_total = request.getParameter("precio_total");
               String  fecha_entrega  = request.getParameter("fecha_entrega");
               String id_produ = request.getParameter("id_produ");
               String id_emple = request.getParameter("id_emple");
               String  clave_cli = request.getParameter("clave_cli");
               String clave_ser = request.getParameter("claver_ser");%>

               <%   
               try{
         Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost/tintoreria?characterEncoding=latin1&useConfigs=maxPerformance", "root", "junio1910");
         if(con!=null){
           
            Statement st = con.createStatement();
           int registros = st.executeUpdate("INSERT INTO  productos VALUES("+folio+","+
           "'"+fecha+"'"+","+
           "'"+precio_total+"'"+","+
           "'"+fecha_entrega+"'"+","+
            "'"+id_produ+"'"+","+
           "'"+id_emple+"'"+","+
           "'"+clave_cli+"'"+","+
           "'"+clave_ser+"'"+")");


           
           if(registros>0){%>
          <h1>Registro insertado </h1>
          <% }
         }//fin del if
      }//fin del try
      catch(ClassNotFoundException e){%>
         <h1><%=e%></h1>
      <%}//fin del catch
      catch(SQLException e){%>
         <h1><%=e%></h1>
      <%}//fin del catch
  %>
</body>
</html>