<%@page import="com.consystem.dao.UsuarioDao"%>
<%@page import="com.consystem.model.Usuario"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Usuário</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
	<%
		Usuario user = new Usuario();
		UsuarioDao dao = new UsuarioDao();
		String id = request.getParameter("idUsuario");
		int idUsuario = Integer.parseInt(id);
		user = dao.buscaId(idUsuario);
	 %>
	<div class="jumbotron">
		<div class="container">
			<h2>Editar Usuário</h2>
			 <form action="editaUsuario" method="post">
			 <input type="hidden" class="form-control" name="idUsuario" value="<%=user.getIdUsuario()%>">
			 <div class="form-group">
					<label>Login</label>
					<input type="text" class="form-control" name="login" value="<%=user.getLogin()%>" >
				</div>
				<div class="form-group">
					<label>Senha</label>
					<input type="text" class="form-control" name="senha" value="<%=user.getSenha()%>">
				</div>
				<div class="form-group">
					<label>Nome do Técnico</label>
					<input type="text" class="form-control" name="idTecnico" value="<%=user.getTecnico()%>">
				</div>
				<div class="form-group">
					<label>Tipo</label>
					<select class="form-control" name="tipo">
						<option>ADM</option>
						<option>FIN</option>
						<option>TEC</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary" value="Salvar">Atualizar</button>
				<a class="btn btn-danger" href="listausuario.jsp" role="button">Voltar</a>
			 </form>
		</div>
	</div>
</body>
</html>