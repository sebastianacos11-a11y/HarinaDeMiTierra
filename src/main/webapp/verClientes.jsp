<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, modelo.Conexion"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Clientes Guardados | Harina de Mi Tierra</title>
    <style>
        body{margin:0;min-height:100vh;display:grid;place-items:center;background:linear-gradient(135deg,#0A4D68,#088395);font-family:Arial,sans-serif;color:#183A52;padding:20px;box-sizing:border-box;}
        .card{width:min(750px,95vw);background:white;border-radius:16px;padding:30px;box-shadow:0 15px 45px rgba(0,0,0,.25);}
        .logo{text-align:center;font-size:20px;font-weight:bold;color:#0A4D68;}
        .slogan{text-align:center;font-size:13px;font-style:italic;color:#0A5AA8;margin:0 0 20px 0;}
        h1{text-align:center;color:#088395;margin:5px 0 5px 0;}
        .sub{text-align:center;color:#61768A;margin-bottom:20px;}
        table{width:100%;border-collapse:collapse;margin-top:10px;}
        th{background:#088395;color:white;padding:12px;text-align:left;}
        td{padding:11px;border-bottom:1px solid #E0E0E0;}
        tr:hover{background:#F0F7F8;}
        .btn{display:block;margin-top:12px;padding:13px;border-radius:8px;text-decoration:none;font-weight:bold;text-align:center;transition:all 0.3s ease;}
        .btn-verde{background:#088395;color:white;}
        .btn-verde:hover{background:#0A4D68;transform:translateY(-2px);box-shadow:0 5px 15px rgba(0,0,0,0.2);}
        .btn-gris{background:#F0F2F5;color:#0A4D68;}
        .btn-gris:hover{background:#E0E0E0;transform:translateY(-2px);box-shadow:0 5px 15px rgba(0,0,0,0.15);}
    </style>
</head>
<body>
    <main class="card">
        <div class="logo">Harina de Mi Tierra</div>
        <p class="slogan">Sabor, tradición y calidad</p>
        <h1>👥 Clientes Guardados</h1>
        <p class="sub">Estos son los clientes que están en la base de datos</p>

        <table>
            <tr><th>🆔 ID</th><th>👤 Nombre</th><th>📧 Correo</th><th>📱 Teléfono</th></tr>
            <%
                try{
                    Connection con = Conexion.conectar();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM cliente ORDER BY id_cliente");
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt("id_cliente") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td><%= rs.getString("correo") %></td>
                <td><%= rs.getString("telefono") %></td>
            </tr>
            <%
                    }
                    con.close();
                } catch(Exception e){
                    out.println("<tr><td colspan='4'>Error: "+e.getMessage()+"</td></tr>");
                }
            %>
        </table>

        <a href="cliente.jsp" class="btn btn-verde">+ Registrar otro cliente</a>
        <a href="index.jsp" class="btn btn-gris">← Volver al menú</a>
    </main>
</body>
</html>