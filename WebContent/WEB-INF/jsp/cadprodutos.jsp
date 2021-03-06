<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Cadastro de Produtos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<jsp:useBean id="dao" class="com.consystem.dao.FornecedorDao"></jsp:useBean>
	<div class="jumbotron">
		<div class="container">
			<h2>Cadastro de Produtos</h2>
				<form action="cadProduto" method="post">
					<div class="form-group">
						<label>Descri��o</label>
						<input type="text" class="form-control" name="descricao" placeholder="Nome do Produto">
					</div>
					<div class="form-group">
						<label>Marca</label>
						<input type="text" class="form-control" name="marca" placeholder="Marca do Produto">
					</div>
					<div class="form-group">
						<label>Fornecedor</label>
						<select class="form-control" name="fornecedor">
							<option>Selecione...</option>
							<c:forEach var="forn" items="${dao.listarFornecedor}">
								<option>${forn.nome}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>Tipo</label>
						<input type="text" class="form-control" name="tipo" placeholder="Tipo do Produto">
					</div>
					<div class="form-group">
						<label>N�mero de S�rie</label>
						<input type="text" class="form-control" name="numSerie" placeholder="N�mero de S�rie do Produto">
					</div>
					<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
					<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
					<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
				</form>
		</div>
	</div>
</body>
</html>