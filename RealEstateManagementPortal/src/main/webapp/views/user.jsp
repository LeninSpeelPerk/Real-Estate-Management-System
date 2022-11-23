<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Real Estate Management Portal</title>
</head>
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
	background-image: url("https://www.uii.ac.id/wp-content/uploads/2019/09/architecturevalues.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	display: flex;
	justify-content: center;
	align-items: center;
}


.btn {
	width: 300px;
	height: 36px;
	background: #D6A756;
	border-radius: 3px;
	border: none;
	cursor: pointer;
	margin-left: 6.5rem;
	margin-bottom: 2rem;
	margin-top: 2rem;
}

.btn1{
	margin-top: 3rem;
}


.row {
	margin-top: 8rem;
	width: 500px;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(4px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

.btn3{
	margin-bottom: 3rem;
}


</style>
<body>

	<div class="row">
		<form action="/customerlogin" method="get">
			<input class="btn btn1" type="submit" value="Customer Login">
		</form>

		<form action="/executivelogin" method="get">
			<input class="btn btn2" type="submit" value="Executive Login">
		</form>

		<form action="/managerlogin" method="get">
			<input class="btn btn3" type="submit" value="Manager Login">
		</form>
	</div>


</body>
</html>
