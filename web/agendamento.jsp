<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A Clínica Mente & Vida oferece serviÃ§os especializados para o diagnÃ³stico e tratamento de transtornos mentais."> 
     
    <title>Agendamento - Clínica Mente & Vida</title>
    <link rel="stylesheet" href="css/agendamento.css"> <!-- Link para o CSS -->
</head>
<body>

    <header class="topo">
        <img src="img/psc.png" alt="Logo da Clínica" class="clinica-imagem">
        <h1>Clínica Mente & Vida</h1>
        <p>Saúde Mental e Bem-Estar</p>
        <div class="menu">
            <nav class="navbar">
                <ul>
                    <li><a href="home.jsp" >Início</a></li>
                    <li><a href="paciente.jsp" >Pacientes</a></li>
                    <li><a href="agendamento.jsp">Agendamentos</a></li>
                    <li><a href="prescricao.jsp">Prescrições</a></li>
                    <li><a href="relatorio.jsp">Relatórios</a></li>
                    <li><a href="perfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <h2>Visualizar Agendamento</h2>
       

        <table width="100%" border="1">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Idade</th>
                    <th>Email</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>PrimeiroNome</td>
                    <td>Idade</td>
                    <td>Email@example.com</td>
                    <td>
                        <button>Editar</button>
                        <button>Visualizar</button>
                        <button>Excluir</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <p><a href="novo_agend.jsp" class="novo-agendamento">Novo Agendamento</a></p>
    </main>

    <footer class="rodape">
        <p>&copy; 2024 Clínica Mente & Vida - Todos os direitos reservados</p>
    </footer>

</body>
</html>
