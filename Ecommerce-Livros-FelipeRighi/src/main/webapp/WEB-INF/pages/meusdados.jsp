<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meus Dados</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .navbar-custom {
            background-color: #343a40; /* Azul escuro */
        }
        .navbar-brand {
            color: white !important; /* Cor branca para o texto da logo */
        }
        .navbar-toggler-icon {
            color: white !important; /* Cor branca para o ícone */
        }
        .dropdown-menu .dropdown-item {
            color: black; /* Cor do texto do dropdown */
        }
        .dropdown-menu .dropdown-item:hover {
            background-color: #878787; /* Cor de fundo do item do dropdown ao passar o mouse */
            color: white; /* Cor do texto do dropdown ao passar o mouse */
        }
        .card {
            margin-top: 20px;
        }
        .nav-link {
            color:white;
        }
        .dropdown-toggle:hover {
            color: #878787; /* Altera a cor do ícone ao passar o mouse */
        }
        .login-container {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="reddashbord">
        <img src="${pageContext.request.contextPath}/static/images/logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
        LivroLumina
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="livrosDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Livros
                </a>
                <div class="dropdown-menu" aria-labelledby="livrosDropdown">
                    <a class="dropdown-item" href="livro?opcao=redaddlivro">Adicionar Livro</a>
                    <a class="dropdown-item" href="livro?opcao=mostrarlivrosavenda">Comprar Livro</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav">

            <li class="nav-item">
                <a class="nav-link corcinza" href="carrinho?opcao=visualizarcarrinho">
                    <i class="fas fa-shopping-cart"></i> <!-- Ícone de carrinho de compras -->
                </a>
            </li>
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user"></i> <!-- Ícone de usuário -->
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="usuario?opcao=redmeusdados">Meus Dados</a>
                    <a class="dropdown-item" href="venda?opcao=mostrarpedidos&&idCliente=<%= session.getAttribute("id") %>">Meus Pedidos</a>
                    <a class="dropdown-item" href="livro?opcao=leitura&&id=<%= session.getAttribute("id") %>">Meus Livros</a>
                    <a class="dropdown-item" href="usuario?opcao=redexcluirconta">Excluir Conta</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logout">Sair</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="login-container mt-5">
    <h4 class="text-center">Meus Dados</h4>
    <c:if test="${not empty retorno}">
        <div class="alert alert-warning mt-3">${retorno}</div>
    </c:if>
    <form action="usuario" method="post">
        <div class="form-group">
            <label for="nome"><b>Nome</b></label>
            <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" value="<%= session.getAttribute("usuario") %>" maxlength="255" required>
        </div>
        <div class="form-group">
            <label for="email"><b>Email</b></label>
            <input type="email" class="form-control" id="email" placeholder="Email" name="email" value="<%= session.getAttribute("email") %>" maxlength="255" required>
        </div>
        <div class="form-group">
            <label for="senha"><b>Senha</b></label>
            <input type="password" class="form-control" id="senha" placeholder="Senha" name="senha" value="<%= session.getAttribute("senha") %>" maxlength="255" required>
        </div>
<!-- Botões -->
        <div class="form-row">
            <div class="form-group col-md-6">
                <a class="btn btn-secondary btn-block" href="reddashbord">Voltar</a>
            </div>
            <div class="form-group col-md-6">
                <input type="hidden" name="opcao" value="editar">
                <input type="hidden" name="id" value="<%= session.getAttribute("id") %>">
                <button type="submit" class="btn btn-success btn-block">Atualizar Dados</button>
            </div>
        </div>
    </form>

</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
