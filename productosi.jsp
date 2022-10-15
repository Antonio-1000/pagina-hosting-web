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
     
int  id_produ = Integer.parseInt(request.getParameter("id_produ"));
               String prenda = request.getParameter("prenda");
               String marca = request.getParameter("marca");
               String material  = request.getParameter("material");
               String color = request.getParameter("color");
               String precio = request.getParameter("precio");
               String  cantidad = request.getParameter("cantidad");
               String kilos = request.getParameter("kilos");%>
               <%   
               try{
         Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost/tintoreria?characterEncoding=latin1&useConfigs=maxPerformance", "root", "junio1910");
         if(con!=null){
           
            Statement st = con.createStatement();
          int registros = st.executeUpdate("INSERT INTO  productos VALUES("+id_produ +","+
           "'"+prenda+"'"+","+
           "'"+marca+"'"+","+
           "'"+material+"'"+","+
            "'"+color+"'"+","+
           "'"+precio+"'"+","+
           "'"+material+"'"+","+
           "'"+kilos+"'"+")");


           
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