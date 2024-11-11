<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A Clínica Mente & Vida oferece serviços especializados para o diagnóstico e tratamento de transtornos mentais.">
    <title>Prescrição</title>
    <link rel="stylesheet" href="css/prescricao.css">
    
</head>
<body>
    <header class="topo">
        <img src="img/psc.png" alt="Descrição da imagem" class="clinica-imagem">
        <div>
            <h1>Clínica Mente & Vida</h1>
            <p>Saúde Mental e Bem-Estar</p>
        </div>
        <div class="menu">
            <nav class="navbar">
                <ul>
                    <li><a href="home.html">Home</a></li>
                    <li><a href="paciente.html">Pacientes</a></li>
                    <li><a href="agendamento.html">Agendamentos</a></li>
                    <li><a href="prescricao.html">Prescrições</a></li>
                    <li><a href="relatorio.html">Relatórios</a></li>
                    <li><a href="perfil.html">Perfil</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <h2>Cadastrar Prescrições</h2>  

    <form id="form-prescricao" >
        <label for="data_prescricao">Data da Prescrição:</label>
        <input type="datetime-local" id="data_prescricao" name="data_prescricao" required>

        <label for="medicamentos">Medicamento:</label>
        <input type="text" id="medicamentos" name="medicamentos" placeholder="Entre com o medicamento" required>

        <label for="dosagem">Dosagem:</label>
        <input type="text" id="dosagem" name="dosagem" placeholder="Entre com a dosagem" required>

        <label for="comentario">Instruções:</label>
        <textarea id="comentario" name="comentario" rows="8" placeholder="Comentário" required></textarea>

        <button type="submit" class="btn">Efetuar Registro</button>
    </form>

    <div class="container">
        <a href="home.html" class="botoes" >Home</a>
        <a href="relatorio.html" class="botoes" >Voltar</a>
    </div>

    <footer class="rodape">
        <p>&copy; 2024 Clínica Mente & Vida - Todos os direitos reservados</p>
    </footer>
</body>
</html>
