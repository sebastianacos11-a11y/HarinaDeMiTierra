package controlador;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Conexion;

@WebServlet("/pedidoServlet")
public class pedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("pedido.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String idPedido = request.getParameter("id_pedido");
        String fecha = request.getParameter("fecha");
        String idCliente = request.getParameter("id_cliente");
        String idUsuario = request.getParameter("id_usuario");

        if (idPedido == null || fecha == null || idCliente == null || idUsuario == null
                || idPedido.trim().isEmpty() || fecha.trim().isEmpty()
                || idCliente.trim().isEmpty() || idUsuario.trim().isEmpty()) {
            response.sendRedirect("pedido.jsp?error=" + java.net.URLEncoder.encode("Completa todos los campos", "UTF-8"));
            return;
        }

        try (Connection con = Conexion.conectar()) {
            if (con == null) {
                response.sendRedirect("pedido.jsp?error=" + java.net.URLEncoder.encode("No se pudo conectar a la base de datos", "UTF-8"));
                return;
            }

            String sql = "INSERT INTO pedido (id_pedido, fecha, id_cliente, id_usuario) VALUES (?, ?, ?, ?) " +
                         "ON DUPLICATE KEY UPDATE fecha=VALUES(fecha), id_cliente=VALUES(id_cliente), id_usuario=VALUES(id_usuario)";

            try (PreparedStatement pst = con.prepareStatement(sql)) {
                pst.setInt(1, Integer.parseInt(idPedido.trim()));
                pst.setDate(2, java.sql.Date.valueOf(fecha.trim()));
                pst.setInt(3, Integer.parseInt(idCliente.trim()));
                pst.setInt(4, Integer.parseInt(idUsuario.trim()));
                pst.executeUpdate();
            }

            // *** AQUI ESTABA EL ERROR, YA CORREGIDO ***
            // Antes te mandaba a verPedidos, ahora te manda al MISMO pedido.jsp
            // para que salga la tarjeta verde como en Cliente
            response.sendRedirect("pedido.jsp?ok=1&id=" + idPedido.trim());

        } catch (NumberFormatException e) {
            try {
                response.sendRedirect("pedido.jsp?error=" + java.net.URLEncoder.encode("Revisa los números, solo van números en ID", "UTF-8"));
            } catch (Exception ex) {}
        } catch (SQLException e) {
            String msg = e.getMessage();
            if (msg != null && (msg.contains("foreign key") || msg.contains("a foreign key"))) {
                msg = "Ese ID Cliente o ID Usuario no existe, primero créalo en Clientes / Usuarios";
            }
            try {
                response.sendRedirect("pedido.jsp?error=" + java.net.URLEncoder.encode(msg, "UTF-8"));
            } catch (Exception ex) {}
        }
    }
}