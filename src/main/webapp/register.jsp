<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <!-- Style Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style global -->
    <link href="styles/global.css" rel="stylesheet">
    <!-- Style index -->
    <link href="styles/index.css" rel="stylesheet">
</head>
<body>
<h2>Registrati!</h2>
<form action="" method="POST">
  <div class="form-row">
  </div>
				<div class="form-floating mb-3">
					<input class="form-control" id="input-nome" name="nome" type="text" placeholder="Nome" style="width: 200px; ">
					<label for="input-nome"></label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="input-cognome" name="cognome" type="text" placeholder="Cognome" style="width: 200px; ">
					<label for="input-cognome"></label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="input-data-nascita" name="dataNascita" type="date" placeholder="Data di nascita" style="width: 200px; ">
					<label for="input-data-nascita"></label>
				</div>
				<div class="mb-3">
					<div class="form-check form-check-inline">
						<input class="form-check-input" id="input-sesso-m" name="sesso" value="M" type="radio">
						<label class="form-check-label" for="input-sesso-m">M</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" id="input-sesso-f" name="sesso" value="F" type="radio">
						<label class="form-check-label" for="input-sesso-f">F</label>
					</div>
				</div>				
				<div class="form-floating mb-3">
					<input class="form-control" id="input-cellulare" name="cellulare" type="text" placeholder="Cellulare" style="width: 200px; ">
					<label for="input-cellulare"></label>
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="input-email" name="email" type="email" placeholder="Email" style="width: 200px; ">
					<label for="input-email"></label>	
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="input-password" name="password" type="password" placeholder="Password" style="width: 200px; ">
					<label for="input-pssword"></label>	
				</div>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="TermsCheck">
      <label class="form-check-label" for="TermsCheck">
        Accetto Termini e Condizioni*
      </label>
    </div>
        <div class="form-check">
      <input class="form-check-input" type="checkbox" id="NewsletterCheck">
      <label class="form-check-label" for="NewsletterCheck">
        Voglio iscrivermi alla newsletter
      </label>
    </div>
  <br>
  <button type="submit" class="btn btn-primary">Registrati</button>
</form>
<br>
    <p>Hai già un account? <a href="login.html">Accedi</a></p>

    <script src="js/script.js"></script>
</body>
</html>
</html>