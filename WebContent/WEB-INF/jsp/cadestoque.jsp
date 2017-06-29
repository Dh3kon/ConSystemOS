<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConSystem - Cadastro de Itens Estoque</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<jsp:useBean id="dao" class="com.consystem.dao.ProdutoDao"></jsp:useBean>
	<jsp:useBean id="daof" class="com.consystem.dao.FornecedorDao"></jsp:useBean>
	<div class="jumbotron">
		<div class="container">
			<h2>Cadastro de Itens de Estoque</h2>
				<form action="cadEstoque" method="post">
					<div class="form-group">
						<label>Produto</label>
						<select class="form-control" name="produto">
							<option>Selecione...</option>
							<c:forEach var="prod" items="${dao.lista}">
								<option>${prod.descricao}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>Quantidade</label>
						<input type="text" name="quantidade" class="form-control" placeholder="Quantidade do item">
					</div>
					<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
					<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
					<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
				</form>
		</div>
	</div>
	
</body>
</html>