<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuarioAutenticado") != null) {
        response.sendRedirect("index.jsp");
        return;
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Iniciar Sesión | Harina de Mi Tierra</title>

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
            color:#0D47A1;
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
            border-color:#2E7D32;
            box-shadow:0 0 0 3px rgba(46,125,50,0.15);
        }

        button{
            width:100%;
            margin-top:25px;
            background:#2E7D32;
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
            background:#1B5E20;
            transform: translateY(-2px);
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }

        .error{
            padding:12px;
            background:#ffeceb;
            color:#a51b1b;
            border-radius:7px;
            margin-bottom:15px;
            text-align:center;
        }

        .logo{
            text-align:center;
            margin-bottom:5px;
            font-size:22px;
            font-weight:bold;
            color:#0D47A1;
        }

        .slogan{
            text-align:center;
            margin:0 0 15px 0;
            font-size:14px;
            font-style:italic;
            color:#0A5AA8;
            letter-spacing:1px;
        }

        .footer-login{
            text-align:center;
            margin-top:25px;
            font-size:12px;
            color:#61768A;
        }

        /* --- LO NUEVO DEL PUNTO 2, NADA MÁS --- */
        .registro{
            text-align:center;
            margin-top:18px;
        }
        .registro p{
            margin:0 0 10px 0;
            font-size:14px;
            color:#61768A;
        }
        .btn-registro{
            display:block;
            background:#E3F2FD;
            color:#0D47A1;
            text-decoration:none;
            padding:14px;
            border-radius:8px;
            font-size:16px;
            font-weight:bold;
            transition: all 0.3s ease;
        }
        .btn-registro:hover{
            background:#BBDEFB;
            transform: translateY(-2px);
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }
        .ok{
            padding:12px;
            background:#e8f5e9;
            color:#2E7D32;
            border-radius:7px;
            margin-bottom:15px;
            text-align:center;
            font-weight:bold;
        }

    </style>
</head>

<body>

    <main class="card">

        <div class="logo">
            Harina de Mi Tierra
        </div>

        <p class="slogan">Sabor, tradición y calidad</p>

        <h1>Iniciar Sesión</h1>

        <p class="sub">
            Ingrese sus credenciales para continuar
        </p>

        <% if("1".equals(request.getParameter("error"))){ %>

        <p class="error">
            Usuario o contraseña incorrectos
        </p>

        <% } %>

        <% if("1".equals(request.getParameter("ok"))){ %>
        <p class="ok">
            ¡Cuenta creada! Ya puedes ingresar
        </p>
        <% } %>

        <form action="<%=request.getContextPath()%>/login" method="post">

            <label for="usuario">Usuario</label>

            <input
                type="text"
                id="usuario"
                name="usuario"
                autocomplete="username"
                required>

            <label for="password">Contraseña</label>

            <input
                type="password"
                id="password"
                name="password"
                autocomplete="current-password"
                required>

            <button type="submit">
                Ingresar
            </button>

        </form>

        <!-- PUNTO 2: BOTON REGISTRARSE, CON BRINQUITO IGUAL QUE EL VERDE -->
        <div class="registro">
            <p>¿No tienes cuenta?</p>
            <a href="registroCliente.jsp" class="btn-registro">
                Regístrate aquí
            </a>
        </div>

        <p class="footer-login">
            Harina de mi Tierra - Pasto, Nariño - 2026
        </p>

    </main>

    <script>
        // SI VIENE POR BOTON ATRAS, OBLIGA A RECARGAR DEL SERVIDOR
        // Asi el JSP si puede revisar la sesion y mandarlo al index
        window.addEventListener("pageshow", function(event) {
            if (event.persisted) {
                window.location.reload();
            }
        });
    </script>

</body>
</html>