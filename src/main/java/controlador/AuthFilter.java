package controlador;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String path = req.getRequestURI()
                .substring(req.getContextPath().length());

        // Rutas públicas
        if (path.equals("/login.jsp")
                || path.equals("/login")
                || path.equals("/logout")
                 || path.equals("/registroCliente.jsp")
                || path.equals("/registroCliente")
                || path.startsWith("/WEB-INF/")
                || path.startsWith("/css/")
                || path.startsWith("/js/")
                || path.startsWith("/img/")) {

            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);

        if (session == null
                || session.getAttribute("usuarioAutenticado") == null) {

            resp.sendRedirect(req.getContextPath()
                    + "/login.jsp");
            return;
        }

        resp.setHeader(
                "Cache-Control",
                "no-store, no-cache, must-revalidate"
        );

        chain.doFilter(request, response);
    }

}
