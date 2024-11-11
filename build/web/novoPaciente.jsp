<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Cadastro de Novo Paciente - Cl�nica Mente & Vida">
    <title>Cadastrar Novo Paciente</title>
    <link rel="stylesheet" href="css/novoPaciente.css">
</head>
<body>
    <header class="topo">
        <img src="img/psc.png" alt="Logo da Cl�nica" class="clinica-imagem">
        <h1>Cl�nica Mente e Vida</h1>
        <p>Saúde Mental e Bem-Estar</p>

        <div class="menu">
            <nav class="navbar">
                <ul>
                    <li><a href="home.jsp" >In�cio</a></li>
                    <li><a href="paciente.jsp" >Pacientes</a></li>
                    <li><a href="agendamento.jsp">Agendamentos</a></li>
                    <li><a href="prescricao.jsp">Prescri��es</a></li>
                    <li><a href="relatorio.jsp">Relat�rios</a></li>
                    <li><a href="perfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div> 
    </header>

    <main>
<h2>Novo Paciente</h2>
        <!-- Formul�rio para Cadastro de Novo Paciente -->
        <form id="form-paciente" action="CadastraPaciente" method="POST" enctype="multipart/form-data">
            <label for="nome">Nome Completo:</label>
            <input type="text" id="nome" name="nome" placeholder="Digite o nome do paciente" required><br><br>
        
            <label for="data_nascimento">Data de Nascimento:</label>
            <input type="date" id="data_nascimento" name="data_nascimento" required><br><br>
        
            <label for="telefone">Telefone:</label>
            <input type="tel" id="telefone" name="telefone" placeholder="Digite o telefone" required><br><br>
        
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Digite o email" required><br><br>
        
            <!-- Modificação para campo de arquivo -->
            <label for="historico_medico">Hist�rico M�dico (Arquivo):</label>
            <input type="file" id="historico_medico" name="historico_medico" accept=".pdf"><br><br>
        
            <input type="submit" value="Cadastrar Paciente">
        </form>
        

    <footer class="rodape">
        <p>&copy; 2024 Cl�nica Mente & Vida - Todos os direitos reservados</p>
    </footer>
</body>
</html>
