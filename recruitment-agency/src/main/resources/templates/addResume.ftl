<html>
<head>
    <title>New resume</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="/vendors/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="/vendors/bootstrap/css/bootstrap-theme.css" media="all">
    <link rel="stylesheet" type="text/css" href="/css/common.css" media="all">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="form-horizontal" style="margin-top: 20px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>New resume</h4>
                </div>
                <div class="panel-body">
                    <form id="addResume" class="form-horizontal" action="/resumes/confirm" method="post">
                        <div class="form-group">
                            <label for="employee" class="col-md-2 control-label">Employee:</label>
                            <div class="col-md-10">
                                <input type="text" name="employee" id="employee" required="required" placeholder="Your name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="salary" class="col-md-2 control-label">Desire salary:</label>
                            <div class="col-md-10">
                                <input type="number" name="salary" id="salary" placeholder="$$$">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-md-2 control-label">Description:</label>
                            <div class="col-md-10">
                            <textarea cols="60" rows="7" type="text" name="description" id="description"
                                      placeholder="Enter the description of your resume"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-md-10">
                            <button type="submit" class="btn btn-success">Send resume</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>