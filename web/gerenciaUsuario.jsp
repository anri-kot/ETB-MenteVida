<%@page import="com.mentevida.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A Clínica Mente & Vida oferece serviÃ§os especializados para o diagnóstico e tratamento de transtornos mentais."> 
        <title>Gerencia Usuario - Clínica Mente & Vida</title>
        <link rel="stylesheet" href="css/novoPaciente.css"> <!-- Link para o CSS -->
    </head>
    <body>
         <header class="topo">
        <img src="img/psc.png" alt="Logo da Clínica" class="clinica-imagem">
        <div>
            <h1>Clínica Mente & Vida</h1>
            <p>Saúde Mental e Bem-Estar</p>
        </div>
        <nav class="menu">
            <ul class="nav-list">
                <li onclick="location = 'medico.jsp'">Médicos</li>
                <li onclick="location = 'funcionario.jsp'">Funcionários</li>
                <li onclick="location = 'usuario.jsp'">Gerenciar Usuários</li>
                <li onclick="location = 'perfil.jsp'">Perfil</li>
            </ul>
        </nav>
    </header>
        <%
            int idUsuario = 0;
            String username = "";
            boolean admin = false;
            
            String disabled = "";

            boolean alterar = false;
            if (request.getParameter("idUsuario") != null) {
                idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

                UsuarioDAO dao = new UsuarioDAO();
                String[] usuario = dao.mostrarIdUsuario(idUsuario).get(0); // {id, username, senha, admin}
                username = usuario[1];
                admin = Boolean.valueOf(usuario[3]);
                alterar = true;
                disabled = "disabled";
            }
        %>

        <main>
            <h2>Gerenciar Usuario</h2>

            <form id="form-usuario" method="POST" action="ControleUsuario" onsubmit="return checaSenha()">
                <label for="idUsuario">ID:</label>
                <input type="number" value="<%=idUsuario%>" disabled>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%=username%>"><br>
                
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" placeholder="Clique em Alterar Senha para liberar esse campo" <%=disabled%>><br>
                
                <label for="confirma">Confirmar senha:</label>
                <input type="password" id="confirma" name="confirma" <%=disabled%>><br>
                <%
                    if (alterar) {
                %>
                <div id="mudar-senha-conteiner">
                    <br><button type="button" id="mudar-senha" onclick="mudarSenha()">Alterar Senha</button>
                    <input type="hidden" name="idUsuario" value="<%=idUsuario%>">
                </div>
                <%
                    }
                %>

                <label for="admin" id="admin">Admin:</label>
                <input type="radio" name="admin" value="true" <%if (admin) {out.print("checked");}%> required> Admin
                <input type="radio" name="admin" value="false" <%if (!admin) {out.print("checked");}%> required> Usuário comum

                <p><input type="submit" id="submitBtn" value= "Efetuar Registro"></p>
            </form>

        </main>
                
        <script>
            let clicou = false;
            const alteraBtn = document.getElementById("mudar-senha");
            const adminCampo = document.getElementById("admin");
            const senha = document.getElementById("senha");
            const confirmaSenha = document.getElementById("confirma");

            function mudarSenha() {
                if (!clicou) {
                    senha.disabled = false;
                    confirmaSenha.disabled = false;
                    clicou = true;
                    alteraBtn.textContent = "Não alterar senha";
                } else {
                    senha.disabled = true;
                    confirmaSenha.disabled = true;
                    alteraBtn.textContent = "Alterar senha";
                    clicou = false;
                }
            }

            function checaSenha() {
                if (confirmaSenha.value === senha.value || senha.disabled == true) {
                    let res = confirm("Tem certeza de que deseja efetuar a operação?");
                    return res;
                } else {
                    alert("Senhas não batem");
                    return false;
                }
            }
        </script>
    </body>
</html>

