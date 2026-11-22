package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Conexion;

@WebServlet("/ClienteServlet")
public class clienteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String idCliente = request.getParameter("id_cliente");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");

        String mensaje = "";
        String color = "";
        String icono = "";
        boolean exito = false;

        try {
            Connection con = Conexion.conectar();

            String sqlCheck = "SELECT id_cliente FROM cliente WHERE id_cliente = ?";
            PreparedStatement pstCheck = con.prepareStatement(sqlCheck);
            pstCheck.setInt(1, Integer.parseInt(idCliente));
            ResultSet rs = pstCheck.executeQuery();

            if(rs.next()){
                mensaje = "Ese ID ya existe";
                color = "#E65100";
                icono = "⚠️";
                exito = false;
            } else {
                String sql = "INSERT INTO cliente (id_cliente, nombre, correo, telefono) VALUES (?, ?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(idCliente));
                pst.setString(2, nombre);
                pst.setString(3, correo);
                pst.setString(4, telefono);
                pst.executeUpdate();
                mensaje = "Cliente agregado correctamente";
                color = "#088395";
                icono = "✅";
                exito = true;
            }
            con.close();
        } catch (SQLException e) {
            mensaje = "Error SQL: " + e.getMessage();
            color = "#C62828";
            icono = "❌";
        }

        out.println("<!DOCTYPE html>");
        out.println("<html lang='es'><head><meta charset='UTF-8'>");
        out.println("<title>Resultado | Harina de Mi Tierra</title>");
        out.println("<style>");
        out.println("body{margin:0;min-height:100vh;display:grid;place-items:center;background:linear-gradient(135deg,#0A4D68,#088395);font-family:Arial,sans-serif;}");
        out.println(".card{width:min(400px,90vw);background:white;border-radius:16px;padding:35px;text-align:center;box-shadow:0 15px 45px rgba(0,0,0,.25);}");
        out.println(".icono{font-size:60px;margin-bottom:10px;}");
        out.println("h1{color:"+color+";margin:10px 0;font-size:22px;}");
        out.println("p{color:#61768A;line-height:1.5;}");
        out.println(".logo{font-size:20px;font-weight:bold;color:#0A4D68;margin-bottom:5px;}");
        out.println(".slogan{font-size:13px;font-style:italic;color:#0A5AA8;margin:0 0 20px 0;}");
        out.println(".btn{display:block;margin-top:12px;padding:13px;border-radius:8px;text-decoration:none;font-weight:bold;transition:all 0.3s ease;}");
        out.println(".btn-verde{background:#088395;color:white;}");
        out.println(".btn-verde:hover{background:#0A4D68;transform:translateY(-2px);box-shadow:0 5px 15px rgba(0,0,0,0.2);}");
        out.println(".btn-gris{background:#F0F2F5;color:#0A4D68;}");
        out.println(".btn-gris:hover{background:#E0E0E0;transform:translateY(-2px);box-shadow:0 5px 15px rgba(0,0,0,0.15);}");
        out.println("</style></head><body>");
        out.println("<div class='card'>");
        out.println("<div class='logo'>Harina de Mi Tierra</div>");
        out.println("<p class='slogan'>Sabor, tradicion y calidad</p>");
        out.println("<div class='icono'>"+icono+"</div>");
        out.println("<h1>"+mensaje+"</h1>");

        if(exito){
            out.println("<p>El cliente <b>"+nombre+"</b> quedo guardado en la base de datos.</p>");
        } else if(icono.equals("⚠️")){
            out.println("<p>El ID <b>"+idCliente+"</b> ya esta registrado. Usa otro ID o mira la lista de clientes.</p>");
        } else {
            out.println("<p>Revisa los datos e intentalo de nuevo.</p>");
        }

        out.println("<a href='cliente.jsp' class='btn btn-verde'>+ Registrar otro cliente</a>");
        out.println("<a href='verClientes.jsp' class='btn btn-gris'>Ver clientes guardados</a>");
        out.println("<a href='index.jsp' class='btn btn-gris'>Volver al menu</a>");
        out.println("</div></body></html>");
    }
}