package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registroCliente")
public class RegistroClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String nombre = req.getParameter("nombre");
        String usuario = req.getParameter("usuario");
        String telefono = req.getParameter("telefono");
        String correo = req.getParameter("correo");
        String password = req.getParameter("password");

        try {
            Connection con = Conexion.conectar();

            // 1. VERIFICAR SI EL USUARIO YA EXISTE
            String sqlVerificar = "SELECT * FROM usuario WHERE usuario=?";
            PreparedStatement psVerificar = con.prepareStatement(sqlVerificar);
            psVerificar.setString(1, usuario);
            ResultSet rs = psVerificar.executeQuery();

            if (rs.next()) {
                // YA EXISTE, LO DEVUELVO AL REGISTRO CON ERROR
                rs.close();
                psVerificar.close();
                con.close();
                resp.sendRedirect(req.getContextPath() + "/registroCliente.jsp?error=1");
                return;
            }
            rs.close();
            psVerificar.close();

            // 2. GUARDAR EN TABLA usuario CON ROL CLIENTE
            // Asi va a poder entrar con el mismo login que tu, Sebastian
            String sqlUsuario = "INSERT INTO usuario (nombre, rol, usuario, password) VALUES (?, 'CLIENTE', ?, ?)";
            PreparedStatement psUsuario = con.prepareStatement(sqlUsuario);
            psUsuario.setString(1, nombre);
            psUsuario.setString(2, usuario);
            psUsuario.setString(3, password);
            psUsuario.executeUpdate();
            psUsuario.close();

            // 3. GUARDAR EN TABLA cliente
            String sqlCliente = "INSERT INTO cliente (nombre, correo, telefono) VALUES (?, ?, ?)";
            PreparedStatement psCliente = con.prepareStatement(sqlCliente);
            psCliente.setString(1, nombre);
            psCliente.setString(2, correo);
            psCliente.setString(3, telefono);
            psCliente.executeUpdate();
            psCliente.close();

            con.close();

            // 4. TODO BIEN, LO MANDO AL LOGIN CON MENSAJE DE EXITO
            resp.sendRedirect(req.getContextPath() + "/login.jsp?ok=1");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/registroCliente.jsp?error=1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/registroCliente.jsp");
    }
}