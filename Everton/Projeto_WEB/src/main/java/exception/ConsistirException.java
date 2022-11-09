package exception;

public class ConsistirException extends Exception {

	private static final long serialVersionUID = 1L;

	private String mensagem;

	public ConsistirException() {
		mensagem = "";
	}

	public void adicionarMensagem(String mensagem) {
		this.mensagem += mensagem.concat("<br>");
	}
	
	public boolean possuiMensagem() {
		boolean bool = false;
		
		if(mensagem != null && !mensagem.isBlank()) {
			bool = true;
		}
		
		return bool;
	}
	
	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
}
