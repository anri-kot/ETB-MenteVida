<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A Clínica Mente & Vida oferece serviÃ§os especializados para o diagnóstico e tratamento de transtornos mentais.">
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

    <h2>Cadastrar Prescrições</h2>  

    <form id="form-prescricao" action="CadastrarPrescricao" method="POST">
        <label for="consulta">Consulta:</label>
        <input type="number" id="consulta" name="consulta" placeholder="Entre com o id da consulta" required></input>
        
        <label for="data_prescricao">Data da Prescrição:</label>
        <input type="date" id="data_prescricao" name="data_prescricao" required>

        <label for="medicamentos">Medicamento:</label>
        <input type="text" id="medicamentos" name="medicamentos" maxlength="200" placeholder="Entre com o medicamento" required>

        <label for="dosagem">Dosagem:</label>
        <input type="text" id="dosagem" name="dosagem" maxlength="200" placeholder="Entre com a dosagem" required>

        <label for="comentario">Instruções:</label>
        <textarea id="comentario" name="comentario" maxlength="500" rows="8" placeholder="Comentário"></textarea>
        
        <button type="submit" class="btn">Efetuar Registro</button>
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
