$(document).ready(function () {
  $('#resumes').DataTable({
    "ajax": {
      "url": "http://localhost:8090/resumesJSON",
      "type": "get"
    },
    "columnDefs": [
      {
        'targets': 0,
        'data': 'id'
      },
      {
        'targets': 1,
        'data': 'description'
      },
      {
        'targets': 2,
        'data': 'salary'
      },
      {
        'targets': 3,
        'data': 'employee'
      }
    ]
  });
});