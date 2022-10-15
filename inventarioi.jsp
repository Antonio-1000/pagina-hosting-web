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
     int  clave_inv = Integer.parseInt(request.getParameter("clave_inv"));
               String id_maquinaria = request.getParameter("id_maquinaria");
               String id_prove = request.getParameter("id_prove");
               String id_sumin  = request.getParameter("id_sumin");
               String id_mate = request.getParameter("id_mate");%>

               <%   
               try{
         Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost/tintoreria?characterEncoding=latin1&useConfigs=maxPerformance", "root", "junio1910");
         if(con!=null){
           
            Statement st = con.createStatement();
          
          int registros = st.executeUpdate("INSERT INTO  inventario VALUES("+clave_inv+","+
           "'"+id_maquinaria+"'"+","+
           "'"+id_prove+"'"+","+
           "'"+id_sumin+"'"+","+
           "'"+id_mate+"'"+")");

           
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