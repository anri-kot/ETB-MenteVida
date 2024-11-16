<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A Clínica Mente & Vida oferece serviços especializados para o diagnóstico e tratamento de transtornos mentais.">
        <link rel="stylesheet" href="css/paciente.css">
    </head>
    <body>
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
                <!-- Adicione mais pacientes conforme necessÃ¡rio -->
            </table>

            <p><a href="novoPaciente.jsp" class="novo-Paciente">Novo Paciente</a></p> 
        </main>
    </body>
</html>
