<%@page import="com.consystem.dao.EstoqueDao"%>
<%@page import="com.consystem.model.Estoque"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSysten - Editar itens do Estoque</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<%
				Estoque est = new Estoque();
				EstoqueDao dao = new EstoqueDao();
				String id = request.getParameter("idEstoque");
				int idEstoque = Integer.parseInt(id);
				est = dao.buscaId(idEstoque);
			 %>
			 <form action="editaEstoque" method="post">
				<h2>Editar Itens</h2>
			 	<input type="hidden" name="idEstoque" value="<%=est.getIdEstoque() %>"/><br>
			 	<div class="form-group">
						<label>Produto</label>
						<input type="text" class="form-control" name="produto" value="<%=est.getProduto() %>">
					</div>
					<div class="form-group">
						<label>Quantidade</label>
						<input type="text" class="form-control" name="quantidade" value="<%=est.getQuantidade() %>">
					</div>
			 	<input type="submit" class="btn btn-primary" value="Atualizar"/>
				 <a class="btn btn-danger" href="listaestoque.jsp" role="button">Voltar</a>
			 </form>
		</div>
	</div>
</body>
</html>