<%@page import="com.consystem.dao.EstoqueDao"%>
<%@page import="com.consystem.model.Estoque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SistemaOS - Editar itens do Estoque</title>
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
						<input type="text" class="form-control" name="idProduto" value="<%=est.getIdProduto() %>">
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