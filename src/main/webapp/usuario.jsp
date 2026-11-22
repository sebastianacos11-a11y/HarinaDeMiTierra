<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario | Harina de Mi Tierra</title>
    <style>
        body{ margin:0; min-height:100vh; display:grid; place-items:center; background:linear-gradient(135deg,#0A4D68,#088395); font-family:Arial,sans-serif; color:#183A52; padding:20px; box-sizing:border-box; }
        .card{ width:min(420px,95vw); background:white; border-radius:16px; padding:35px; box-shadow:0 15px 45px rgba(0,0,0,.25); }
        .logo{ text-align:center; margin-bottom:5px; font-size:22px; font-weight:bold; color:#0A4D68; }
        .slogan{ text-align:center; color:#088395; font-style:italic; margin-bottom:20px; font-size:14px; }
        h1{ text-align:center; color:#088395; margin:0 0 8px; font-size:26px; }
        .sub{ text-align:center; color:#61768A; margin-bottom:20px; }
        .msg-error{ background:#fff3cd; color:#856404; border:1px solid #ffeeba; padding:12px; border-radius:8px; text-align:center; font-weight:bold; margin-bottom:15px; }
        label{ display:block; font-weight:600; margin:15px 0 7px; }
        input, select{ width:100%; box-sizing:border-box; padding:13px; border:1px solid #c8d6df; border-radius:8px; font-size:16px; outline:none; }
        input:focus, select:focus{ border-color:#088395; }

        /* EFECTO GELATINA */
        @keyframes gelatina{
            0%{ transform:scale(1,1); }
            25%{ transform:scale(0.95,1.05); }
            50%{ transform:scale(1.05,0.95); }
            75%{ transform:scale(0.98,1.02); }
            100%{ transform:scale(1,1); }
        }
        .btn-guardar, .btn-ver, .btn-volver, .btn-principal, .btn-sec{
            transition:0.2s;
        }
        .btn-guardar:hover, .btn-ver:hover, .btn-volver:hover, .btn-principal:hover, .btn-sec:hover{
            animation:gelatina 0.5s ease;
            transform:translateY(-2px);
        }

        .btn-guardar{ width:100%; margin-top:25px; background:#088395; border:0; border-radius:8px; color:white; padding:14px; font-size:16px; cursor:pointer; font-weight:bold; }
        .btn-guardar:hover{ background:#0A4D68; }
        .btn-ver{ display:block; text-align:center; margin-top:12px; background:#e7f3ff; color:#0A4D68; padding:13px; border-radius:8px; text-decoration:none; font-weight:bold; }
        .btn-ver:hover{ background:#cfe6ff; }
        .btn-volver{ display:block; text-align:center; margin-top:12px; background:#f1f3f5; color:#495057; padding:13px; border-radius:8px; text-decoration:none; font-weight:bold; }
        .btn-volver:hover{ background:#dee2e6; }

        /* ESTILO EXITO COMO EL DE CLIENTE */
        .check{ width:70px; height:70px; background:#4CAF50; color:white; font-size:40px; border-radius:12px; display:flex; align-items:center; justify-content:center; margin:0 auto 20px; animation:gelatina 0.8s ease; }
        .exito{ text-align:center; }
        .exito h1{ font-size:24px; }
        .exito p{ color:#61768A; line-height:1.5; margin:0 0 25px; }
        .exito p b{ color:#183A52; }
        .btn-principal{ display:block; background:#088395; color:white; padding:14px; border-radius:8px; text-decoration:none; font-weight:bold; margin-bottom:12px; }
        .btn-principal:hover{ background:#0A4D68; }
        .btn-sec{ display:block; background:#eef2f5; color:#0A4D68; padding:13px; border-radius:8px; text-decoration:none; font-weight:bold; margin-bottom:12px; }
        .btn-sec:hover{ background:#dee2e6; }
    </style>
</head>
<body>
    <main class="card">
        <% String ok = request.getParameter("ok");
           String error = request.getParameter("error");
           String nombreOk = request.getParameter("nombre");
           if("1".equals(ok)){ %>
            <!-- PANTALLA DE EXITO IGUAL A LA DE CLIENTE -->
            <div class="exito">
                <div class="logo">Harina de Mi Tierra</div>
                <div class="slogan">Sabor, tradición y calidad</div>
                <div class="check">✓</div>
                <h1>Usuario agregado correctamente</h1>
                <p>El usuario <b><%= nombreOk != null ? nombreOk : "" %></b> quedó guardado en la base de datos.</p>
                <a href="usuario.jsp" class="btn-principal">+ Registrar otro usuario</a>
                <a href="verUsuarios.jsp" class="btn-sec">Ver usuarios guardados</a>
                <a href="index.jsp" class="btn-sec">Volver al menú</a>
            </div>
        <% } else { %>
            <!-- FORMULARIO NORMAL -->
            <div class="logo">Harina de Mi Tierra</div>
            <h1>Registro de Usuario</h1>
            <p class="sub">Trabajadores del sistema</p>

            <% if("existe".equals(error)){ %>
                <div class="msg-error">⚠️ Ese ID de usuario ya existe, use otro ID</div>
            <% } %>

            <form action="<%=request.getContextPath()%>/usuarioServlet" method="post">
                <label>ID Usuario</label>
                <input type="number" name="id_usuario" required>

                <label>Nombre completo</label>
                <input type="text" name="nombre" required>

                <label>Rol</label>
                <select name="rol" required>
                    <option value="">Seleccione rol...</option>
                    <option value="ADMIN">ADMIN</option>
                    <option value="Cajero">Cajero</option>
                    <option value="Vendedor">Vendedor</option>
                    <option value="Cliente">Cliente</option>
                </select>

                <label>Usuario para entrar</label>
                <input type="text" name="usuario" placeholder="Ej: sebastian" required>

                <label>Contraseña</label>
                <input type="password" name="password" placeholder="Ingrese contraseña" required>

                <button type="submit" class="btn-guardar">Guardar</button>
            </form>

            <a href="verUsuarios.jsp" class="btn-ver">👀 Ver usuarios guardados</a>
            <a href="index.jsp" class="btn-volver">← Volver al menú</a>
        <% } %>
    </main>
</body>
</html>