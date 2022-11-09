<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnEnviar").click(function() {
				var frmData = $("#frmLogin").serialize();
				$("#msg").html("Enviou:" + frmData);
				$.ajax({
					url : "respondedor.jsp",
					data : frmData,
					type : "POST",
					success : function(data) {
						$("#msg").html($("#msg").html() + "<br>Retornou:" + data);
					}
				});
			});
		});
	</script>
</head>
<body>
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
                <input type="email" id="email" class="form-control form-control-lg text-center" placeholder="Digite seu email" name="email" />
                <label class="form-label" for="email">Email</label>
              </div>
             </div>
             
			<div class="form-group">
              <div class="form-outline form-white mb-4">
                <input type="password" id="senha" class="form-control form-control-lg text-center" placeholder="Digite sua senha" name="senha" />
                <label class="form-label" for="senha">Senha</label>
              </div>
             </div>

              <button class="btn btn-outline-light btn-lg px-5" id="btnEnviar" type="button">Login</button>
              </form>

              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

            <div>
              <p class="mb-0">Não tem uma conta? <a href="#!" class="text-white-50 fw-bold">Cadastre-se</a>
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
