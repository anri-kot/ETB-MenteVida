<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <p><a href="NovoRelatorio.jsp" class="novo-relatorio">Novo Relatório</a></p>
    </main>

</body>
</html>
