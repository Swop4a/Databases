<html>
<head>
	<title>Resumes</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
		  integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
		  integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="/vendors/jquery/css/jquery.dataTables.min.css" media="all">
	<link rel="stylesheet" type="text/css" href="/vendors/jquery/css/dataTables.bootstrap.min.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/common.css" media="all">
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top bg-faded">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand glyphicon glyphicon-home" href="/">
				Online Marketplace
			</a>
		</div>

		<form class="navbar-form navbar-right" method="post" action="/logout">
			<div class="form-group">
				<button type="submit" class="btn btn-success" name="logout">Logout</button>
			</div>
		</form>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Vacancies:</h3>
			</div>
			<div class="panel-body">
				<div class="table table-responsive">
					<div class="panel panel-default" style="margin-top: 20px">
						<div class="panel-heading">
							<div class="row">
								Vacancies
							</div>
						</div>
						<div class="panel-body">
							<table id="resumes" class="table table-striped">
								<thead>
								<tr>
									<th>ID</th>
									<th>Description</th>
									<th>Desire salary</th>
									<th>Employee</th>
								</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="form-group" align="right">
						<a href="/vacancies/addVacancy" class="btn btn-success">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
							New resume
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/vendors/jquery/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="vendors/jquery/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/vendors/jquery/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="/vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/resumes.js"></script>
</body>
</html>