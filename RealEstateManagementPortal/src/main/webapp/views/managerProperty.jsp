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
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap')
	;

* {
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	/* 	background-image:
		url("https://www.uii.ac.id/wp-content/uploads/2019/09/architecturevalues.jpeg");
	background-repeat: no-repeat;
	background-size: cover; */
	
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

.row {
	display: flex;
}

.col-left {
	float: left;
	width: 40%;
	height: 100vh;
	left: 0px;
	top: 125px;
	background: #F7F7F7;
	line-height: 2rem;
	display: flex;
	padding-top: 10rem;
	flex-direction: column;
	padding-left: 6rem;
}

.col-right {
	float: right;
	width: 50%;
	display: flex;
	justify-content: flex-start;
	flex-direction: column;
	align-items: center;
	margin-top: 8rem;
	margin-left: 4rem;
}

.col2, .col3, .col4 {
	width: 100%;
}

.col2 .card {
	display: flex;
	margin-left: 0rem;
	padding: 2rem;
}

.col3 .card {
	display: inline-flex;
	flex-direction: column;
	padding: 2rem;
	margin-left: 0rem;
}

.col4 .card {
	display: inline-flex;
	flex-direction: column;
	margin-left: 0rem;
	padding: 2rem;
}

.col2 p {
	padding: 12px 20px;
}

.col2 .card-btn {
	padding: 18px;
	border: none;
}

.col3 p {
	padding: 12px 20px;
}

.col3 .card-btn {
	padding: 8px 15px 8px 15px;
	padding-top: 5px;
	border: none;
}

.col4 p {
	padding: 12px 20px;
}

.col4 .card-btn {
	border: none;
	padding: 8px 15px 8px 15px;
	padding-top: 5px;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin-top: 3rem;
}

th {
	height: 50px;
	background: #EDECEC;
}

th, td {
	padding: 10px;
	text-align: left;
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

.card-header p {
	background: #000000;
	color: #FFFFFF;
	font-weight: normal;
	font-size: 16px;
}

.card-btn {
	background: #D6A756;
	cursor: pointer;
}
</style>
</head>
<body>

	<header class="header">
		<nav class="navbar">
			<div class="container-fluid">
				<a href="/managerPortal" class="navbar-brand"><img
					src="data:image/png;base64,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"
					alt="" width="120px" height="100px"></a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav-list">
						<li class="nav-item"><a href="/managerPortal"
							class="nav-link">Home</a></li>
						<li class="nav-item active"><a href="/managerProperty"
							class="nav-link">Property</a></li>
						<!-- <li class="nav-item"><a href="/customer" class="nav-link">Feature</a></li> -->
						<li class="nav-item">
							<div class="dropdown">
								<button class="dropbtn">
									Feature <i class="fa fa-caret-down"></i>
								</button>
								<div class="dropdown-content">
									<a href="/manager/createProperty">Create Property</a> <a href="/manager/createExecutive">Create
										Executive</a> <a href="/manager/showCustomerDetails">Get Customer Details</a> <a
										href="/manager/assignExecutive">Assign Executive to Customer</a>
								</div>
							</div>
						</li>
						<li class="nav-item"><a href="/login" class="nav-link">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="row">
		<div class="col-left">
			<h3 class="error">${message}</h3>
			<div class="col2">
				<div class="card">
					<div class="card-header">
						<p class="md-0">Get All Properties</p>
					</div>
					<div class="form-group">
						<form action="/manager/getAllProperties">
							<button type="submit" class="card-btn">Get</button>
						</form>
					</div>

				</div>
			</div>

			<div class="col3">
				<div class="card">
					<div class="card-header">
						<p class="md-0">Get Properties By Type</p>
					</div>
					<div class="card-body">
						<form action="/manager/getAllPropertiesByType/{propertyType}"
							class="form">
							<div class="form-group">
								<label for="">Property Type</label> <input name="propertyType"
									class="form-control rounded-0" required>
							</div>
							<button class="card-btn" type="submit">Get</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col4">
				<div class="card">
					<div class="card-header">
						<p class="md-0">Get Properties By Locality</p>
					</div>
					<div class="card-body">
						<form action="/manager/getAllPropertiesByLocality/{locality}"
							class="form">
							<div class="form-group">
								<label for="">Locality</label> <input name="locality"
									class="form-control rounded-0" pattern="[A-Za-z]{3,}" required>
							</div>
							<button type="submit" class="card-btn">Get</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="col-right">
			<h1>Properties</h1>
			<table border="1" class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Property Type</th>
						<th scope="col">Locality</th>
						<th scope="col">Budget</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${properties}" var="item">
						<tr>
							<td>${item.id}</td>
							<td>${item.propertyType}</td>
							<td>${item.locality}</td>
							<td>${item.budget}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>