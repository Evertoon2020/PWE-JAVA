package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import Entity.Usuario;
import exception.ConsistirException;
import mail.SendMail;

public class UsuarioModel {
	
	public Usuario tratarDataSet(ResultSet result) throws SQLException {
		Usuario usuario = null;
		
		while (result.next()) {
			usuario = new Usuario();
			
			usuario.setIdUsuario(Integer.parseInt(result.getString(1)));
			usuario.setEmail(result.getString(2));
			usuario.setSenha(result.getString(3));
			usuario.setIdNivelUsuario(Integer.parseInt(result.getString(4)));
			usuario.setNome(result.getString(5));
			usuario.setCpf(result.getString(6));
			usuario.setEndereco(result.getString(7));
			usuario.setBairro(result.getString(8));
			usuario.setCidade(result.getString(9));
			usuario.setUf(result.getString(10));
			usuario.setCep(result.getString(11));
			usuario.setTelefone(result.getString(12));
			usuario.setFoto(result.getString(13));
			usuario.setAtivo(result.getString(14));
		}
		
		return usuario;
	}
	
	public void validarDadosUsuario(Usuario usuario) throws ConsistirException, SQLException {
		ConsistirException mensagemErro = new ConsistirException();
		
		consultarUsuarioPorEmail(usuario, mensagemErro);
		
		String email = usuario.getEmail();
		if(email == null || email.isBlank()) {
			mensagemErro.adicionarMensagem("O campo EMAIL é obrigatório."); 
		}
		
		String nome = usuario.getNome();
		if(nome == null || nome.isBlank()) {
			mensagemErro.adicionarMensagem("O campo NOME é obrigatório.");
		}
		
		String cpf = usuario.getCpf();
		if(cpf == null || cpf.isBlank()) {
			mensagemErro.adicionarMensagem("O campo CPF é obrigatório.");
		}
		
		String telefone = usuario.getTelefone();
		if(telefone == null || telefone.isBlank()) {
			mensagemErro.adicionarMensagem("O campo TELEFONE é obrigatório.");
		}
		
		if(mensagemErro.possuiMensagem()) {
			throw mensagemErro;
		}
	}
	
	public void consultarUsuarioPorEmail(Usuario usuario, ConsistirException consistir) throws SQLException {
		ResultSet result = usuario.selectBy("email", usuario.getEmail());
		usuario = tratarDataSet(result);
	
		if(usuario != null) {
			consistir.adicionarMensagem("EMAIL já cadastrado.");
		}
	}
	
	public void enviarEmail(String emailTo, String senha) {
		SendMail email = new SendMail("smtp.mail.yahoo.com", "587", "amandao.ifsp@yahoo.com", "wtcbjpaggdooragr", "TLS");
		email.send("amandao.ifsp@yahoo.com", emailTo, "SENHA", senha);
	}
	
}
