<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Happy Joes</title>

<c:url var="home" value="/" scope="request" />

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
	<spring:url value="${home}resources/core/css/bootstrap.min.css"	var="bootstrapCss" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

    <spring:url value="/resources/core/js/jquery.1.10.2.min.js"	var="jqueryJs" />
<script src="${jqueryJs}"></script>
</head>

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header" style="background:black; display: flex;">
			<div class="navbar-header-image">
				<a class="navbar-brand" >
					<img src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png"></a>
			</div>
			<div class ="navbar-header-text" style="padding-top: 30px; display: inline-block;">
				<span class="headerTitle" style="color:#fff;font-size:24px;">Good times to be together</span>
			</div>
		</div>
	</div>
</nav>

<div class="container">

	<div class="starter-template" style="text-align: center">
		<img id="image" class="responsive-image " style="height: 461px;width:100%;overflow: scroll">
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
				<div class="col-sm-offset-2 col-sm-10" style="
    width: 100%;
    margin: auto;
    height: 50px;
    background: black;">
					<button style="background: #d24f4f;
    width: 100%;
    height: 30px;
    border: none;
    margin-top: -7px;" type="submit" id="btn-search"
						class="btn btn-primary btn-lg" formaction="${home}checkout">TAP FOR START </button>
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
