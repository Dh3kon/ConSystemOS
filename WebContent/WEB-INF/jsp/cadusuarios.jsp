<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Cadastro de Usuários</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<jsp:useBean id="dao" class="com.consystem.dao.TecnicoDao"></jsp:useBean>
	<div class="jumbotron">
		<div class="container">
			<h2>Cadastro de Usuários</h2>
			<form action="cadUsuario" method="post">
				<div class="form-group">
					<label>Login</label>
					<input type="text" class="form-control" name="login" placeholder="Login">
				</div>
				<div class="form-group">
					<label>Senha</label>
					<input type="text" class="form-control" name="senha" placeholder="Senha">
				</div>
				<div class="form-group">
					<label>Nome do Técnico</label>
					<select class="form-control" name="idTecnico">
						<option>Selecione...</option>
						<c:forEach var="tec" items="${dao.lista}">
							<option>${tec.nome}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>Tipo</label>
					<select class="form-control" name="tipo">
						<option>ADM</option>
						<option>FIN</option>
						<option>TEC</option>
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