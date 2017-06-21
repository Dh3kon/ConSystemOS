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
	<section id="menu">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><a href="home.html">Home<span
										class="sr-only">(current)</span></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Cadastrar <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="cadusuarios.html">Usuário</a></li>
										<li><a href="cadveiculos.html">Veículo</a></li>
										<li><a href="cadtecnicos.html">Técnico</a></li>
										<li><a href="cadprodutos.html">Produto</a></li>
										<li><a href="cadequipamento.html">Equipamento</a></li>
										<li><a href="cadservico.html">Serviço</a></li>
										<li><a href="cadestoque.html">Estoque</a></li>
										<li><a href="cadfornecedor.html">Fornecedor</a></li>
										<li><a href="cados.html">Ordem de Serviço</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Listar <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="listausuario.jsp">Usuário</a></li>
										<li><a href="listaveiculo.jsp">Veículo</a></li>
										<li><a href="listatecnico.jsp">Técnico</a></li>
										<li><a href="listaproduto.jsp">Produto</a></li>
										<li><a href="listaequipamento.jsp">Equipamento</a></li>
										<li><a href="listaservico.jsp">Serviço</a></li>
										<li><a href="listaestoque.jsp">Estoque</a></li>
										<li><a href="listafornecedor.jsp">Fornecedor</a></li>
										<li><a href="listaos.jsp">Ordem de Serviço</a></li>
									</ul></li>
								<li class=""><a href="relatorios.html">Relatórios<span
										class="sr-only">(current)</span></a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Usuário <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="index.html">Logout</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</section>
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
			<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>