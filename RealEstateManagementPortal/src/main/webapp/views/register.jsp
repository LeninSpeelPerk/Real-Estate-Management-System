<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-image: url("https://wallpaperaccess.com/full/2056415.jpg");
	background-image:
		url("https://www.uii.ac.id/wp-content/uploads/2019/09/architecturevalues.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	display: flex;
	justify-content: center;
	align-items: center;
	line-height: 10rem;
}

.card-header {
	text-align: center;
	margin-bottom: 1rem;
	letter-spacing: 0.05em;
	font-size: 20px;
	font-weight: semi-bold;
}

.form {
	margin-left: 7.5rem;
	line-height: 1.5rem;
}

label {
	font-weight: 500;
}

.form-group {
	margin-bottom: 2rem;
}

.btn {
	width: 357px;
	height: 36px;
	background: #D6A756;
	border-radius: 3px;
	border: none;
	cursor: pointer;
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
	width: 600px;
}

input{
	border: none;
}

.card {
	margin-bottom: 2.5rem;
}
</style>

</head>

<body>
	<div class="row ">
		<div class="col-right">
			<div class="card">
				<div class="card-header">
					<h2 class="card-title">Register</h2>
				</div>
				<div class="card-body">
					<form class="form">
						<div class="form-group">
							<label for="">User Name</label> <br> <input name="username"
								class="form-control" size="50" required>
						</div>

						<div class="form-group">
							<label for="">Password</label> <br> <input type="password"
								name="password" size="50" class="form-control rounded-0"
								required>
						</div>

						<div class="form-group">
							<label for="">Role</label> <select class="form-select"
								aria-label="Default select example" name="selRole1" required>
								<option value="Manager">Manager</option>
								<option value="Executive">Executive</option>
								<option value="Customer">Customer</option>
							</select>
						</div>

						<button type="submit" class="btn">
							Register
						</button>

						<p>
							Already have an account? <a class="span" href="/user">Log in</a>
						</p>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>

</html>