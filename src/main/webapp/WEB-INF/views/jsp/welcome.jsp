<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Happy Joes</title>

<c:url var="home" value="/" scope="request" />

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"	var="bootstrapCss" />
 <spring:url value="/resources/core/css/main.css"	var="coreCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

    <spring:url value="/resources/core/js/jquery.1.10.2.min.js"
	var="jqueryJs" />
<script src="${jqueryJs}"></script>
</head>

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" >
				<img src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png"></a>
                <span class="headerTitle">Good times to be together</span>
		</div>
	</div>
</nav>

<div class="container" style="min-height: 500px">

	<div class="starter-template">
		<img id="image">
		<br>

		<div id="feedback"></div>
		<form class="form-horizontal" id="search-form">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="btn-search"
						class="btn btn-primary btn-lg" formaction="${home}:q">TAP FOR START </button>
				</div>
			</div>
		</form>

	</div>

</div>

<div class="container">
	<footer>
		<p>
			&copy; <a href="http://www.juke.com">Juke Slot</a> 2019
		</p>
	</footer>
</div>

<script>
	jQuery(document).ready(function($) {
		searchViaAjax();



	});

	function searchViaAjax() {
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${home}template/site/configuration",
			dataType : 'json',
			timeout : 100000,
			success : function(data) {

				console.log("SUCCESS: ", data.data.image);
			 document.getElementById("image").setAttribute("src" ,data.data.image);
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
