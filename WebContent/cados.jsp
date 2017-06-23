<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Ordem de Servi�o</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Ordem de Servi�o</h2>
			<form action="cadOS" method="post">
				<div class="form-group">
					<label>Descri��o</label>
					<input type="text" class="form-control" name="descricao" placeholder="Descri��o da Ordem de Servi�o">
				</div>
				<div class="form-group">
					<label>Status</label>
					<input type="text" class="form-control" name="status" placeholder="Status da Ordem de Servi�o"><!-- trocar por <select> -->
				</div>
				<div class="form-group">
					<label>Observa��o</label>
					<input type="text" class="form-control" name="observacao" placeholder="Observa��es">
				</div>
				<div class="form-group">
					<label>T�cnico</label>
					<input type="text" class="form-control" name="idTecnico" placeholder=""><!-- ALTERAR -->
				</div>
				<div class="form-group">
					<label>Ve�culo</label>
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