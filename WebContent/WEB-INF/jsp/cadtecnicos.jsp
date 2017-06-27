<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Cadastro de Técnicos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Cadastro de Técnicos</h2>
				<form action="cadTecnico" method="post">
					<div class="form-group">
						<label>Nome</label>
						<input type="text" class="form-control" name="nome" placeholder="Nome do Técnico">
					</div>
					<div class="form-group">
						<label>RG</label>
						<input type="text" class="form-control" name="rg" placeholder="RG">
					</div>
					<div class="form-group">
						<label>CPF</label>
						<input type="text" class="form-control" name="cpf" placeholder="CPF">
					</div>
					<div class="form-group">
						<label>Telefone de Contato</label>
						<input type="text" class="form-control" name="telContato" placeholder="Telefone para contato">
					</div>
					<div class="form-group">
						<label>Endereço</label>
						<input type="text" class="form-control" name="endereco" placeholder="ex.: Rua, número">
					</div>
					<div class="form-group">
						<label>Bairro</label>
						<input type="text" class="form-control" name="bairro" placeholder="Bairro">
					</div>
					<div class="form-group">
						<label>Cidade</label>
						<input type="text" class="form-control" name="cidade" placeholder="Cidade">
					</div>
					<div class="form-group">
						<label>Estado</label>
						<input type="text" class="form-control" name="estado" placeholder="ex.: SP, PR, RS">
					</div>
					<div class="form-group">
						<label>Nacionalidade</label>
						<input type="text" class="form-control" name="nacionalidade" placeholder="ex.: Brasileiro(a)">
					</div>
					<div class="form-group">
						<label>Data de Nascimento</label>
						<input type="text" class="form-control" name="dataNasc" placeholder="ex.: ">
					</div>
					<div class="form-group">
						<label>Data de Admissão</label>
						<input type="text" class="form-control" name="dataAdm" placeholder="ex.:">
					</div>
					<div class="form-group">
						<label>Função</label>
						<input type="text" class="form-control" name="funcao" placeholder="Cargo de Técnico">
					</div>
					<div class="form-group">
						<label>Observação</label>
						<input type="text" class="form-control" name="obs" placeholder="Observação">
					</div>
					<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
					<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
					<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
				</form>
		</div>
	</div>

</body>
</html>