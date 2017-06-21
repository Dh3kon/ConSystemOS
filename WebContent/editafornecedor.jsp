<%@page import="com.consystem.dao.FornecedorDao"%>
<%@page import="com.consystem.model.Fornecedor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SistemaOS - Editar Fornecedor</title>
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
			<%
				Fornecedor forn = new Fornecedor();
				FornecedorDao dao = new FornecedorDao();
				String id = request.getParameter("idFornecedor");
				int idFornecedor = Integer.parseInt(id);
				forn = dao.buscaId(idFornecedor);
			 %>
			 <form action="editaFornecedor" method="post">
			 	<h2>Editar Fornecedor</h2>
			 	<input type="hidden" name="idFornecedor" value="<%=forn.getIdFornecedor() %>"/><br>
			 	
			 	<div class="form-group">
					<label>Nome</label>
					<input type="text" class="form-control" name="nome" value="<%=forn.getNome()%>">
				</div>
				<div class="form-group">
					<label>CNPJ</label>
					<input type="text" class="form-control" name="cnpj" value="<%=forn.getCnpj()%>">
				</div>
				<div class="form-group">
					<label>Inscri��o Estadual</label>
					<input type="text" class="form-control" name="inscEst" value="<%=forn.getInscEst()%>">
				</div>
				<div class="form-group">
					<label>Endere�o</label>
					<input type="text" class="form-control" name="endereco" value="<%=forn.getEndereco()%>">
				</div>
				<div class="form-group">
					<label>Cidade</label>
					<input type="text" class="form-control" name="cidade" value="<%=forn.getCidade()%>">
				</div>
				<div class="form-group">
					<label>Estado</label>
					<input type="text" class="form-control" name="estado" value="<%=forn.getEstado()%>">
				</div>
				<div class="form-group">
					<label>Pa�s</label>
					<input type="text" class="form-control" name="pais" value="<%=forn.getPais()%>">
				</div>
				<div class="form-group">
					<label>Telefone</label>
					<input type="text" class="form-control" name="telefone" value="<%=forn.getTelefone()%>">
				</div>
				<div class="form-group">
					<label>E-mail</label>
					<input type="text" class="form-control" name="email" value="<%=forn.getEmail()%>">
				</div>
				<div class="form-group">
					<label>Web Site</label>
					<input type="text" class="form-control" name="site" value="<%=forn.getSite()%>">
				</div>
				<input type="submit" class="btn btn-primary" value="Atualizar"/>
				 <a class="btn btn-danger" href="listafornecedor.jsp" role="button">Voltar</a>
			</form>
		</div>
	</div>
</body>
</html>