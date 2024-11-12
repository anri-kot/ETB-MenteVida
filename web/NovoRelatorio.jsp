<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A Clínica Mente & Vida oferece serviços especializados para o diagnóstico e tratamento de transtornos mentais.">
        <link rel="stylesheet" href="css/novoRelatorio.css">
        <title>Novo Relatório</title>
    <head>

    </head>
    <body>

        <header class="topo">
            <img src="img/psc.png" alt="DescriÃ§Ã£o da imagem">
            <h1>Clínica Mente & Vida</h1>
            <p>Saúde Mental e Bem-Estar</p>

            <div class="menu">
                <nav class="navbar">
                    <ul>
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="paciente.jsp">Pacientes</a></li>
                        <li><a href="agendamento.jsp">Agendamentos</a></li>
                        <li><a href="prescricao.jsp">Prescrições</a></li>
                        <li><a href="relatorio.jsp">Relatórios</a></li>
                        <li><a href="perfil.jsp">Perfil</a></li>
                    </ul>
                </nav>
            </div>
        </header>


        <h1>Gerenciar Relatórios</h1>


        <!-- Formulário para adicionar novo relatório -->
        <form id="form-relatorio" action="CadastrarRelatorios" method="POST" enctype="multipart/form-data">

            <label for="data">Data do Relatorio:</label>
            <input type="date" id="data" name="data"  required>
            
            <label for="consulta">Consulta:</label>
            <input type="number" id="consulta" name="consulta" placeholder="Insira o ID da consulta" required>

            <label for="arquivo">Arquivo:</label>
            <input type="file" id="arquivo" name="arquivo" accept=".pdf" required><br><br>

            <input type="submit" value="Efetuar Registro">
        </form>

        <div class="container">
            <a href="home.jsp" class="botoes" >Home</a>
            <a href="relatorio.jsp" class="botoes" >Voltar</a>
        </div>


        <footer class="rodape">
            <p>&copy; 2024 Clínica Mente & Vida - Todos os direitos reservados</p>
        </footer>
    </body>

</html>