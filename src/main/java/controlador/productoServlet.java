package controlador;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Conexion;

@WebServlet("/productoServlet")
public class productoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ESTA LINEA ES LA QUE ARREGLA LA Ñ Y LAS TILDES
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String idProducto = request.getParameter("id_producto");
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");

        try {
            Connection con = Conexion.conectar();

            String sqlCheck = "SELECT id_producto FROM producto WHERE id_producto = ?";
            PreparedStatement pstCheck = con.prepareStatement(sqlCheck);
            pstCheck.setInt(1, Integer.parseInt(idProducto));
            ResultSet rs = pstCheck.executeQuery();

            if (rs.next()) {
                con.close();
                response.sendRedirect("producto.jsp?error=existe");
                return;
            }

            String sql = "INSERT INTO producto (id_producto, nombre, precio) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(idProducto));
            pst.setString(2, nombre);
            pst.setDouble(3, Double.parseDouble(precio));
            pst.executeUpdate();
            con.close();

            response.sendRedirect("producto.jsp?ok=1&nombre=" + java.net.URLEncoder.encode(nombre, "UTF-8"));

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("producto.jsp?error=existe");
        }
    }
}