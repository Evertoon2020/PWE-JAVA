package controle;

import model.UsuarioModelErrado;

public class LoginControle {
	
	UsuarioModelErrado usuarioModel;
	
	public LoginControle() {
		this.usuarioModel = new UsuarioModelErrado();
	}
	
	public String login(String email, String senha) {
		String retorno = "";
		
		try {
			retorno = usuarioModel.login(email, senha);
		}
		catch (Exception e) {
			e.printStackTrace();
			retorno = "DEU PAU!";
		}
		
		return retorno;
	}

	public UsuarioModelErrado getUsuarioModel() {
		return usuarioModel;
	}

	public void setUsuarioModel(UsuarioModelErrado usuarioModel) {
		this.usuarioModel = usuarioModel;
	}
	
}
