<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mentevida.auth.Encryptor"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autentifica Login</title>
    </head>
    <body>
        <%
            Encryptor enc = new Encryptor();
            
            String _username = request.getParameter("username");
            String _password = request.getParameter("password");
            
            String thePassword = enc.encrypt("admin");
            if (!thePassword.equals(enc.encrypt(_password))) {
                out.print("Login inválido");
            } else {
                out.print("Login válido");
            }
        %>
    </body>
</html>
