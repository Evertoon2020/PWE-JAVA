package controle;

import java.sql.ResultSet;

import Entity.Usuario;
import exception.ConsistirException;
import model.UsuarioModel;

public class UsuarioControle {
	
	private UsuarioModel usuarioModel;
	
	public UsuarioControle() {
		this.usuarioModel = new UsuarioModel();
	}

	public String cadastrar(Usuario usuario) {
		String retorno = "";
		
		try {
			usuarioModel.validarDadosUsuario(usuario);
			
			usuario.save();
			
			ResultSet result = usuario.selectBy("email", usuario.getEmail());
			usuario = usuarioModel.tratarDataSet(result);
			
			String senha = usuario.newPassword();
			usuario.save();
			
			usuarioModel.enviarEmail(usuario.getEmail(), senha);
			retorno = "Usuario Cadastrado Com Sucesso!";
		}
		catch (ConsistirException e) {
			retorno = e.getMensagem(); 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return retorno;
	}
	
}
