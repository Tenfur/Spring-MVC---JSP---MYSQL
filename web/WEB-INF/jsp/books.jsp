<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"crossorigin="anonymous">
        <!--<link href = "<c:url value ="resources/styles/main.css" />" rel ="stylesheet" />-->
        <title>Books</title>
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
            <h1>Books</h1>
            <div>
                <div class = "card-header text-white">
                    <a href = "addBook.htm" class = "btn btn-dark">New Book</a>
                </div>
                <div class = "row">
                    <c:forEach var="data" items ="${list}">
                        <div class=" col mr-1 mt-5" style="width: 18rem;">
                            <img class="w-100 img-fluid" style ="height: 350px;" src="${data.imageUrl}" alt="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title">${data.name}</h5>
                              <p class="card-text">${data.description}</p>
                              <p class ="card-text">Category: ${data.nameCategory}</p>
                              <p class ="card-text">Price: S/. ${data.price}</p>
                              <p class ="card-text">Owner: ${data.nameUser} - ${data.email}</p>
                              <a href ="updateBook.htm?id=${data.id}" class = "btn btn-block btn-success">Edit</a>
                              <a href ="deleteBook.htm?id=${data.id}" class = "btn btn-block btn-danger">Delete</a>
                            </div>
                         </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
