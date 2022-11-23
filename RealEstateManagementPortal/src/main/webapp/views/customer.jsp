<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Real Estate Management Portal</title>
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
</style>
</head>
<body>

	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<header class="header">
		<nav class="navbar">
			<div class="container-fluid">
				<a href="/app" class="navbar-brand"><img
					src="data:image/png;base64,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"
					alt="" width="120px" height="100px"></a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav-list">
						<li class="nav-item active"><a href="/app" class="nav-link">Home</a></li>
						<li class="nav-item"><a href="/property" class="nav-link">Property</a></li>
						<li class="nav-item"><a href="/customer" class="nav-link">Feature</a></li>
						<li class="nav-item"><a href="/login" class="nav-link">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<h3 class="error">${message}</h3>
	<div class="row pt-4">
		<div class="col-md-4 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Add Additional Details</h3>
				</div>
				<div class="card-body">
					<form action="/createCustomer" method="post" class="form">
						<div class="form-group">
							<label for="">Name</label> <input name="name"
								class="form-control rounded-0" pattern="[A-Za-z]{3,}" title="Name should not contain numbers or special characters" required>
						</div>

						<div class="form-group">
							<label for="">Address</label> <input name="address"
								class="form-control rounded-0" pattern="^[^0-9]*[a-zA-Z0-9]*[^0-9]$" title="Format=Door Number, Street name, City Pincode" required>
						</div>

						<div class="form-group">
							<label for="">Email Id</label> <input name="emailId"
								class="form-control rounded-0" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Enter Valid email id" required>
						</div>

						<div class="form-group">
							<label for="">Contact No</label> <input name="contactNumber"
								class="form-control rounded-0" pattern="[789][0-9]{9}" title="Enter Valid Contact Number" required>
						</div>
						
						<button type="submit" class="btn btn-primary float-right">Create</button>
					</form>
				</div>
			</div>
		</div>

		<div class="col-md-4 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Assign Requirements</h3>
				</div>

				<div class="card-body">
					<form action="/assignRequirements" class="form">
						<div class="form-group">
							<label for="">Customer Id</label> <input type="number"
								name="customerId" value="put" class="form-control rounded-0"
								required>
						</div>

						<div class="form-group">
							<label for="">Requirement Id</label> <input type="number"
								name="requirementId" class="form-control rounded-0" value="put"
								required>
						</div>

						<button type="submit" class="btn btn-primary float-right">Assign</button>
					</form>
				</div>

			</div>
		</div>

		<div class="col-md-4 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Get Customer Details</h3>
				</div>
				<div class="card-body">
					<form action="/getCustomerDetails" class="form">
						<div class="form-group">
							<label for="">customer Id</label> <input type="number"
								name="custid" class="form-control rounded-0" required>
						</div>
						<button type="submit" class="btn btn-primary float-right">Get</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="row pt-4">
		<div class="col-md-3 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Get All Customers</h3>
				</div>
				<div class="card-body">
					<form action="/getAllCustomers">
						<button type="submit" class="btn btn-primary float-right">Get</button>
					</form>
				</div>
			</div>
		</div>

		<div class="col-md-3 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Get All Requirements</h3>
				</div>
				<div class="card-body">
					<form action="/customer/getAllRequirements">
						<button type="submit" class="btn btn-primary float-right">Get</button>
					</form>
				</div>
			</div>
		</div>

		<div class="col-md-3 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Get All Properties</h3>
				</div>
				<div class="card-body">
					<form action="/customer/getAllProperties">
						<button type="submit" class="btn btn-primary float-right">Get</button>
					</form>
				</div>
			</div>
		</div>

		<div class="col-md-3 mx auto">
			<div class="card rounded-0">
				<div class="card-header">
					<h3 class="md-0">Customer Details</h3>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b>Name: </b> ${cust.name}</li>
					<li class="list-group-item"><b>Address: </b> ${cust.address}</li>
					<li class="list-group-item"><b>Email Id: </b> ${cust.emailId}</li>
					<li class="list-group-item"><b>Contact Number: </b>${cust.contactNumber}</li>
					<li>
						<ul class="list-group list-group-flush">
							<li><b>Requirements</b></li>
							<c:forEach items="${cust.requirements}" var="item">
								<li class="list-group-item"><b>Id: </b>${item.id}</li>
								<li class="list-group-item"><b>Property Type: </b>${item.propertyType}</li>
								<li class="list-group-item"><b>Locality: </b>${item.locality}</li>
								<li class="list-group-item"><b>Budget: </b>${item.budget}</li>
								<br>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</div>
		</div>

	</div>

	<br>


	<h3>Customers</h3>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Address</th>
					<th scope="col">Email Id</th>
					<th scope="col">Contact Number</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers}" var="customer">
					<tr>
						<td>${customer.id}</td>
						<td>${customer.name}</td>
						<td>${customer.address}</td>
						<td>${customer.emailId}</td>
						<td>${customer.contactNumber}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<br>
	<h3>Requirements</h3>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Property Type</th>
					<th scope="col">Locality</th>
					<th scope="col">Budget</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requirements}" var="requirement">
					<tr>
						<td>${requirement.id}</td>
						<td>${requirement.propertyType}</td>
						<td>${requirement.locality}</td>
						<td>${requirement.budget}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<br>
	<h3>Properties</h3>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Property Type</th>
					<th scope="col">Locality</th>
					<th scope="col">Budget</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${properties}" var="property">
					<tr>
						<td>${property.id}</td>
						<td>${property.propertyType}</td>
						<td>${property.locality}</td>
						<td>${property.budget}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="container"></div>
</body>
</html>