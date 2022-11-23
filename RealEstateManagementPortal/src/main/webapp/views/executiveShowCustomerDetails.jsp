<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Real Estate Management Portal</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background-image:
		url("https://www.uii.ac.id/wp-content/uploads/2019/09/architecturevalues.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}

.navbar {
	position: absolute;
	width: 100%;
	height: 100px;
	left: 0px;
	top: 0px;
	background: #0D0D0D;
}

.navbar-brand {
	position: absolute;
	width: 200px;
	height: 100px;
	left: 100px;
	top: 0px;
}

.collapse {
	position: absolute;
	width: 530px;
	height: 28px;
	left: 900px;
	top: 40px;
}

.navbar-nav-list {
	display: flex;
	justify-content: space-between;
}

.nav-item a {
	text-decoration: none;
	color: white;
	font-size: 15px
}

.nav-item a:hover {
	color: #D6A756;
}

.active a {
	color: #D6A756;
}

.active a:hover {
	color: #FFFFFF;
}
/* dropdown */
.dropdown {
	float: left;
	overflow: hidden;
	margin-top: -12px;
}

/* Dropdown button */
.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	/* Important for vertical align on mobile phones */
	margin: 0; /* Important for vertical align on mobile phones */
}

/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
	color: #D6A756;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
	background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

.row {
	display: flex;
	justify-content: space-around;
	margin-right: 15rem;
	margin-top: 10rem;
}


