<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sample</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
		  integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
		  integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

</head>
<body>
<div class="container" style="margin-top: 90px">
	<h1>Recruitment agency</h1>

	<div class="alert alert-success">Saratov State University database task #8</div>

	<div class="row col-md-6 ">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"> Login</h3>
			</div>
			<div class="panel-body">
				<form action="/login_check" method="post">
					<div class="form-group">
						<input type="text" name="username" class="form-control" required="required" placeholder="Login">
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control" required="required"
							   placeholder="Password">
					</div>
					<div class="well">
						Try one of the following logins
						<ul>
							<li>company & qwerty</li>
							<li>customer & qwerty</li>
						</ul>
					</div>
					<button type="submit" class="btn btn-default">Sign in</button>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Description:</h3>
			</div>
			<div class="panel-body">
				<ul>
					<li>
						If you choose the company account, you will be redirected to page with resumes by customers.
						You can see the list of resumes and create new vacancy.
					</li>
					<li>
						If you choose another one, you will see the list of vacancies by companies. You could create new
						resume.
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>