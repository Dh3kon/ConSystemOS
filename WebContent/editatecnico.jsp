<%@page import="com.consystem.dao.TecnicoDao"%>
<%@page import="com.consystem.model.Tecnico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SistemaOS - Editar Técnico</title>
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
				Tecnico tec = new Tecnico();
				TecnicoDao dao = new TecnicoDao();
				String id = request.getParameter("idTecnico");
				int idTecnico = Integer.parseInt(id);
				tec = dao.buscaId(idTecnico);
				String datan = request.getParameter("datan");
				String datad = request.getParameter("datad");
			 %>
			 <form action="editarTecnico" method="post">
				<h2>Editar Técnico</h2>
				<input type="hidden" name="idTecnico" value="<%=tec.getIdTecnico() %>"/>
			 	<div class="form-group">
								<label>Nome</label>
								<input type="text" class="form-control" name="nome" value="<%=tec.getNome() %>">
							</div>
							<div class="form-group">
								<label>RG</label>
								<input type="text" class="form-control" name="rg" value="<%=tec.getRg() %>">
							</div>
							<div class="form-group">
								<label>CPF</label>
								<input type="text" class="form-control" name="cpf" value="<%=tec.getCpf() %>">
							</div>
							<div class="form-group">
								<label>Telefone de Contato</label>
								<input type="text" class="form-control" name="telContato" value="<%=tec.getTelContato() %>">
							</div>
							<div class="form-group">
								<label>Endereço</label>
								<input type="text" class="form-control" name="endereco" value="<%=tec.getEndereco() %>">
							</div>
							<div class="form-group">
								<label>Bairro</label>
								<input type="text" class="form-control" name="bairro" value="<%=tec.getBairro() %>">
							</div>
							<div class="form-group">
								<label>Cidade</label>
								<input type="text" class="form-control" name="cidade" value="<%=tec.getCidade() %>">
							</div>
							<div class="form-group">
								<label>Estado</label>
								<input type="text" class="form-control" name="estado" value="<%=tec.getEstado() %>">
							</div>
							<div class="form-group">
								<label>Nacionalidade</label>
								<input type="text" class="form-control" name="nacionalidade" value="<%=tec.getNacionalidade() %>">
							</div>
							<div class="form-group">
								<label>Data de Nascimento</label>
								<input type="text" class="form-control" name="dataNasc" value="<%=datan %>">
							</div>
							<div class="form-group">
								<label>Data de Admissão</label>
								<input type="text" class="form-control" name="dataAdm" value="<%=datad %>">
							</div>
							<div class="form-group">
								<label>Função</label>
								<input type="text" class="form-control" name="funcao" value="<%=tec.getFuncao() %>">
							</div>
							<div class="form-group">
								<label>Observação</label>
								<input type="text" class="form-control" name="obs" value="<%=tec.getObs() %>">
							</div>
				<button type="submit" class="btn btn-primary" value="Salvar">Atualizar</button>
				<a class="btn btn-danger" href="listatecnico.jsp" role="button">Voltar</a>
			 </form>
		</div>
	</div>
	  <br><hr>
	 <form action="cadastros.html">
		<input type="submit" value="Voltar"/>
	</form>
</body>
</html>