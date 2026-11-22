<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, modelo.Conexion, java.text.NumberFormat, java.util.Locale"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos Guardados | Harina de Mi Tierra</title>
    <style>
        body{ margin:0; min-height:100vh; background:linear-gradient(135deg,#0A4D68,#088395); font-family:Arial,sans-serif; padding:30px 15px; box-sizing:border-box; }
        .card{ max-width:750px; margin:0 auto; background:white; border-radius:16px; padding:30px; box-shadow:0 15px 45px rgba(0,0,0,.25); }
        h1{ text-align:center; color:#088395; margin:0 0 5px; }
        p{ text-align:center; color:#61768A; }
        table{ width:100%; border-collapse:collapse; margin-top:20px; }
        th{ background:#088395; color:white; padding:12px; text-align:left; }
        td{ padding:12px; border-bottom:1px solid #eee; }
        tr:nth-child(even) td{ background:#f8f9fa; }
        .vacio{ text-align:center; padding:20px; color:#888; }
        @keyframes gelatina{
            0%{ transform:scale(1,1); }
            25%{ transform:scale(0.95,1.05); }
            50%{ transform:scale(1.05,0.95); }
            75%{ transform:scale(0.98,1.02); }
            100%{ transform:scale(1,1); }
        }
        .btn{ display:block; text-align:center; margin-top:12px; background:#f1f3f5; color:#495057; padding:13px; border-radius:8px; text-decoration:none; font-weight:bold; transition:0.2s; }
        .btn:hover{ background:#dee2e6; animation:gelatina 0.5s ease; transform:translateY(-2px); }
        .btn-principal{ display:block; text-align:center; margin-top:20px; background:#088395; color:white; padding:14px; border-radius:8px; text-decoration:none; font-weight:bold; transition:0.2s; }
        .btn-principal:hover{ background:#0A4D68; animation:gelatina 0.5s ease; transform:translateY(-2px); }
    </style>
</head>
<body>
    <div class="card">
        <h1>Productos Guardados</h1>
        <p>Lista de productos registrados</p>
        <table>
            <tr><th>ID</th><th>Nombre</th><th>Precio</th></tr>
            <%
                try{
                    Connection con = Conexion.conectar();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM producto ORDER BY id_producto");
                    boolean hay = false;
                    while(rs.next()){
                        hay = true;
            %>
            <tr>
                <td><%= rs.getInt("id_producto") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td><%= NumberFormat.getCurrencyInstance(new Locale("es","CO")).format(rs.getDouble("precio")) %></td>
            </tr>
            <%
                    }
                    if(!hay){ out.println("<tr><td colspan='3' class='vacio'>Aún no hay productos registrados</td></tr>"); }
                    con.close();
                }catch(Exception e){ out.println("<tr><td colspan='3'>Error: "+e.getMessage()+"</td></tr>"); }
            %>
        </table>
        <a href="producto.jsp" class="btn-principal">+ Registrar otro producto</a>
        <a href="index.jsp" class="btn">← Volver al menú</a>
    </div>
</body>
</html>