<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Real Estate Management Portal</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap')
	;

* {
	padding: 0%;
	margin: 0%;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background-image:
		url("https://www.uii.ac.id/wp-content/uploads/2019/09/architecturevalues.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card-header {
	text-align: center;
	margin-bottom: 3rem;
	margin-top: 3rem;
	letter-spacing: 0.05em;
	font-size: 20px;
	font-weight: semi-bold;
}

label {
	font-weight: 500;
}

.form-group {
	margin-bottom: 2rem;
	margin-left: 8rem;
}

.btn {
	width: 357px;
	height: 36px;
	background: #D6A756;
	border-radius: 3px;
	border: none;
	cursor: pointer;
	margin-left: 8rem;
}

p {
	margin-top: 1.5rem;
	font-size: 12px;
}

.span {
	text-decoration: none;
	color: #D6A756;
	/* color: #FFFFFF; */
}

.row {
	margin-top: 5rem;
	width: 600px;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(4px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

input {
	border: none;
}

.card {
	margin-bottom: 2.5rem;
}

.form-paragraph {
	margin-left: 8rem;
}
</style>
</head>

<body>
	<img src="" alt="">
	<div class="row ">
		<div class="col-left"></div>
		<div class="col-right">
			<div class="card">
				<div class="card-header">
					<h2 class="card-title">Login</h2>
				</div>
				<div class="card-body">
					<form:form class="form" action="/login" method="post"
						modelAttribute="login">
						<div class="form-group">
							<form:label for="username" path="username" class="sr-only">UserName</form:label>
							<br>
							<form:input type="text" path="username" name="Id" id="Id"
								class="form-control" size="50" placeholder="UserName" />
							<!-- title="Invalid Username.No Special Character or space between characters allowed"
								pattern="^[A-Za-z][A-Za-z0-9_]{7,29}$" -->
						</div>
						<div class="form-group">
							<form:label for="password" path="password" class="sr-only">Password</form:label>
							<br>
							<form:input type="password" size="50" path="password"
								name="password" id="myInput" class="form-control"
								placeholder="password" />
							<br> <input type="checkbox" onclick="myFunction()">Show
							Password
							<script>
								function myFunction() {
									var x = document.getElementById("myInput");
									if (x.type === "password") {
										x.type = "text";
									} else {
										x.type = "password";
									}
								}
							</script>


						</div>
						<form:input type="hidden" path="role" name="role" id="role"
							value="${role}" />
						<br>
						<input name="login" id="login" class="btn btn-primary"
							type="submit" value="Login" />

					</form:form>
					<p class="form-paragraph">
						don't have an account? <a class="span" href="/gotoregister">Sign
							up</a>
					</p>
					<br> <br>
					<p style="color: red; font-size: 16px; text-align: center;"
						id="errorMessage">${message}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container"></div>

</body>

</html>