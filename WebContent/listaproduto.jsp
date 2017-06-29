<%@page import="com.consystem.model.Usuario"%>
<%@page import="com.consystem.model.Produto"%>
<%@page import="com.consystem.dao.ProdutoDao"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de Produtos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		Usuario user1 = (Usuario) session.getAttribute("user");
		if (user1.getTipo().equals("TEC")) {
	%>
			<c:import url="menutec.jsp"></c:import>
	<%		
		}
		if (user1.getTipo().equals("ADM")) {
	%>
			<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
	<%
		}	 
	%>
	<div class="jumbotron">
		<div class="container">
			<h2>Lista de Produtos</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Código</th>
						<th>Descrição</th>
						<th>Marca</th>
						<th>Fornecedor</th>
						<th>Tipo</th>
						<th>Número de Série</th>
					</tr>
				</thead>
				<%
					ProdutoDao dao = new ProdutoDao();
					List<Produto> lista = dao.getLista();
					for (Produto prod : lista) {
				%>
				<tr>
					<td><%=prod.getIdProduto() %></td>
					<td><%=prod.getDescricao() %></td>
					<td><%=prod.getMarca() %></td>
					<td><%=prod.getFornecedor() %></td>
					<td><%=prod.getTipo() %></td>
					<td><%=prod.getNumeroSerie() %></td>
					<%
						if (user1.getTipo().equals("ADM")) {
					%>
						<td><a href="editaproduto.jsp?idProduto=<%=prod.getIdProduto()%>">editar</a></td>
					<%
						}
					%>	
					<%
						if (user1.getTipo().equals("ADM")) {
					%>
						<td><a href="removerProduto?idProduto=<%=prod.getIdProduto()%>">remover</a></td>
					<%
						}
					%>	
				</tr>
				<% } %>
			</table>
			<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>