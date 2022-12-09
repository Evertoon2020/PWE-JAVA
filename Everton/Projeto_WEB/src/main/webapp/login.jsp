<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Lojinha - Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="./assets/loja.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'
	type='text/css'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnEnviar").click(function() {
			var frmData = $("#frmLogin").serialize();
			$.ajax({
				url : "loginServlet",
				data : frmData,
				type : "POST",
				success : function(data) {
					if (data == 1) {
						window.location.href = "./cadastrarProduto";
					} else {
						$('#popup').modal("show");
					}
				}
			});
		});
	});
</script>

<style type="text/css">
.section {
	border-radius: 20px;
	box-shadow: 0px 0px 2px black;
	padding: 20px !important;
}

</style>
</head>
<body>
	<div class="modal fade" id="popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Erro ao realizar Login</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">O usuário não foi localizado</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">Fechar</button>
					<a href="./Register"><button type="button" class="btn btn-primary">Não tem login? Cadastrar-se</button> </a>
				</div>
			</div>
		</div>
	</div>
	
	<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">
              <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
              <p class="text-white-50 mb-5">Por favor entre com seu login e senha!</p>
			<form id="frmLogin">
			
			<div class="form-group">
              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="email">Email</label>
                <input type="email" id="email" class="form-control form-control-lg text-center" placeholder="Digite seu email" name="email" />
              </div>
             </div>
             
			<div class="form-group">
              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="senha">Senha</label>
                <input type="password" id="senha" class="form-control form-control-lg text-center" placeholder="Digite sua senha" name="senha" />
              </div>
             </div>

              <button class="btn btn-outline-light btn-lg px-5" id="btnEnviar" type="button">Login</button>
              </form>
            </div>

            <div>
              <p class="mb-0">Não tem uma conta? <a href="./Register" class="text-white-50 fw-bold">Cadastre-se</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
