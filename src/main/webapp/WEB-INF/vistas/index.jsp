
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Con Mi Carta</title>

<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- Google fonts - Popppins for copy-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
<!-- orion icons-->
<link rel="stylesheet" href="css/orionicons.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.green.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">

<link href="https://unpkg.com/bootstrap-table@1.18.2/dist/bootstrap-table.min.css" rel="stylesheet">
<!-- Favicon-->
<link rel="shortcut icon" href="img/favicon.png?3">
<script src="js/bootstrap-table.min.js"></script>

</head>

<body>

	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow ">
			<a href="javascript:void(0)" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"> <i class="fas fa-align-left"></i>
			</a> <a href="<%=request.getContextPath()%>/#/tablero" class="navbar-brand font-weight-bold text-uppercase text-base ">ADMIN - CON MI CARTA</a>

		</nav>
	</header>
	<div class="d-flex align-items-stretch">
		<div id="sidebar" class="sidebar py-3">
			<div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN</div>
			<ul class="sidebar-menu list-unstyled">

				<li class="sidebar-list-item"><a href="#/tablero" class="sidebar-link text-muted menu-item"> <i class="o-survey-1 mr-3 text-gray"></i><span>Tablero</span></a></li>

				<li class="sidebar-list-item"><a href="#/clientes" class="sidebar-link text-muted menu-item" id="menuclientes"> <i
						class="o-survey-1 mr-3 text-gray"></i><span>Clientes</span></a></li>

				<li class="sidebar-list-item"><a href="#/letras" class="sidebar-link text-muted menu-item " id="menuletras"> <i
						class="o-sales-up-1 mr-3 text-gray"></i><span>Letras</span></a></li>

				<li class="sidebar-list-item"><a href="#/planes" class="sidebar-link text-muted menu-item" id="menuplanes"> <i
						class="o-table-content-1 mr-3 text-gray"></i><span>Planes</span></a></li>

				<!--li class="sidebar-list-item"><a href="logout" class="sidebar-link text-muted"><i
                                class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li-->
			</ul>
		</div>
		<div class="page-holder w-100 d-flex flex-wrap">

			<div id="root" class="container-fluid px-xl-2 p-2">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item text-capitalize active" aria-current="page" id="breadcrumb">Home</li>
					</ol>
				</nav>

				<div id="contenedor"></div>
			</div>
			<footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 text-center text-md-left text-primary">
							<p class="mb-2 mb-md-0">Con Mi Carta &copy; 2020-2021</p>
						</div>
						<div class="col-md-6 text-center text-md-right text-gray-400">
							<p class="mb-0">
								Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a>
							</p>
							<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!-- JavaScript files-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js"> </script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<!--script src="js/charts-home.js"></script-->
	<script src="js/front.js"></script>
	<script src="js/utils.js"></script>
	<!-- Latest compiled and minified JavaScript -->

	<script>
		window.addEventListener('hashchange', function() {
			verificarhash(window.location.hash);
		})
		function verificarhash(url) {
			if (url === "/" || url === "") {
				url = "/tablero";
			}
			$("#breadcrumb").text(url.substring(2));
			$(".menu-item").removeClass("active");
			var items = $(".menu-item"); 
			for(const item of items){  
				//console.log($(item).text())
				if($(item).text().trim().toLowerCase() ==  url.substring(2)){
					$(item).addClass("active");
				}
			}
			$("#root #contenedor").load("<%=request.getContextPath()%>/" + url.substring(2));
		}
		$(document).ready(function() {
			verificarhash(window.location.hash);
		})
	</script>
</body>

</html>