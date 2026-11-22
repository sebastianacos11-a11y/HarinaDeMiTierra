<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Clientes | Harina de Mi Tierra</title>

    <style>
        body{
            margin:0;
            min-height:100vh;
            display:grid;
            place-items:center;
            background:linear-gradient(135deg,#0A4D68,#088395);
            font-family:Arial,sans-serif;
            color:#183A52;
        }
        .card{
            width:min(380px,90vw);
            background:white;
            border-radius:16px;
            padding:35px;
            box-shadow:0 15px 45px rgba(0,0,0,.25);
        }
        h1{
            text-align:center;
            color:#088395;
            margin-bottom:8px;
        }
        .sub{
            text-align:center;
            color:#61768A;
            margin-bottom:30px;
        }
        label{
            display:block;
            font-weight:600;
            margin:18px 0 7px;
        }
        input{
            width:100%;
            box-sizing:border-box;
            padding:13px;
            border:1px solid #c8d6df;
            border-radius:8px;
            font-size:16px;
        }
        input:focus{
            outline:none;
            border-color:#088395;
            box-shadow:0 0 0 3px rgba(8,131,149,0.15);
        }
        button{
            width:100%;
            margin-top:25px;
            background:#088395;
            border:0;
            border-radius:8px;
            color:white;
            padding:14px;
            font-size:16px;
            font-weight:bold;
            cursor:pointer;
            transition: all 0.3s ease;
        }
        button:hover{
            background:#0A4D68;
            transform: translateY(-2px);
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }
        .logo{
            text-align:center;
            margin-bottom:5px;
            font-size:22px;
            font-weight:bold;
            color:#0A4D68;
        }
        .slogan{
            text-align:center;
            margin:0 0 15px 0;
            font-size:14px;
            font-style:italic;
            color:#0A5AA8;
            letter-spacing:1px;
        }
        .volver{
            display:block;
            text-align:center;
            margin-top:15px;
            background:#F0F2F5;
            color:#0A4D68;
            font-weight:bold;
            text-decoration:none;
            padding:13px;
            border-radius:8px;
            font-size:15px;
            transition: all 0.3s ease;
        }
        .volver:hover{
            background:#E0E0E0;
            transform: translateY(-2px);
            box-shadow:0 5px 15px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>

    <main class="card">
        <div class="logo">Harina de Mi Tierra</div>
        <p class="slogan">Sabor, tradición y calidad</p>
        <h1>Registro de Clientes</h1>
        <p class="sub">Ingrese los datos del cliente</p>

        <form action="<%=request.getContextPath()%>/ClienteServlet" method="post">

            <label for="id_cliente">🆔 ID Cliente</label>
            <input type="number" id="id_cliente" name="id_cliente" placeholder="Ej: 101" required>

            <label for="nombre">👤 Nombre</label>
            <input type="text" id="nombre" name="nombre" placeholder="Ej: Juan Pérez" required>

            <label for="correo">📧 Correo</label>
            <input type="email" id="correo" name="correo" placeholder="Ej: juan@gmail.com" required>

            <label for="telefono">📱 Teléfono</label>
            <input type="text" id="telefono" name="telefono" placeholder="Ej: 315 123 4567" required>

                        <button type="submit">Guardar</button>
        </form>

        <a href="verClientes.jsp" class="volver" style="background:#E0F7FA; color:#088395;">👀 Ver clientes guardados</a>
        <a href="index.jsp" class="volver">← Volver al menú</a>
    </main>

</body>
</html>