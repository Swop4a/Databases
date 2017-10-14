$(document).ready(function () {
    $('#vacancies').DataTable({
        "ajax": {
            "url": "http://localhost:8090/vacanciesJSON",
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
                'data': 'open'
            },
            {
                'targets': 4,
                'data': 'close'
            },
            {
                'targets': 5,
                'data': 'profession'
            },
            {
                'targets': 6,
                'data': 'company'
            }
        ]
    });
});
