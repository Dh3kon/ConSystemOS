<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Ordem de Serviço</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Ordem de Serviço</h2>
			<form action="cadOS" method="post">
				<div class="form-group">
					<label>Descrição</label>
					<input type="text" class="form-control" name="descricao" placeholder="Descrição da Ordem de Serviço">
				</div>
				<div class="form-group">
					<label>Status</label>
					<input type="text" class="form-control" name="status" placeholder="Status da Ordem de Serviço"><!-- trocar por <select> -->
				</div>
				<div class="form-group">
					<label>Observação</label>
					<input type="text" class="form-control" name="observacao" placeholder="Observações">
				</div>
				<div class="form-group">
					<label>Técnico</label>
					<input type="text" class="form-control" name="idTecnico" placeholder=""><!-- ALTERAR -->
				</div>
				<div class="form-group">
					<label>Veículo</label>
					<input type="text" class="form-control" name="idVeiculo" placeholder=""><!-- ALTERAR -->
				</div>
				<div class="form-group">
					<label>Cliente</label>
					<input type="Cliente" class="form-control" name="idCliente" placeholder=""><!-- ALTERAR -->
				</div>
				<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
				<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
				<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
			</form>
		</div>
	</div>
	
</body>
</html>