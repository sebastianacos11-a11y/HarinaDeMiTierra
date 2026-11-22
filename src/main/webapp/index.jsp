<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // PROTECCION: SI NO HA ENTRADO, LO MANDA AL LOGIN
    if (session.getAttribute("usuarioAutenticado") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sistema Harina de mi Tierra</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #F0F2F5;
        }
        header {
            background-color: #0D47A1;
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
        }
        header p {
            margin: 5px 0 0 0;
            font-size: 16px;
            font-style: italic;
            color: #BBDEFB;
            letter-spacing: 1px;
        }
        /* BOTON CERRAR SESION BIEN BONITO */
        .btn-salir{
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #C62828;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
        }
        .btn-salir:hover{
            background-color: #B71C1C;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        .usuario-top{
            position: absolute;
            top: 15px;
            left: 20px;
            font-size: 14px;
            color: #BBDEFB;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .usuario-top img{
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: white;
            padding: 2px;
        }
        .hero {
            text-align: center;
            padding: 25px 15px 10px;
        }
        .hero img {
            width: min(420px, 90vw);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,.25);
        }
        .bienvenidos {
            text-align: center;
            max-width: 600px;
            margin: 0 auto;
            padding: 10px 20px;
        }
        .bienvenidos h2 {
            color: #0A5AA8;
            margin-bottom: 8px;
        }
        .bienvenidos p {
            color: #4a5a68;
            line-height: 1.6;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background-color: #FFFFFF;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        ul { list-style: none; padding: 0; }
        li { margin: 12px 0; }
        li a {
            display: block;
            background-color: #2E7D32;
            color: white;
            text-decoration: none;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        li a:hover {
            background-color: #1B5E20;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        footer {
            margin-top: 40px;
            text-align: center;
            color: #212121;
            font-size: 14px;
            padding: 15px;
        }
    </style>
</head>
<body>
    <header>
        <span class="usuario-top"><img src="img/usuario.png" alt="Usuario"> <%= session.getAttribute("usuarioAutenticado") %></span>
        <a href="logout" class="btn-salir">Cerrar Sesión ✕</a>
        <h1>Sistema Harina de mi Tierra</h1>
        <p>Sabor, tradición y calidad</p>
    </header>

    <div class="hero">
        <img src="img/empanadas.png" alt="Empanadas Harina de Mi Tierra">
    </div>

    <div class="bienvenidos">
        <h2>Bienvenidos</h2>
        <p>En Harina de Mi Tierra ofrecemos productos elaborados con ingredientes de excelente calidad. Nuestro compromiso es brindar sabor, tradición y confianza a cada uno de nuestros clientes.</p>
    </div>

    <div class="container">
        <h2>Menú Principal</h2>
        <ul>
            <li><a href="cliente.jsp">Clientes</a></li>
            <li><a href="usuario.jsp">Usuarios</a></li>
            <li><a href="producto.jsp">Productos</a></li>
            <li><a href="pedido.jsp">Pedidos</a></li>
            <li><a href="pedido_producto.jsp">Pedidos-Productos</a></li>
        </ul>
    </div>

    <footer>
        Harina de mi Tierra - Pasto, Nariño - 2026 - Todos los derechos reservados
    </footer>
</body>
</html>