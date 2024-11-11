<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Gerenciamento de Pacientes na Clínica Mente & Vida."> 
     
    <title>Pacientes - Clínica Mente & Vida</title>
    <link rel="stylesheet" href="css/paciente.css"> <!-- Link para o CSS -->
</head>
<body>

    <header class="topo">
        <img src="img/psc.png" alt="Logo da Clínica" class="clinica-imagem">
        <h1>Clínica Mente & Vida</h1>
        <p>Saúde Mental e Bem-Estar</p>
        <nav class="menu">
            <ul>
                <li><a href="home.jsp" >In�cio</a></li>
                <li><a href="paciente.jsp" >Pacientes</a></li>
                <li><a href="agendamento.jsp">Agendamentos</a></li>
                <li><a href="prescricao.jsp">Prescri��es</a></li>
                <li><a href="relatorio.jsp">Relat�rios</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Gerenciar Pacientes</h2>

        <table width="100%" border="1">
            <tr>
                <th>Nome</th>
                <th>Idade</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Ações</th>
            </tr>
            <tr>
                <td>Primeiro Nome</td>
                <td>Idade</td>
                <td>Telefone</td>
                <td>Email@example.com</td>
                
                <td>
                    <button>Editar</button>
                    <button>Visualizar</button>
                    <button>Excluir</button>
                </td>
            </tr>
            <!-- Adicione mais pacientes conforme necessário -->
        </table>

       <p><a href="novoPaciente.jsp" class="novo-Paciente">Novo Paciente</a></p> 
    </main>

    <footer class="rodape">
        <p>&copy; 2024 Clínica Mente & Vida - Todos os direitos reservados</p>
    </footer>

</body>
</html>
