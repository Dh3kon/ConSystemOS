<%@page import="com.consystem.dao.FornecedorDao"%>
<%@page import="com.consystem.model.Fornecedor"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Fornecedor</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
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
					<label>Inscrição Estadual</label>
					<input type="text" class="form-control" name="inscEst" value="<%=forn.getInscEst()%>">
				</div>
				<div class="form-group">
					<label>Endereço</label>
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
					<label>País</label>
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