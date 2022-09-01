<%@page import="classes.Usuario"%>
<%@page import="database.DBQuery"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	
	// Consultar o BD
	
	Usuario usuario = new Usuario();
	ResultSet rSet = usuario.select(" email='"+email+"' AND senha='"+senha+"'");
	
	if (rSet.next()){
		out.print( "Usuário Existente");	
	}else{
		out.print( "Usuário não cadastrado");
	}
	
	
%>