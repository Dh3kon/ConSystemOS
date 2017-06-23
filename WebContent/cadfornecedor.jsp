<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Cadastro de Fornecedores</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Cadastro de Fornecedores</h2>
			<form action="cadFornecedor" method="post">
				<div class="form-group">
					<label>Nome</label>
					<input type="text" class="form-control" name="nome" placeholder="Nome do Fornecedor">
				</div>
				<div class="form-group">
					<label>CNPJ</label>
					<input type="text" class="form-control" name="cnpj" placeholder="CNPJ do Fornecedor">
				</div>
				<div class="form-group">
					<label>Inscrição Estadual</label>
					<input type="text" class="form-control" name="inscEst" placeholder="Inscrição Estadual do Fornecedor">
				</div>
				<div class="form-group">
					<label>Endereço</label>
					<input type="text" class="form-control" name="endereco" placeholder="ex.: Rua Um, 1265">
				</div>
				<div class="form-group">
					<label>Cidade</label>
					<input type="text" class="form-control" name="cidade" placeholder="Cidade">
				</div>
				<div class="form-group">
					<label>Estado</label>
					<input type="text" class="form-control" name="estado" placeholder="ex.: SP, PR, RS...">
				</div>
				<div class="form-group">
					<label>País</label>
					<input type="text" class="form-control" name="pais" placeholder="País de Origem">
				</div>
				<div class="form-group">
					<label>Telefone</label>
					<input type="text" class="form-control" name="telefone" placeholder="Telefone">
				</div>
				<div class="form-group">
					<label>E-mail</label>
					<input type="text" class="form-control" name="email" placeholder="ex.: email@gmail.com">
				</div>
				<div class="form-group">
					<label>Web Site</label>
					<input type="text" class="form-control" name="site" placeholder="ex.: www.google.com">
				</div>
				<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
				<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
				<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
			</form>
		</div>
	</div>
</body>
</html>