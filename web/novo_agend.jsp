<%@page import="com.mentevida.nucleo.Funcionario"%>
<%@page import="com.mentevida.dao.FuncionarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.mentevida.nucleo.Medico"%>
<%@page import="com.mentevida.dao.MedicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A Clínica Mente & Vida oferece serviÃ§os especializados para o diagnÃ³stico e tratamento de transtornos mentais."> 

        <title>Novo Agendamento - Clínica Mente & Vida</title>
        <link rel="stylesheet" href="css/novoAgendamento.css"> <!-- Link para o CSS -->
    </head>
    <body>
        <%
            MedicoDAO medDAO = new MedicoDAO();
            List<Medico> medico = medDAO.mostrarTodosMedicos();
            FuncionarioDAO funDAO = new FuncionarioDAO();
            List<Funcionario> funcionario = funDAO.mostrarTodasFuncionarios();
            int i = 0;
            int j = 0;
        %>
        <header class="topo">
            <img src="img/psc.png" alt="Logo da Clínica" class="clinica-imagem">
            <h1>Clínica Mente & Vida</h1>
            <p>Saúde Mental e Bem-Estar</p>
            <nav class="menu">
                <ul>
                    <li><a href="home.html">Home</a></li>
                    <li><a href="paciente.html">Pacientes</a></li>
                    <li><a href="agendamento.html">Agendamentos</a></li>
                    <li><a href="prescricao.html">Prescrições</a></li>
                    <li><a href="relatorio.html">Relatórios</a></li>
                    <li><a href="perfil.html">Perfil</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <h2>Gerenciar Agendamento</h2>

            <form id="form-agendamento" method="POST" action="CadastrarAgendamento">

                <label for="data_agendamento">Data:</label>
                <input type="datetime-local" id="data_agendamento" name="data_agendamento" required>

                <label for="status">Status:</label>
                <input type="radio" id="status" name="status" value="true"> Compareceu
                <input type="radio" id="status" name="status" value="false" checked> Não compareceu

                <label for="paciente">Paciente:</label>
                <input type="number" id="paciente" name="paciente"/>

                <label for="medico">Medico:</label>
                <input list="medicos" id="medico" name="medico"/>
                <datalist id="medicos">
                    <% while (i < medico.size()) { %>
                    <option value="<%= medico.get(i).getIdMedico()%>"><%="ID: " + medico.get(i).getIdMedico() + " | " + medico.get(i).getNome()%></option>
                    <%
                        i++;
                        } 
                    %>
                </datalist> 

                <label for="funcionario">Funcionario:</label>
                <input list="funcionarios" id="funcionario" name="funcionario"/>
                <datalist id="funcionarios">
                    <% while (j < funcionario.size()) { %>
                    <option value="<%= funcionario.get(j).getIdFuncionario()%>"><%="ID: " + funcionario.get(j).getIdFuncionario() + " | " + funcionario.get(j).getNome()%></option>
                    <%
                        j++;
                        } 
                    %>
                </datalist> 

                <p><input type="submit" value= "Efetuar Registro"></p> 
            </form>

            <div class="container">
                <a href="home.html" class="botoes" >Home</a>
                <a href="relatorio.html" class="botoes" >Voltar</a>
            </div>
        </main>

        <footer class="rodape">
            <p>&copy; 2024 Clínica Mente & Vida - Todos os direitos reservados</p>
        </footer>

    </body>
</html>
