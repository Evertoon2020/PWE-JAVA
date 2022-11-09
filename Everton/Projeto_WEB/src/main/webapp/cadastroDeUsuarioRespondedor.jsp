<%@page import="controle.UsuarioControle"%>
<%@page import="Entity.Usuario"%>
<%@page import="controle.LoginControle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String nome = request.getParameter("nome");
	String cpf = request.getParameter("cpf");
	String endereco = request.getParameter("endereco");
	String bairro = request.getParameter("bairro");
	String cidade = request.getParameter("cidade");
	String uf = request.getParameter("uf");
	String cep = request.getParameter("cep");
	String telefone = request.getParameter("telefone");

	Usuario usuario = new Usuario();
	usuario.setEmail(email);
	usuario.setNome(nome);
	usuario.setCpf(cpf);
	usuario.setEndereco(endereco);
	usuario.setBairro(bairro);
	usuario.setCidade(cidade);
	usuario.setUf(uf);
	usuario.setCep(cep);
	usuario.setTelefone(telefone);
	usuario.setIdUsuario(0);
	usuario.setIdNivelUsuario(2);
	usuario.setAtivo("N");
	usuario.setSenha("");
	usuario.setFoto("");
	
	UsuarioControle usuarioControle = new UsuarioControle();
	out.print(usuarioControle.cadastrar(usuario));
%>