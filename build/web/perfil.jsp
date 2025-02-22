<%@page import="com.mentevida.nucleo.Funcionario"%>
<%@page import="com.mentevida.dao.FuncionarioDAO"%>
<%@page import="com.mentevida.nucleo.Medico"%>
<%@page import="com.mentevida.dao.MedicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Perfil - ClÃ­nica Mente & Vida">

        <link rel="stylesheet" href="css/perfil.css"> <!-- Link para o arquivo CSS -->
    </head>
    <body>
        <%
            int idUser = -1;
            int userCargo = -1;
            boolean admin = false;
            if (session.getAttribute("user") == null || session.getAttribute("cargo") == null || session.getAttribute("admin") == null) {
                response.sendRedirect("index.jsp");
            } else {
                idUser = (int) session.getAttribute("user");
                userCargo = (int) session.getAttribute("cargo");
                admin = (boolean) session.getAttribute("admin");
            }
        %>
        
        <header class="topo">
        <img src="img/psc.png" alt="Logo da Clínica" class="clinica-imagem">
        <div>
            <h1>Clínica Mente & Vida</h1>
            <p>Saúde Mental e Bem-Estar</p>
        </div>
        <nav class="menu">
            <ul class="nav-list">
                <% if (!admin) { %>
                <li onclick="location = 'home.jsp'">Início</li>
                <li onclick="location = 'paciente.jsp'">Pacientes</li>
                <li onclick="location = 'medico.jsp'">Médicos</li>
                <li onclick="location = 'funcionario.jsp'">Funcionários</li>
                <li onclick="location = 'agendamento.jsp'">Agendamentos</li>
                <li onclick="location = 'consulta.jsp'">Consultas</li>
                <li onclick="location = 'prescricao.jsp'">Prescrições</li>
                <li onclick="location = 'relatorio.jsp'">Relatórios</li>
                <li onclick="location = 'perfil.jsp'">Perfil</li>
                <% } else { %>
                <li onclick="location = 'medico.jsp'">Médicos</li>
                <li onclick="location = 'funcionario.jsp'">Funcionários</li>
                <li onclick="location = 'usuario.jsp'">Gerenciar Usuários</li>
                <li onclick="location = 'perfil.jsp'">Perfil</li>
                <% } %>
            </ul>
        </nav>
    </header>
        <%
            int idCargo = (int) session.getAttribute("cargo"); // 0 = medico, 1 = funcionario

            String nome;
            String email;
            String cargo;
            String telefone;
            String funcao;

            if (idCargo == 0) {
                MedicoDAO dao = new MedicoDAO();
                Medico med = dao.mostrarUserIdMedicos(idUser).get(0);
                nome = med.getNome();
                email = med.getEmail();
                telefone = med.getTelefone();
                funcao = med.getEspecialidade();
                cargo = "Médico";
            } else {
                FuncionarioDAO dao = new FuncionarioDAO();
                Funcionario fun = dao.mostrarUserIdFuncionario(idUser).get(0);
                nome = fun.getNome();
                email = fun.getEmail();
                telefone = fun.getTelefone();
                funcao = fun.getCargo();
                cargo = "Funcionario";
            }
        %>

        <main>
            <h2> Perfil</h2>

            <div class="container">
                <form action="LogoutServlet" method="POST" onsubmit="return confirm('Efetuar logout?')">
                    <button id='logoff' type="submit">Efetuar logout</button>
                </form>
                <form>
                    <label for="name">Nome:</label>
                    <input type="text" id="name" value="<%=nome%>" disabled>

                    <label for="email">Email:</label>
                    <input type="email" id="email" value="<%=email%>" disabled>

                    <label for="telefone">Telefone:</label>
                    <input type="number" id="telefone" value="<%=telefone%>" disabled>

                    <label for="funcao">Função:</label>
                    <input type="text" id="funcao" value="<%=funcao%>" disabled>

                    <label for="position">Cargo:</label>
                    <input type="text" id="position" value="<%=cargo%>" disabled>

                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" placeholder="Clique em Alterar Dados para mudar sua senha" disabled>

                    <button type="button" onclick='alterarDados()'>Alterar Dados</button>
                </form>
            </div>

            <script>
                function alterarDados() {
                    location = "gerenciaPerfil.jsp";
                }
            </script>

    </body>
</html>