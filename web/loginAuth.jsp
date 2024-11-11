<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mentevida.auth.Encryptor"%>
<%@page import="com.mentevida.dao.UsuarioDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String _username = request.getParameter("username");
            String _password = Encryptor.encrypt(request.getParameter("password"));
            
            UsuarioDAO dao = new UsuarioDAO();
            try {
                String[] user = dao.mostrarUsernameUsuarios(_username).get(0);
                    if (!user[2].equals(_password)) {
                        out.print("Senha incorreta.");
                        out.print("<a href='index.html'>Voltar</a>");
                        session.setAttribute("usuarioLoggado", false);
                    } else {
                        session.setAttribute("usuarioLogado", true);
                        response.sendRedirect("home.jsp");
                    }
            } catch (Exception ignore) {
                out.print("Usuário inválido.<br>");
                out.print("<a href='index.html'>Voltar</a>");
                session.setAttribute("usuarioLoggado", false);
            }

        %>
    </body>
</html>
