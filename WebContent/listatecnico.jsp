<%@page import="com.consystem.model.Tecnico"%>
<%@page import="java.util.List"%>
<%@page import="com.consystem.dao.TecnicoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de T�cnicos</title>
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
										<li><a href="cadusuarios.html">Usu�rio</a></li>
										<li><a href="cadveiculos.html">Ve�culo</a></li>
										<li><a href="cadtecnicos.html">T�cnico</a></li>
										<li><a href="cadprodutos.html">Produto</a></li>
										<li><a href="cadequipamento.html">Equipamento</a></li>
										<li><a href="cadservico.html">Servi�o</a></li>
										<li><a href="cadestoque.html">Estoque</a></li>
										<li><a href="cadfornecedor.html">Fornecedor</a></li>
										<li><a href="cados.html">Ordem de Servi�o</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Listar <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="listausuario.jsp">Usu�rio</a></li>
										<li><a href="listaveiculo.jsp">Ve�culo</a></li>
										<li><a href="listatecnico.jsp">T�cnico</a></li>
										<li><a href="listaproduto.jsp">Produto</a></li>
										<li><a href="listaequipamento.jsp">Equipamento</a></li>
										<li><a href="listaservico.jsp">Servi�o</a></li>
										<li><a href="listaestoque.jsp">Estoque</a></li>
										<li><a href="listafornecedor.jsp">Fornecedor</a></li>
										<li><a href="listaos.jsp">Ordem de Servi�o</a></li>
									</ul></li>
								<li class=""><a href="relatorios.html">Relat�rios<span
										class="sr-only">(current)</span></a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Usu�rio <span class="caret"></span></a>
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
			<h2>Lista de T�cnicos</h2>
			<jsp:useBean id="dao" class="com.consystem.dao.TecnicoDao"></jsp:useBean>
			<table class="table table-hover">
				<tr>
					<td>C�digo</td>
					<td>Nome</td>
					<td>RG</td>
					<td>CPF</td>
					<td>Telefone para Contato</td>
					<td>Endere�o</td>
					<td>Bairro</td>
					<td>Cidade</td>
					<td>Estado</td>
					<td>Nacionalidade</td>
					<td>Data de Nasc</td>
					<td>Data de Admiss�o</td>
					<td>Fun��o</td>
					<td>Observa��o</td>
				</tr>
				<c:forEach var="tec" items="${dao.lista}">
					<tr>
						<td>${tec.idTecnico}</td>
						<td>${tec.nome}</td>
						<td>${tec.rg }</td>
						<td>${tec.cpf}</td>
						<td>${tec.telContato}</td>
						<td>${tec.endereco}</td>
						<td>${tec.bairro}</td>
						<td>${tec.cidade}</td>
						<td>${tec.estado}</td>
						<td>${tec.nacionalidade}</td>
						<td><fmt:formatDate value="${tec.dataNasc.time}" pattern="dd/MM/yyyy"/></td>
						<td><fmt:formatDate value="${tec.dataAdmissao.time}" pattern="dd/MM/yyyy"/></td>
						<td>${tec.funcao}</td>
						<td>${tec.obs}</td>
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