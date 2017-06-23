<%@page import="com.consystem.model.Veiculo"%>
<%@page import="com.consystem.dao.VeiculoDao"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de Veículos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Lista de Veículos</h2>
			<table class="table table-hover" >
				<tr>
					<td>ID</td>
					<td>Modelo</td>
					<td>Marca</td>
					<td>Placa</td>
					<td>Ano</td>
					<td>Status</td>
					<td></td>
					<td></td>
				</tr>
				<%
					VeiculoDao dao = new VeiculoDao();
					List<Veiculo> lista = dao.getListarVeiculo();
					for (Veiculo vel : lista) {
				 %>
				 <tr>
				 	<td><%=vel.getIdVeiculo() %></td>
				 	<td><%=vel.getModelo() %></td>
				 	<td><%=vel.getMarca() %></td>
				 	<td><%=vel.getPlaca() %></td>
				 	<td><%=vel.getAno() %></td>
				 	<td><%=vel.getStatus() %></td>
				 	<td><a href="editaveiculo.jsp?idVeiculo=<%=vel.getIdVeiculo() %>">editar</a></td>
				 	<td><a href="removerVeiculo?idVeiculo=<%=vel.getIdVeiculo() %>">remover</a></td>
				 </tr>
				 <% } %>
			</table>
			<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>