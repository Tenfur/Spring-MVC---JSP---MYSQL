<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"crossorigin="anonymous">
        <title>Users</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link" href="index.htm">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="users.htm">Users</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="books.htm">Books</a>
                </li>
              </ul>
            </div>
        </nav>
        <div class = "container mt-4">
            <p>Developed by Paolo Cisneros</p>
            <p>This project was created using Spring MVC. Was deployed using an instance of AWS</p>
            <h1>Users</h1>
            <div class = "card">
                <div class = "card-header text-white">
                    <a href = "add.htm" class = "btn btn-dark">New User</a>
                </div>
                <div class = "card-body table-responsive">
                    <div class = "row justify-content-center">
                        <c:forEach var ="data" items ="${list}">
                        <div class="card mr-5 mt-4" style="width: 18rem;">
                            <div class="card-body">
                              <h5 class="card-title">Name: ${data.name}</h5>
                              <p>Email: ${data.email}</p>
                              <p>Country: ${data.country}</p>
                              <p>Number of books: ${data.numberBooks}</p>
                              <a href ="update.htm?id=${data.id}" class = "btn btn-success">Edit</a>
                              <a href ="delete.htm?id=${data.id}" class = "btn btn-danger">Delete</a>
                            </div>
                         </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
