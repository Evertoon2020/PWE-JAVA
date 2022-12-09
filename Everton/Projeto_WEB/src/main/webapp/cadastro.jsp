<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Lojinha - Cadastro</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="./assets/loja.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style type="text/css">


	#btnEnviar{
		width: 300px;
		height: 60px;
	
	}
	#terms{
		height: 150px;
		overflow-y: scroll;
	
	}


	#termsCheck{
		margin-left: 20px;
	
	}
	#imgPreview{
	  	width: 100%;
	  	height: 100%;	
	  	border-radius: 10px;
	  	transition: 0.5s;
	}
	
	#imgPreview:hover{
	  	opacity: 70%;
	}

	#divImg{
		position: relative;
		margin: 0px 0px 0px 100px;
		width: 150px;
	  	height: 150px;
		background-color: white;		
		transition: 0.5s;
		color: gray;
	}
	
	#divImg:hover{
		background-color: #474A51;
		cursor: pointer;
		color: white;
	
	}
	
	.alingI{
		margin: 10px 15px;
	}
	
	select {
		margin-top: 32px;
	
	}
	
	

</style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  
  	$(document).ready(function(){
  		
  		$("#divImg").click(function() {
			$("#inputFile").trigger('click');
		});
  		
  		
  		$("#inputFile").change(function (event) {
  			$('#pImg').css('display', 'none');
  			var file = event.target.files[0];
  			var reader = new FileReader();
  			reader.readAsDataURL( file );
  			reader.onload = function () {
  				var imgBase64 = reader.result;
  				console.log(imgBase64);
  				$("#imgPreview").attr("src",imgBase64);
  				$("#foto").val(imgBase64);
  			};
  			reader.onerror = function ( error ) {
  				console.log('Error: ', error);
  			};
  		});
  		
  		
  		
  		$("#btnEnviar").click(function() {  			
				var frmData = $("#formCadastro").serialize();
				$.ajax({
					url: "respondedorCadastro.jsp",
					data: frmData,
					type: "POST",
					success: function( data ) {
						debugger;
						if(data == 1){
							$('#popup').modal("show");
						}else{
							$('#popupError').modal("show");
						}
					}
				});
		});
  		
  		
  	});  
  
  </script>
</head>

<body>
	<div class="modal fade" id="popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Cadastro efetuado com sucesso!</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        Faça o login com e-mail e senha!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <a href="login.jsp"><button type="button" class="btn btn-primary">Ir para Login</button> </a>
	      </div>
	    </div>
	  </div>
	</div>	
	
	<div class="modal fade" id="popupError" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Tente novamente!</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	Email já cadastrado!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <a href="login.jsp"><button type="button" class="btn btn-primary">Ir para Login</button> </a>
	      </div>
	    </div>
	  </div>
	</div>


	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">
								<h2 class="fw-bold mb-2 text-uppercase">Cadastro</h2>
								<form id="formCadastro">

									<div class="form-group">
										<div class="form-outline form-white mb-4">
											<label class="form-label" for="email">Email</label> <input
												type="email" id="email"
												class="form-control form-control-lg text-center"
												placeholder="Digite seu email" name="email" />
										</div>
									</div>

									<div class="form-group">
										<div class="form-outline form-white mb-4">
											<label class="form-label" for="senha">Senha</label> <input
												type="password" id="senha"
												class="form-control form-control-lg text-center"
												placeholder="Digite sua senha" name="senha" />
										</div>
									</div>

									<div class="form-group">
										<div class="form-outline form-white mb-4">
											<label class="form-label" for="name">Nome</label> 
											<input type="text" id="name" class="form-control form-control-lg text-center"	placeholder="Digite seu nome" name="nome" />
										</div>
									</div>
									
									<div class="form-group">
										<div class="form-outline form-white mb-4">
											<label class="form-label" for="numero">WhatsApp</label> 
											<input type="number" id="telefone" class="form-control form-control-lg text-center"	placeholder="Digite seu WhatsApp" name="telefone" />
										</div>
									</div>
									
									<div id="uploadImg">
									<div id="divImg">
									<img onload="this.style.display = 'block'" onerror="this.style.display = 'none'" id="imgPreview" alt="Carregar Imagem" src=""> 
									<p id="pImg">Insira a imagem de perfil</p>
									</div>
						
									<input type="hidden" id="foto" name="foto" value="">
									<input type="file" id="inputFile" name="inputFile" style="display: none;">
									<br><br>
					<div id="msg"></div>
									</div>
									
									
									<button class="btn btn-outline-light btn-lg px-5" id="btnEnviar" type="button">Cadastrar</button>
								</form>									
							</div>
								<div>
							<p>Possui conta?  <a href="./Login" class="text-white-50 fw-bold">Faça o login</a></p>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>