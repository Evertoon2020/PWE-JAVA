<%@page import="controle.LoginControle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");

	LoginControle login = new LoginControle();
	String reposta = login.login(email, senha);
	
	out.print(reposta);	
%>