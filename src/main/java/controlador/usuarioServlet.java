package controlador;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Conexion;

@WebServlet("/usuarioServlet")
public class usuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String idUsuario = request.getParameter("id_usuario");
        String nombre = request.getParameter("nombre");
        String rol = request.getParameter("rol");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        try {
            Connection con = Conexion.conectar();

            String sqlCheck = "SELECT id_usuario FROM usuario WHERE id_usuario = ?";
            PreparedStatement pstCheck = con.prepareStatement(sqlCheck);
            pstCheck.setInt(1, Integer.parseInt(idUsuario));
            ResultSet rs = pstCheck.executeQuery();

            if (rs.next()) {
                con.close();
                response.sendRedirect("usuario.jsp?error=existe");
                return;
            }

            String sql = "INSERT INTO usuario (id_usuario, nombre, rol, usuario, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(idUsuario));
            pst.setString(2, nombre);
            pst.setString(3, rol);
            pst.setString(4, usuario);
            pst.setString(5, password);
            pst.executeUpdate();
            con.close();

            response.sendRedirect("usuario.jsp?ok=1&nombre=" + java.net.URLEncoder.encode(nombre, "UTF-8"));

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("usuario.jsp?error=existe");
        }
    }
}