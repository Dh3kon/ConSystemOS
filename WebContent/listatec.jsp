<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="com.sistema.dao.TecnicoDao"></jsp:useBean>
	<table>
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
				<td><a href="editatec.jsp?idTecnico=${tec.idTecnico}&datan=<fmt:formatDate value="${tec.dataNasc.time}" pattern="dd/MM/yyyy"/>&datad=<fmt:formatDate value="${tec.dataAdmissao.time}" pattern="dd/MM/yyyy"/>">editar</a></td>
				<td><a href="removerTecnico?idTecnico=${tec.idTecnico}">remover</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>