<%@page import="com.consystem.dao.ProdutoDao"%>
<%@page import="com.consystem.model.Produto"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Produto</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
		<%
			Produto prod = new Produto();
			ProdutoDao dao = new ProdutoDao();
			String id = request.getParameter("idProduto");
			int idProduto = Integer.parseInt(id);
			prod = dao.buscaId(idProduto);
		 %>
	<div class="jumbotron">
		<div class="container">
			<form action="editarProduto" method="post">
			<h2>Editar Produto</h2>
			<form action="cadProduto" method="post">
					<input type="hidden" name="idProduto" value="<%=prod.getIdProduto() %>"/><br>
					<div class="form-group">
						<label>Descrição</label>
						<input type="text" class="form-control" name="descricao" value="<%=prod.getDescricao()%>">
					</div>
					<div class="form-group">
						<label>Marca</label>
						<input type="text" class="form-control" name="marca" value="<%=prod.getMarca() %>">
					</div>
					<div class="form-group">
						<label>Fornecedor</label>
						<input type="text" class="form-control" name="fornecedor" value="<%=prod.getFornecedor() %>"">
					</div>
					<div class="form-group">
						<label>Tipo</label>
						<input type="text" class="form-control" name="tipo" value="<%=prod.getTipo() %>">
					</div>
					<div class="form-group">
						<label>Número de Série</label>
						<input type="text" class="form-control" name="numSerie" value="<%=prod.getNumeroSerie() %>">
					</div>
					<button type="submit" class="btn btn-primary" value="Salvar">Atualizar</button>
					<a class="btn btn-danger" href="listaproduto.jsp" role="button">Voltar</a>
			</form>
		</div>
	</div>
</body>
</html>