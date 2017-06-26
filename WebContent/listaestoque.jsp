<%@page import="com.consystem.model.Estoque"%>
<%@page import="com.consystem.dao.EstoqueDao"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de Itens - Estoque</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Lista de Itens do Estoque</h2>
			<table class="table table-hover">
			<tr>
				<td>Código</td>
				<td>Produto</td>
				<td>Quantidade</td>
			</tr>
				<%
					EstoqueDao dao = new EstoqueDao();
					List<Estoque> lista = dao.getListarEstoque();
					for (Estoque est : lista) {
				 %>
				 <tr>
				 	<td><%=est.getIdEstoque() %></td>
				 	<td><%=est.getProduto() %></td>
				 	<td><%=est.getQuantidade() %></td>
				 	<td><a href="editaestoque.jsp?idEstoque=<%=est.getIdEstoque()%>">editar</a></td>
				 	<td><a href="removeEstoque?idEstoque=<%=est.getIdEstoque()%>">remover</a></td>
				 </tr>
				 <% } %>
			</table>
			<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>