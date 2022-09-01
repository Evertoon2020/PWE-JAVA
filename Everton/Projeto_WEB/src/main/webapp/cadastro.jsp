<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Lojinha - Cadastro</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  
			//CODIGO JAVA
  
  </script>
  </head>
<body>

<div class="container">
<div class="row mt-3 ml-2 mr-2">

<div class="col mt-3 mb-3">
<h1 class="text-center mb-3">Cadastro de Usuário</h1>

<form>
<div class="form-group">
      <label for="nome">Nome</label>
      <input type="text" class="form-control col " id="nome" placeholder="Usuário Genérico Exemplo" name="nome" required >
    </div>
  <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control col " id="email" placeholder="usuario@email.com" name="email" required >
    </div>
    <div class="form-group">
      <label for="cpf">CPF</label>
      <input type="text" class="form-control col " id="cpf" placeholder="123.456.789-00" name="cpf" required >
    </div>
    <div class="form-group">
      <label for="nivelUsuario">Email</label>
      <select multiple class="form-control" id="nivelUsuario">
      <option>1</option>
      <option>2</option>
      <option>3</option>
    </select>
      
    </div>
</form>
</div>

</div>
</div>

</body>
</html>