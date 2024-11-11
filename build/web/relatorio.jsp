<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Gerenciamento de Relatórios da Clínica Mente & Vida.">
    <title>Relatórios - Clínica Mente & Vida</title>
    <link rel="stylesheet" href="css/relatorio.css">
</head>
<body>

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
                <li><a href="relatorio.html" class="active">Relatórios</a></li>
                <li><a href="perfil.html">Perfil</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Relatórios Registrados</h2>

       
        <table width="100%" border="1">
            <tr>
                <th>Data</th>
                <th>Endereço</th>
                <th>Ações</th>
            </tr>
            <tr>

                <td>Data</td> 
                <td>Endereço</td>
                <td>

                    <button>Editar</button>
                    <button>Visualizar</button>
                    <button>Excluir</button>
                </td>
            </tr>
            
        </table>
        <!-- Botão para adicionar um novo relatório, agora abaixo da tabela -->
        <p><a href="NovoRelatorio.html" class="novo-relatorio">Novo Relatório</a></p>
    </main>

    <footer class="rodape">
        <p>&copy; 2024 Clínica Mente & Vida - Todos os direitos reservados</p>
    </footer>

</body>
</html>
