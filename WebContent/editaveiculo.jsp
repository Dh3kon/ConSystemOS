<%@page import="com.sistema.dao.VeiculoDao"%>
<%@page import="com.sistema.model.Veiculo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SistemaOS - Editar Ve�culo</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
		Veiculo vel = new Veiculo();
		VeiculoDao dao = new VeiculoDao();
		String id = request.getParameter("idVeiculo");
		int idVeiculo = Integer.parseInt(id);
		vel = dao.buscaId(idVeiculo);
	 %>
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
			<h2>Editar Ve�culo</h2>
			 <form action="editarVeiculo" method="post">
			 <input type="text" class="form-control"
						name="idVeiculo" value="<%=vel.getIdVeiculo() %>">
			 	<div class="form-group">
					<label>Modelo</label> <input type="text" class="form-control"
						name="modelo" value="<%=vel.getModelo() %>">
				</div>
				<div class="form-group">
					<label>Marca</label> <input type="text" class="form-control"
						name="marca" value="<%=vel.getMarca() %>">
				</div>
				<div class="form-group">
					<label>Placa</label> <input type="text" class="form-control"
						name="placa" value="<%=vel.getPlaca() %>">
				</div>
				<div class="form-group">
					<label>Ano</label> <input type="text" class="form-control"
						name="ano" value="<%=vel.getAno() %>">
				</div>
				<div class="form-group">
					<label>Status</label> <select class="form-control" name="status">
						<option>Ativo</option>
						<option>Inativo</option>
						<option>Manuten��o</option>
					</select>
				</div>
			 	<button type="submit" class="btn btn-primary" value="Salvar">Atualizar</button>
			 	<a class="btn btn-danger" href="listaveiculo.jsp" role="button">Voltar</a>
			 </form>
	 	</div>
	 </div>
</body>
</html>