<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
</head>
<body>
    <table class="table table-light">
        <thead>
            <tr>
                <th>No</th>
                <th>Userid</th>
                <th>Nama</th>
                <th>Terdaftar Pada</th>
                <th>Opsi</th>
            </tr>
        </thead>
        <tbody>
            @php
            $key = 1
            @endphp
            @foreach ($user as $item)
                <tr>
                    <td>{{$key++}}</td>
                    <td>{{$item->userid}}</td>
                    <td>{{$item->nama}}</td>
                    <td>{{$item->terdaftar_pada}}</td>
                    <td>
                    <a href="user/delete/{{$item->userid}}">Hapus</a>
                        <a href="#">Edit</a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>