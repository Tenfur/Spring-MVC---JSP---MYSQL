<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"crossorigin="anonymous">
        <title>Update User</title>
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
                  <a class="nav-link" href="book.htm">Books</a>
                </li>
              </ul>
            </div>
        </nav>
        <div class = "container mt-4 col-lg-4">
            <div class = "card">
                <div class = "card-header bg-dark">
                    <h4 class = "text-white">Update User Info</h4>
                </div>
                <div class = "card-body">
                    <form method = "POST">
                        <label>Name: </label>
                        <input type ="text" name ="name" class ="form-control" value = "${user[0].name}">
                        <label>Email: </label>
                        <input type ="email" name ="email" class = "form-control" value ="${user[0].email}">
                        <label>Country: </label>
                        <input type = "text" name = "country" class = "form-control" value ="${user[0].country}">
                        <div class = "mt-2">
                            <input type = "submit" value = "Save Changes" class = "btn btn-success">
                            <a href = "users.htm" class = "btn btn-primary">Back</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
