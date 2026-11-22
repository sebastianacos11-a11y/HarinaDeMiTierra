package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String usuario = req.getParameter("usuario");
        String password = req.getParameter("password");

        try {
            Connection con = Conexion.conectar();
            String sql = "SELECT * FROM usuario WHERE usuario=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                HttpSession session = req.getSession(true);
                session.setAttribute("usuarioAutenticado", usuario);
                session.setAttribute("rol", rs.getString("rol"));
                session.setAttribute("nombre", rs.getString("nombre"));
                session.setMaxInactiveInterval(30*60);
                resp.sendRedirect(req.getContextPath() + "/index.jsp");
            }else{
                resp.sendRedirect(req.getContextPath() + "/login.jsp?error=1");
            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/login.jsp?error=1");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}