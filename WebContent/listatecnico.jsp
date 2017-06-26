<%@page import="com.consystem.model.Tecnico"%>
<%@page import="java.util.List"%>
<%@page import="com.consystem.dao.TecnicoDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de Técnicos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Lista de Técnicos</h2>
			<jsp:useBean id="dao" class="com.consystem.dao.TecnicoDao"></jsp:useBean>
			<table class="table table-hover">
				<tr>
					<td>Código</td>
					<td>Nome</td>
					<td>Telefone para Contato</td>
					<td>Endereço</td>
					<td>Bairro</td>
					<td>Cidade</td>
					<td>Estado</td>
					<td>Data de Admissão</td>
					<td>Função</td>
				</tr>
				<c:forEach var="tec" items="${dao.lista}">
					<tr>
						<td>${tec.idTecnico}</td>
						<td>${tec.nome}</td>
						<td>${tec.telContato}</td>
						<td>${tec.endereco}</td>
						<td>${tec.bairro}</td>
						<td>${tec.cidade}</td>
						<td>${tec.estado}</td>
						<td><fmt:formatDate value="${tec.dataAdmissao.time}" pattern="dd/MM/yyyy"/></td>
						<td>${tec.funcao}</td>
						<td><a href="editatecnico.jsp?idTecnico=${tec.idTecnico}&datan=<fmt:formatDate value="${tec.dataNasc.time}" pattern="dd/MM/yyyy"/>&datad=<fmt:formatDate value="${tec.dataAdmissao.time}" pattern="dd/MM/yyyy"/>">editar</a></td>
						<td><a href="removerTecnico?idTecnico=${tec.idTecnico}">remover</a></td>
					</tr>
				</c:forEach>
			</table>
			<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>