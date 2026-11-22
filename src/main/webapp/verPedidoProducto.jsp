<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, modelo.Conexion"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Pedido-Producto | Harina de Mi Tierra</title>
    <style>
        body{margin:0; min-height:100vh; display:grid; place-items:center; background:linear-gradient(135deg,#0A4D68,#088395); font-family:Arial,sans-serif; color:#183A52; padding:20px;}
        .card{width:min(750px,95vw); background:white; border-radius:16px; padding:30px; box-shadow:0 15px 45px rgba(0,0,0,.25); text-align:center;}
        .logo{font-size:20px; font-weight:bold; color:#0A4D68;}
        .slogan{font-size:13px; font-style:italic; color:#088395; margin:0 0 15px;}
        h1{text-align:center; color:#088395; margin:0 0 5px;}
        .sub{text-align:center; color:#61768A; margin-bottom:20px;}
        .top{display:flex; gap:10px; justify-content:center; margin-bottom:20px;}
        .btn{text-decoration:none; font-weight:bold; font-size:15px; padding:11px 18px; border-radius:8px; display:inline-block; transition:all .2s ease;}
        .btn-nuevo{background:#088395; color:white;}
        .btn-nuevo:hover{background:#0A4D68; transform:translateY(-3px) scale(1.05); box-shadow:0 8px 18px rgba(8,131,149,.35);}
        .btn-menu{background:#E6F4F6; color:#0A4D68; border:1px solid #c8d6df;}
        .btn-menu:hover{background:#cdeef2; transform:translateY(-3px) scale(1.05); box-shadow:0 8px 18px rgba(8,131,149,.20);}
        table{width:100%; border-collapse:collapse;}
        th{background:#088395; color:white; padding:12px; font-size:15px;}
        td{padding:11px; border-bottom:1px solid #e5eef1; text-align:center;}
        tr:hover td{background:#E6F4F6;}
    </style>
</head>
<body>
<div class="card">
    <div class="logo">Harina de Mi Tierra</div>
    <p class="slogan">Sabor, tradición y calidad</p>
    <h1>Lista de Pedido-Producto</h1>
    <p class="sub">Todos los detalles registrados</p>
    <div class="top">
        <a class="btn btn-nuevo" href="pedido_producto.jsp">+ Agregar pedido</a>
        <a class="btn btn-menu" href="index.jsp">← Menú</a>
    </div>
    <table>
        <tr><th>ID Pedido</th><th>ID Producto</th><th>Cantidad</th></tr>
        <%
            try(Connection con=Conexion.conectar(); Statement st=con.createStatement(); ResultSet rs=st.executeQuery("SELECT * FROM pedido_producto ORDER BY id_pedido, id_producto")){
                while(rs.next()){
        %>
        <tr><td><%=rs.getInt("id_pedido")%></td><td><%=rs.getInt("id_producto")%></td><td><%=rs.getInt("cantidad")%></td></tr>
        <% } } catch(Exception e){ out.println("<tr><td colspan='3'>Error: "+e.getMessage()+"</td></tr>"); } %>
    </table>
</div>
</body>
</html>