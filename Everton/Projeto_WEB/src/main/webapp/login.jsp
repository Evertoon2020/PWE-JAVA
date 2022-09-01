<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Lojinha - Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  
  	$(document).ready(function() {
		$("#btnEnviar").click(function() {
			var frmData = $("#frmLogin").serialize();
			$("#msg").html("Enviou:" + frmData);
			$.ajax({
				url: "respondedor.jsp",
				data: frmData,
				type: "POST",
				success: function( data ) {
					$("#msg").html( $("#msg").html()+"<br>Retornou:" + data);
				}
			});
		});
	});
  	
  	//
  
  </script>
</head>
<body>

<div class="container">
<div class="row justify-content-around card mt-3 ml-2 mr-2">

<div class="col mt-3 mb-3 text-center">
<h1>LOJINHA DE R$1,99</h1>
</div>

<div class="col mt-3 mb-3">
  <h2>Faça o login para se autenticar</h2>
  <form  id="frmLogin">
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control col " id="email" placeholder="usuario@email.com" name="email" required >
    </div>
    <div class="form-group">
      <label for="senha">Senha</label>
      <input type="password" class="form-control col" id="senha" placeholder="*********" name="senha" required>
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Relembrar
      </label>
    </div>
    <button type="button"  id="btnEnviar"class="btn btn-primary col">Logar</button>
    
  </form>
  <div id="msg"></div>
</div>

</div>
</div>

</body>
</html>
