<%@page import="com.mentevida.nucleo.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="com.mentevida.dao.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Gerenciamento de Funcionários da Clínica Mente & Vida.">
        <title>Funcionarios - Clínica Mente & Vida</title>
        <link rel="stylesheet" href="css/relatorio.css">
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
                        <% } else { %>
                    <li onclick="location = 'medico.jsp'">Médicos</li>
                    <li onclick="location = 'funcionario.jsp'">Funcionários</li>
                    <li onclick="location = 'usuario.jsp'">Gerenciar Usuários</li>
                        <% } %>
                    <li onclick="location = 'perfil.jsp'">Perfil</li>
                </ul>
            </nav>
        </header>

        <%
            int idFuncionario = 0;
            String nome = "";
            String funcao = "";
            String telefone = "";
            String cpf = "";
            String email = "";
            int idUsuario = 0;
        %>

        <main>
            <h2>Funcionarios Registrados</h2>
            
            <p>
                <form action="funcionario.jsp" method="GET">
                Pesquisar: 
                    <input type="text" name="pesquisa" size="100" placeholder="Pesquise por nome ou cpf">
                    <input type="submit" value="Pesquisar">
                </form>
            </p>

            <p><a href="gerenciaFuncionario.jsp" class="novo-relatorio">Novo Funcionário</a></p>

            
            <table width="100%" border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Função</th>
                    <th>Telefone</th>
                    <th>CPF</th>
                    <th>Email</th>
                    <th>ID Usuario</th>
                    <th>Ações</th>
                </tr>
                <%
                    FuncionarioDAO dao = new FuncionarioDAO();
                    List<Funcionario> listaFuncionario = null;
                    Funcionario funcionario = null;
                    
                    String pesquisa = "";
                    if (request.getParameter("pesquisa") != null) {
                        pesquisa = (String) request.getParameter("pesquisa");
                        listaFuncionario = dao.pesquisarFuncionarios(pesquisa);
                    } else {
                        listaFuncionario = dao.mostrarTodosFuncionarios();
                    }
                    int i = 0;
                    while (i < listaFuncionario.size()) {
                        funcionario = listaFuncionario.get(i);

                        idFuncionario = funcionario.getIdFuncionario();
                        nome = funcionario.getNome();
                        funcao = funcionario.getCargo();
                        telefone = funcionario.getTelefone();
                        cpf = funcionario.getCpf();
                        cpf = String.format("%s.%s.%s-%s", 
                            cpf.substring(0, 3), 
                            cpf.substring(3, 6), 
                            cpf.substring(6, 9), 
                            cpf.substring(9, 11));
                        email = funcionario.getEmail();
                        idUsuario = funcionario.getIdUsuario();
                %>
                <tr>
                    <td>
                        <%=idFuncionario%>
                    </td>
                    <td>
                        <%=nome%>
                    </td>
                    <td>
                        <%=funcao%>
                    </td>
                    <td>
                        <%=telefone%>
                    </td>
                    <td>
                        <%=cpf%>
                    </td>
                    <td>
                        <%=email%>
                    </td>
                    <td>
                        <%=idUsuario%>
                    </td>
                    <td>
                        <form class="botoesAcao" action="gerenciaFuncionario.jsp" method="POST" onsubmit="return validarAcao(<%=admin%>, 0, 0)">
                            <button class="btn-editar">
                                Editar
                            </button>
                            <input type="hidden" name="idFuncionario" value="<%=idFuncionario%>">
                        </form>

                        <form class="botoesAcao" action="ControleFuncionario" method="POST" onsubmit="return validarAcao(<%=admin%>, 1, <%=idFuncionario%>)">
                            <input type="hidden" name="idFuncionario" value="<%=idFuncionario%>">
                            <input type="hidden" name="excluir" value="true">
                            <button class="btn-excluir">
                                Excluir
                            </button>
                        </form>
                    </td>
                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </main>

        <script>
            function validarAcao(admin, acao, id) {
                // acao = 0 -> editar; 1 -> excluir

                if (!admin) {
                    alert('Você não tem permissão de administrador.');
                    return false;
                } else if (acao !== 0) {
                    return confirm('Você tem certeza de que quer excluir o funcionario ' + id + '?');
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
