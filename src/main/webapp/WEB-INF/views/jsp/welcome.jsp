<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Happy Joes</title>

<c:url var="home" value="/" scope="request" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
<spring:url value="/resources/core/js/jquery.1.10.2.min.js"	var="jqueryJs" />
<script src="${jqueryJs}"></script>
</head>
<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<div class="navbar-header-image">
				<a class="navbar-brand" >
					<img src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png"></a>
			</div>
			<div class ="navbar-header-text">
				<span class="headerTitle">Good times to be together</span>
			</div>
		</div>
	</div>
</nav>

<div class="container">

	<div class="starter-template" style="text-align: center">
		<img id="image" class="responsive-image ">
		<div class="imageText" style="position: absolute;
    top: 22%;
    left: 39%;
    color: #fff;">
			<p style="    font-size: 10px;
    margin: 0;">LUNCH WITH AN ICON</p>
			<p style="    font-size: 28px;
    margin: 0;">Try Our Pizzas</p>
		</div>

	</div>
		<form class="form-horizontal" id="search-form">
			<div class="form-group">
				<div class = "buttonContainer">
					<button  type="submit" id="btn-search"
						class="btn btn-primary btn-lg" style="font-size: 40px ; " formaction="${home}checkout">TAP FOR START </button>
				</div>
			</div>
		</form>

	</div>

</div>



<script>
	jQuery(document).ready(function($) {
		searchViaAjax();
	});

	function searchViaAjax() {
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${home}template/homepage",
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
			 console.log("SUCCESS: ", data.data.display_images[0].image);
			 document.getElementById("image").setAttribute("src" ,data.data.display_images[0].image);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
		});

	}

	function enableSearchButton(flag) {
		$("#btn-search").prop("disabled", flag);
	}

	function display(data) {
		var json = "<h4>Ajax Response</h4><pre>"
				+ JSON.stringify(data, null, 4) + "</pre>";
		$('#feedback').html(json);
	}
</script>

</body>
</html>
