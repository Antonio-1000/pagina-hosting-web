<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Borrar</title>
</head>
<body>
    <% Connection con = null;
    int id_sumin = Integer.parseInt(request.getParameter("id_sumin"));%>
    <%try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost/tintoreria?characterEncoding=latin1&useConfigs=maxPerformance", "root", "junio1910");
         if(con!=null){

            Statement st = con.createStatement();
            int registros = st.executeUpdate("DELETE FROM suministros WHERE id_sumin"+"="+id_sumin);
            if(registros==1){%>
               <h1>Registro borrado</h1>
            <%}//Fin if 
         }//Fin if
      }//Fin try
      catch(ClassNotFoundException e){%>
         <h1><%=e%></h1>
      <%}//Fin Catch
      catch(SQLException e){%>
         <h1><%=e%></h1>
      <%}//Fin Catch
      %>
</body>
</html>