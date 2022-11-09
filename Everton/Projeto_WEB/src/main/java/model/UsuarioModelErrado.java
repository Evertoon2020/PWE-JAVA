package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import Entity.Usuario;
import database.DBQuery;

public class UsuarioModelErrado {
	
	private Usuario usuario;
	private DBQuery dbQuery;
	
	public UsuarioModelErrado() {
		dbQuery = new DBQuery();
	}

	public String login(String email, String senha) throws SQLException {
		ResultSet rs = dbQuery.query("SELECT *FROM usuarios where email = '" + email + "';");
		
		while(rs.next()) {
			if(rs != null) {
				usuario = resultToObject(rs);
			}
		}
		
		return validarLogin(senha);
	}
	
	private String validarLogin(String senha) {
		String resposta = "";
		
		if(usuario == null) {
			resposta = "Usuário não cadastrado!";
		}
		else if (!senha.equals(usuario.getSenha())) {
			resposta = "Usuário ou senha inválido!";
		}
		else {
			resposta = "Usuário logado com sucesso!";
		}
		
		return resposta;
	}

	public Usuario resultToObject(ResultSet result) throws SQLException {
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
		
		return usuario;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public DBQuery getDbQuery() {
		return dbQuery;
	}

	public void setDbQuery(DBQuery dbQuery) {
		this.dbQuery = dbQuery;
	}
	
}
