<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Perfil - Clínica Mente & Vida">
  
    <link rel="stylesheet" href="css/perfil.css"> <!-- Link para o arquivo CSS -->
</head>
<body>
    <header class="topo">
        <img src="img/psc.png" alt="Logo da Clínica" class="clinica-imagem">
        <h1>Clínica Mente e Vida</h1>
        <p>Saúde Mental e Bem-Estar</p>

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

    <main>
<h2> Perfil</h2>


<div class="container">
    <div class="profile-image">
        <img src="default-profile.png" alt="Imagem de Perfil" id="profileImagePreview">
        <input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="previewImage(event)">
        <label for="profileImage">Alterar Imagem de Perfil</label>
    </div>

    <form>
        <label for="name">Nome:</label>
        <input type="text" id="name" name="name" required>

        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="position">Cargo:</label>
        <input type="text" id="position" name="position" required>

        <button type="submit">Alterar Dados</button>
    </form>
</div>

<script>
    function previewImage(event) {
        const image = document.getElementById('profileImagePreview');
        image.src = URL.createObjectURL(event.target.files[0]);
    }
</script>

</body>
</html>