<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mars</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/journal/bootstrap.min.css"/>
    <style>
        @media screen and (max-width: 768px) {
            .search {
                display: none!important;
            }
            .navbar-brand{
            margin-right: 300px!important;
        }
        }

        .container-fluid{
            width: auto!important;
        }

        .navbar-brand{
            margin-right: 100px!important;
        }

        .search{
            margin-right: 100px!important;
        }

        .fa-solid{
            width: 30px;
        }

        .deco{
            z-index: 999;
            position: fixed;
            top: 100px;
        }
        
        main{
        	position: absolute;
        	top: 100px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand fixed-top navbar-light bg-light" id="navi">
        <div class="container-fluid">

                    <a class="navbar-brand" href="#">
                        <img src="${pageContext.request.contextPath}/image/logo.png" width="150">
                    </a>
                    
                    <div class="collapse navbar-collapse" id="navbarColor03">
                        
                        <form class="d-flex search">
                            <input class="form-control me-sm-2" type="text" placeholder="Search">
                        </form>
                        
                        <ul class="navbar-nav align-right me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <i class="fa-solid fa-earth-asia fa-lg"></i>
                                    <span class="visually-hidden">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa-solid fa-walkie-talkie fa-lg"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa-solid fa-square-plus fa-lg"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa-solid fa-rocket fa-lg"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa-solid fa-user-astronaut fa-lg"></i>
                                </a>
                            </li>
                            
                        </ul>
            </div>
        </div>
    </nav>
        
    <main>
        <section>
        