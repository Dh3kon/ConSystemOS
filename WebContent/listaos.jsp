<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de Ordens de Serviço</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<h2>Lista de Ordens de Serviço</h2>
			<jsp:useBean id="dao" class="com.consystem.dao.OrdemServicoDao"></jsp:useBean>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>OS</th>
						<th>Data da OS</th>
						<th>Descrição</th>
						<th>Status</th>
						<th>Observação</th>
						<th>Cliente</th>
						<th>Tecnico</th>
						<th>Veiculo</th>
						<th>Data de Finalização</th>
					</tr>
				</thead>
				 <tr>
				 <c:forEach var="os" items="${dao.lista}">
				 	<tr>
				 		<td>${os.os}</td>
					 	<td><fmt:formatDate value="${os.dataOs.time}" pattern="dd/MM/yyyy"/></td>
					 	<td>${os.descricao}</td>
					 	<td>${os.status}</td>
					 	<td>${os.observacao}</td>
					 	<td>${os.idCliente}</td>
					 	<td>${os.idTecnico}</td>
					 	<td>${os.idVeiculo}</td>
					 	<td><fmt:formatDate value="${os.dataFinalizacao.time}" pattern="dd/MM/yyyy"/></td>
					 	<td><a href="editaos.jsp?os=${os.os}&dataos=<fmt:formatDate value="${os.dataOs.time}" pattern="dd/MM/yyyy"/>&dataf=<fmt:formatDate value="${os.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>">editar</a></td>
					 	<td><a href="removerOS?os=${os.os}">remover</a></td>
					 </tr>
				 </c:forEach>
			</table>
			<a class="btn btn-danger" href="homea.jsp" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>