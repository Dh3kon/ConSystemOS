<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Cadastro de Veículos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Cadastro de Veículos - Frota</h2>
			<form action="cadVeiculo" method="post">
				<div class="form-group">
					<label>Modelo</label> <input type="text" class="form-control"
						name="modelo" placeholder="Modelo">
				</div>
				<div class="form-group">
					<label>Marca</label> <input type="text" class="form-control"
						name="marca" placeholder="Marca">
				</div>
				<div class="form-group">
					<label>Placa</label> <input type="text" class="form-control"
						name="placa" placeholder="Placa">
				</div>
				<div class="form-group">
					<label>Ano</label> <input type="text" class="form-control"
						name="ano" placeholder="Ano">
				</div>
				<div class="form-group">
					<label>Status</label> <select class="form-control" name="status">
						<option>Ativo</option>
						<option>Inativo</option>
						<option>Manutenção</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
				<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
				<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
			</form>
		</div>
	</div>
</body>
</html>