.card {
	width: 550px;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(4px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	line-height: 50px;
}

.card-header {
	text-align: center;
	margin-bottom: 1rem;
	letter-spacing: 0.05em;
	font-size: 20px;
	font-weight: semi-bold;
	margin-top: 2rem;
}

.form {
	line-height: 1.5rem;
	margin-top: 3rem;
	margin-bottom: 3rem;
	margin-left: 9rem;
}

label {
	font-weight: 500;
	margin-right: 1rem;
}

.form-group {
	margin-bottom: 2rem;
	width: 70%;
	display: flex;
	justify-content: space-between;
}

.btn {
	width: 60%;
	height: 36px;
	background: #D6A756;
	border-radius: 3px;
	border: none;
	cursor: pointer;
}

input {
	border: none;
}

.card {
	margin-bottom: 2.5rem;
}

.dropbtn {
	color: #D6A756;
}

.row {
	display: flex;
	justify-content:;
	align-content: center;
	margin-top: 10rem;
}

ul {
	list-style: none;
	margin-left: 1rem;
}

table {
	border-collapse: collapse;
	margin-left: 1rem;
	margin-bottom: 2rem;
	width: 80%;
}

th {
	height: 20px;
}

th, td {
	padding: 5px;
	text-align: left;
}

.message{
	text-align: center;
	color: red;
}
</style>
</head>

<body>
	<header class="header">
		<nav class="navbar">
			<div class="container-fluid">
				<a href="/customerPortal" class="navbar-brand"><img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAA9lBMVEUNDQ0AAADv7OfWp1fYqVfz8Ouae0YAAAQAAAm6lFyXeUeafE1AMxxMOinz7uqzjlDNo1m5lFG9l1pLPCSKcEFZRypGOCbJxcJ4Yj0FAAt1XTivjFOwrqulhk69vLj59vFiYV/i4NtdSzJQT02NjIjPzsopIRR1dXNaWFgODA+0srAxMC/dr2DgrlpEREOBgH+fnps2LySHbkhmVDStj18jHxZYRTMWExKVe08uKBwuKSN5YjwiGBBmUjR/ZjnHnVcUEAqIc0pNRDY2NTQgIB+lo596eHVrXERAOippXj1gVj8tLSIbHBIzKRp4ZkgSCAReUUOCalAB/kVFAAAHTUlEQVR4nO2cCVvaShSGOQnppC6IS4EisglqFNy4irhBXUr1XrH3//+Ze85MEkDp095WQeL3Pn0kyUzieXMmswA1FgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgPeLN+kAXh2iSUfwyqiDQ3fSMbwq1Kh9iHISXZqt16NsqB6W6rYdYUPVsO24HY+uoVuus6A2jOiIIYa2MVReJB37hvQXbXCjnXRAL86A4UeaWT76FjnFYcP5udnI9Tg/MoxOKkcbenQcGcWRhm5zYTEyrXWUIR0n6wvRNVQxd6Yej0fB0NNP2nNDkmlqFAzdx0NRfN5KKRnXhs3Hae5QOzGaT+rOZEQOfcPlE0p9VtM6kXNpJV433WXzMhkfbThLS3TcmnSov4fbWuQVhT8gKLb9oeHKp+l8d+O0JhLBkEeNetQMVco3bJrutBG5HLKhrQ0zPbfJu9ko5tA3PIv9RUcUYcNs5vMqrW1ko9tK349h9Ftp9A3RSqeO92d4BsOpA4YRNIz8aPEODKPfSiNseDZouEQzKf1uoh0lQ3eN1s7lOVy4aCxeLKxcrpbntOEqLc9EwXAl215NipFt1+M2pzIer9f0+6ftbPZk2g1tu23X2Sset0fAqnY7mZn9RO50OXrsp2he51DkWISpGWz/VY7FNfV4cjXTIqW86fmmhksbl0s1savXku3FtZmzRjn1cM7ebC4/OucPqXIjs/JhtZ1kWbatLa0c0JQkUpGbXaxxzMmFmcxyyyNGuS6nKPyiCW8pfYi4cms5u7LalhPaZ94USLo096FWT65eHrMaa/z8kyVPTEktn621a7W11Bt3VLT8MbnWaNH/7jo81yU6aqy1l8pv2VFdfTmck9T97vmuoo2zw6sXDepFObrhJ+4Pr8GN9ujoRaJ5DaaouwcAAAAAeB/Iqo+GNoLt4b3hKtRnRMFQuS54sjtOKJ9OV3clps1qOr3vh1lJp/3DjOKCdFGqFHmrogPevU2XLKtUSu9f8/4NH6/uSIHSm0Trco6hyqfKbzHkKzc03jkvWU6isC7hVwoJJ+8blpxEIlEIfAuJhGNxXLRZSBS2pe5eweEaFh93Cpuk6xf2tPoeX4UNi3yOjxSYCwqO42yNN4vEqfANHcs3pPWCxTilwFB2ciSG5vVUHxEsK+Fwjf3gXMrzVkUMgxqOMeyfYJXegCEHbPG/gmmm2lB2QsM9PuJsVyqVvNQqEm0V/MBJal77hrltTdEYJrZzue1S/7ITNSwlLEvSsj9gKG0vMLzlsrTuNbgmpyy8imRfUq8NS/2uRZfvyralb8kEDJnQkHY5zLz8qA4YWoVKaJjjqre6atrcB9045XXflAwaDt9HTqI8uWM2dPaKzG1oyGHywyNB6f7RN7QsLzDMB/mlbd+ISxJ8P6jKp24FhutbTPFm6D6WJpJDqyDIs2cMOUxnRyeqEhiW5Fi+6PQNK4OGuo5zQ00WtfS4UgguK8LmPlaKm5u5yTyHIdqQdnQ+JEjTTLXhrijknhkG7VUnb1OnMh8amsYdGFoO38UJ9aXyu/s51A8kd/jk6LT4hmIl/euPcignbcuufsoGRou+YaD8dfyGzld5YILnUNKRqObTef2EhoY3jknzyOdQ905cSQaFm8Cw1Nxhrpv9+ygpdMbbz4zoS2nH8W+/vKRDQ57zhIbP+lL/OptO0LBH9aU8WmyHQ9DYDfvjIe05wWxEhGKBoRkln42HnG/TXm/9HFeeGobj4bo/EZi4oaQlnxNK5qEJDNfD2Zue0+Qqe8GcJnAyE5pw71ZfJbc1MCPQmZ7wrE33++be7/ePSP8nbcwY7gT9SELmpU1zIdOPmI5y1LxUG+47puWP05DjCNYWDvvoZYM/l9nlTYeXdvyiA1cSby6oKz6ytvC7Ru5+gmJt6AT4awv9W+iaj497PBxcH1b3OXH8EgbNZVsk60MzFfjKZYPrQ8tfH+rKsr6U6npncH24SQO/Jccbe2NO4pN1+ojF/dMFfLA1vGQf2h25xh++BAAAxJRy5YNg13yWb75fMvAmmWu+nGG+x+AqVxfpHU+RK58h+8feLJ3unf6zHt3uFb94Bwdy8PQmCFp9ursntri7O+Cf9427v/mge8W9pPdP94KLvNPu3cHEov8FvIdj6ikRJXl7U/Vkxy2HMVOPj3vqvkXyv5upey7qnS8pPTJk+BS3fPrGB4WNXrnHIT6eXHCSYp3yfUeifgiK6fBinotbh70Uq6uuzNzc+89daafU0Hej12hOLvxf4KG70eBwOxck4V70ehcq5h63wrmAzq18ESzDSeQcyrHDu5NHSXhGG77tHHqxjSv6Lq303+6VG6PvJHsq1ev6eaFe917ezm80rrhDoe8dPnZ6RUfy0Lr3fGvoW6978La7GvlLUDHpUqW/4U0V7miU/kaRp0xn6n/AEfxtCSn5868cAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4Of8B2Rh8ScuLWsbAAAAAElFTkSuQmCC"
					alt="" width="120px" height="100px"></a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav-list">
						<li class="nav-item"><a href="/customerPortal"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="/customerProperty"
							class="nav-link">Property</a></li>
						<!-- <li class="nav-item"><a href="/customer" class="nav-link">Feature</a></li> -->
						<li class="nav-item active">
							<div class="dropdown">
								<button class="dropbtn">
									Feature <i class="fa fa-caret-down"></i>
								</button>
								<div class="dropdown-content">
									<a href="/showExecutiveProfile">My Profile Details</a> <a
										href="/show/getCustomerDetails">Customer Details</a>
								</div>
							</div>
						</li>
						<li class="nav-item"><a href="/logout" class="nav-link">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="row">
		<div class="col">
			<h3 class="message">${message}</h3>
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Get Customer Details</h3>
				</div>
				<div class="card-body">
					<form action="/executive/getCustomerDetails" class="form">
						<div class="form-group">
							<label for="">Customer Id</label> <input type="number"
								name="custid" class="form-control rounded-0" pattern ="^. [0-9,.]*$" title="Customer Id should contain only numbers"required>
						</div>
						<button type="submit" class="btn btn-primary float-right">Get</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col2">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Customer Details</h3>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b>Name: </b>${customer.name}</li>
					<li class="list-group-item"><b>Address: </b>${customer.address}</li>
					<li class="list-group-item"><b>Email ID: </b>${customer.emailId}</li>
					<li class="list-group-item"><b>Contact No: </b>${customer.contactNumber}</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>