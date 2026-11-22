package controlador;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Conexion;

@WebServlet("/pedidoProductoServlet")
public class pedidoProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("pedido_producto.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String idPedido = request.getParameter("id_pedido");
        String idProducto = request.getParameter("id_producto");
        String cantidad = request.getParameter("cantidad");

        if (idPedido == null || idProducto == null || cantidad == null
                || idPedido.trim().isEmpty() || idProducto.trim().isEmpty() || cantidad.trim().isEmpty()) {
            response.sendRedirect("pedido_producto.jsp?error=" + java.net.URLEncoder.encode("Completa todos los campos", "UTF-8"));
            return;
        }

        try (Connection con = Conexion.conectar()) {
            if (con == null) {
                response.sendRedirect("pedido_producto.jsp?error=" + java.net.URLEncoder.encode("No se pudo conectar a la base de datos", "UTF-8"));
                return;
            }

            String sql = "INSERT INTO pedido_producto (id_pedido, id_producto, cantidad) VALUES (?, ?, ?) " +
                         "ON DUPLICATE KEY UPDATE cantidad=VALUES(cantidad)";

            try (PreparedStatement pst = con.prepareStatement(sql)) {
                pst.setInt(1, Integer.parseInt(idPedido.trim()));
                pst.setInt(2, Integer.parseInt(idProducto.trim()));
                pst.setInt(3, Integer.parseInt(cantidad.trim()));
                pst.executeUpdate();
            }

            response.sendRedirect("pedido_producto.jsp?ok=1&id_pedido=" + idPedido.trim() + "&id_producto=" + idProducto.trim());

        } catch (NumberFormatException e) {
            try {
                response.sendRedirect("pedido_producto.jsp?error=" + java.net.URLEncoder.encode("Revisa los números, solo van números en ID", "UTF-8"));
            } catch (Exception ex) {}
        } catch (SQLException e) {
            String msg = e.getMessage();
            if (msg != null && (msg.contains("foreign key") || msg.contains("a foreign key"))) {
                msg = "Ese ID Pedido o ID Producto no existe, primero créalo en Pedidos / Productos";
            }
            try {
                response.sendRedirect("pedido_producto.jsp?error=" + java.net.URLEncoder.encode(msg, "UTF-8"));
            } catch (Exception ex) {}
        }
    }
}