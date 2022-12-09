<%
String senha = (String) session.getAttribute("senha");
if (senha == null || senha.isEmpty()) {
	response.sendRedirect("./login.jsp");
}

int id = (int) session.getAttribute("id");
Profile profile = new Profile(id);

String caminho = profile.getCaminho();
String conteudo = "";

Path local = Paths.get(caminho);
try {
	byte[] conteudoBytes = Files.readAllBytes(local);
	conteudo = new String(conteudoBytes);
} catch (Exception e) {
}

if (conteudo == "") {
	conteudo = "./img/logo/icoProfile.png";
}
%>

<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="multitools.Profile"%>
<%@page import="java.nio.file.Files"%>
<%@page import="model.produtoModel"%>
<%@page import="java.util.List"%>

<%@page import="model.produtoModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./assets/loja.png">
<link rel="stylesheet" href="css/bananaStyle.css">

<meta charset="ISO-8859-1">
<title>Lojinha</title>
</head>
<body>
	<nav class="bananaNav">
		<ul>
			<li><img src="<%=conteudo%>" height="50px"></li>
			<li><span style="color: yellow">Lojinha</span></li>
			<li><a href="cadastrarProduto.jsp">Cadastrar Produto</a></li>
			<li><a href="consultarProduto.jsp">Consultar Produto</a></li>
			<li><a href="consultarProduto.jsp">Sair</a></li>
		</ul>
	</nav>
	<main class="bananaMain">
		<form action="alterarProduto" method="post" class="bananaForm">
			<%
			produtoModel produto = null;
			if (request.getAttribute("produto") != null) {
				produto = (produtoModel) request.getAttribute("produto");
			}
			%>
			<input type="hidden" name="id" value="<%out.print(produto.getIdProduto());%>">
			<div>
				<label><strong>Descrição:</strong></label><input type="text"
					name="descricao" value="<%out.print(produto.getDescricao());%>">
			</div>
			<div>
				<label><strong>Quantidade:</strong></label><input type="text"
					name="quantidade" value="<%out.print(produto.getQuantidade());%>">
			</div>
			<div>
				<label><strong>Preço:</strong></label><input type="text"
					name="preco" value="<%out.print(produto.getPreco());%>">
			</div>

			<label><strong>Disponível On-Line:</strong></label><input
				type="checkbox" name="online" value="true"
				<%if (produto.isOnLine()) {
	out.print("checked");
}%>> <br>
			<div>
				<input id="bananaButton" type="submit" name="alterar"
					value="Alterar Produto">
			</div>
			<div>
				<input type="hidden" name="id">
			</div>
			<div>
				<%
				String mensagem = (String) request.getAttribute("mensagem");
				if (mensagem != null)
					out.print(mensagem);
				%>
			</div>
		</form>
	</main>
</body>
</html>