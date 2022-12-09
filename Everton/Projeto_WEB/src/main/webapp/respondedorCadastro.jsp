<%@page import="java.io.PrintWriter"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mail.SendMail"%>
<%@page import="model.Usuario"%>
<%@page import="model.loginModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DBQuery db = new DBQuery();
			
	String email = request.getParameter("email");
	email = (email == null)?"":email;
	
	String senha = request.getParameter("senha");
	senha = (senha == null)?"":senha;
	
	String nome = request.getParameter("nome");
	nome = (nome == null)?"":nome;
	
	String numero = request.getParameter("telefone");
	numero = (numero == null)?"":numero;
	
	String where = "email = '" + email + "'"; 
	
	
	// Upload foto
	String filename = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.ENGLISH).format(new Date());
	filename += ".base64";

	
	filename = filename.replaceAll(":", "-");
	String caminho = "/Users/evert/eclipse-workspace/PWE-JAVA/Everton/Projeto_WEB/src/main/webapp/uploadBase64/res/"+filename ;
	String strFoto = request.getParameter("foto");
	byte[] bytes = strFoto.getBytes();
	Files.write( Paths.get(caminho), bytes);

	Files.readAllBytes(Paths.get(caminho));
	PrintWriter outt = response.getWriter();
	
	//Criar user
	Usuario usuario = new Usuario( 0, email, senha, nome, numero, caminho);
	int res = usuario.save();
	
	if(res == 1){
	
		String corpoEmail = "Sua senha é: " + usuario.getSenha();
			
		
		ResultSet rs = usuario.select(where);	
// 		if(rs.next()){
// 			usuario.enviarEmailComSenha("dev99.oficial@gmail.com", email, corpoEmail, corpoEmail);
// 		}else{
// 			out.print("Deu erro po");
// 		}
	}
	outt.print(res);
	outt.flush();
%>