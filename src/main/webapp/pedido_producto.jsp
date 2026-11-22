<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Pedido-Producto | Harina de Mi Tierra</title>
    <style>
        body{
            margin:0; min-height:100vh; display:grid; place-items:center;
            background:linear-gradient(135deg,#0A4D68,#088395);
            font-family:Arial,sans-serif; color:#183A52;
        }
        .card{
            width:min(380px,90vw); background:white; border-radius:16px;
            padding:35px; box-shadow:0 15px 45px rgba(0,0,0,.25); text-align:center;
        }
        h1{text-align:center; color:#088395; margin-bottom:8px;}
        .sub{text-align:center; color:#61768A; margin-bottom:30px;}
        .slogan{font-size:13px; font-style:italic; color:#088395; margin:0 0 20px;}
        label{display:block; font-weight:600; margin:18px 0 7px; text-align:left;}
        input{
            width:100%; box-sizing:border-box; padding:13px;
            border:1px solid #c8d6df; border-radius:8px; font-size:16px; transition:.2s;
        }
        input:focus{
            border-color:#088395; outline:none;
            box-shadow:0 0 0 3px rgba(8,131,149,.15);
            transform:translateY(-1px);
        }
        .btn{
            width:100%; box-sizing:border-box; margin-top:12px;
            border:0; border-radius:8px; padding:14px;
            font-size:16px; font-weight:bold; cursor:pointer;
            display:block; text-align:center; text-decoration:none;
            transition:all .2s ease;
        }
        .btn-guardar{margin-top:25px; background:#088395; color:white;}
        .btn-guardar:hover{
            background:#0A4D68;
            transform:translateY(-3px) scale(1.02);
            box-shadow:0 8px 18px rgba(8,131,149,.35);
        }
        .btn-ver{background:#E6F4F6; color:#0A4D68;}
        .btn-ver:hover{
            background:#cdeef2;
            transform:translateY(-3px) scale(1.02);
            box-shadow:0 8px 18px rgba(8,131,149,.20);
        }
        .btn-volver{background:#f0f0f0; color:#333;}
        .btn-volver:hover{
            background:#e0e0e0;
            transform:translateY(-3px) scale(1.02);
            box-shadow:0 8px 18px rgba(0,0,0,.15);
        }
        .btn:active{transform:translateY(0) scale(.98);}
        .logo{text-align:center; margin-bottom:2px; font-size:22px; font-weight:bold; color:#0A4D68;}
        .check{
            width:62px; height:62px; margin:0 auto 16px; background:#22c55e;
            color:white; font-size:36px; font-weight:bold; border-radius:12px;
            display:grid; place-items:center; box-shadow:0 8px 18px rgba(34,197,94,.35);
        }
        .msg-exito{color:#61768A; font-size:15px; margin:0 0 22px; line-height:1.5;}
        .msg-exito b{color:#0A4D68;}
        .msg-error{
            background:#ffebee; color:#c62828; padding:12px; border-radius:8px;
            font-size:14px; font-weight:bold; margin-bottom:10px;
        }
    </style>
</head>
<body>
<%
    String ok = request.getParameter("ok");
    String error = request.getParameter("error");
    String idPed = request.getParameter("id_pedido");
    String idProd = request.getParameter("id_producto");
%>
    <main class="card">
        <div class="logo">Harina de Mi Tierra</div>

        <% if (ok != null) { %>
            <p class="slogan">Sabor, tradición y calidad</p>
            <div class="check">✓</div>
            <h1>Pedido-Producto agregado correctamente</h1>
            <p class="msg-exito">El pedido <b>#<%= idPed != null ? idPed : "" %></b> con producto <b>#<%= idProd != null ? idProd : "" %></b> quedó guardado en la base de datos.</p>

            <a href="pedido_producto.jsp" class="btn btn-guardar">+ Registrar otro pedido</a>
            <a href="verPedidoProducto.jsp" class="btn btn-ver">Ver productos</a>
            <a href="index.jsp" class="btn btn-volver">Volver al menú</a>

        <% } else { %>
            <h1>Registro de Pedido-Producto</h1>
            <p class="sub">Ingrese los datos del detalle</p>

            <% if (error != null) { %>
                <div class="msg-error"><%= error %></div>
            <% } %>

            <form action="<%=request.getContextPath()%>/pedidoProductoServlet" method="post" style="text-align:left;">
                <label for="id_pedido">ID Pedido</label>
                <input type="number" id="id_pedido" name="id_pedido" required>
                <label for="id_producto">ID Producto</label>
                <input type="number" id="id_producto" name="id_producto" required>
                <label for="cantidad">Cantidad</label>
                <input type="number" id="cantidad" name="cantidad" placeholder="Ej: 2" required>
                <button type="submit" class="btn btn-guardar">Guardar</button>
            </form>
            <a href="verPedidoProducto.jsp" class="btn btn-ver">👀 Ver pedidos</a>
            <a href="index.jsp" class="btn btn-volver">← Volver al menú</a>
        <% } %>
    </main>
</body>
</html>