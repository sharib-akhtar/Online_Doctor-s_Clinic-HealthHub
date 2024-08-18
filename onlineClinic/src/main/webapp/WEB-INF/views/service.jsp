<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Online Doctor Clinic</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">HealthHub</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="index">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Services <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about">About-Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-center mb-4">Our Services</h2>
    <div class="row">
        <!-- Service 1 -->
        <div class="col-md-4">
            <div class="card mb-4">
                <img src="https://cliniquego.com/2016/wp-content/uploads/2022/10/Online_Doctor_why_consult_Telemedicine_Quebec.jpg" class="card-img-top" alt="Service Image 1">
                <div class="card-body">
                    <h5 class="card-title">Telemedicine Consultations</h5>
                    <p class="card-text">Get professional medical advice from licensed doctors through video calls.</p>
                    <a href="userLogin" class="btn btn-primary">Book Now</a>
                </div>
            </div>
        </div>
        
        <!-- Service 2 -->
        <div class="col-md-4">
            <div class="card mb-4">
                <img src="https://www.clipartkey.com/mpngs/m/84-843008_diagnostic-labs-clip-art.png" class="card-img-top" alt="Service Image 2">
                <div class="card-body">
                    <h5 class="card-title">Lab Tests & Reports</h5>
                    <p class="card-text">Order lab tests online and receive digital reports directly in your account.</p>
                    <a href="https://www.netmeds.com/health-packages" class="btn btn-primary">Learn More</a>
                </div>
            </div>
        </div>
        
        <!-- Service 3 -->
        <div class="col-md-4">
            <div class="card mb-4">
                <img src="https://comparisonsmaster.com/wp-content/uploads/2022/02/medication_delivery-768x432.jpg" class="card-img-top" alt="Service Image 3">
                <div class="card-body">
                    <h5 class="card-title">Medication Delivery</h5>
                    <p class="card-text">Get your prescribed medications delivered right to your doorstep.</p>
                    <a href="https://www.netmeds.com/" class="btn btn-primary">Order Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
