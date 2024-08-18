<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .contact-details,
        .contact-form {
            margin-bottom: 20px;
        }

        .contact-details h2,
        .contact-form h2 {
            color: #0056b3;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            margin: 10px 0;
        }

        a {
            color: #0056b3;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 15px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #003d80;
        }
        .custom{
        padding: 10px 15px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
         .custom:hover {
            background-color: #003d80;
        }
    </style>
</head>
<body>
 <div class="container">
        <h1>Contact Us</h1>
        <div class="contact-details">
            <h2>Get in Touch</h2>
            <p>If you have any questions or need assistance, feel free to reach out to us.</p>
            <ul>
                <li><strong>Phone:</strong> <a href="tel:+1234567890">+91 9832450124</a></li>
                <li><strong>Email:</strong> <a href="mailto:support@healthhub.com">support@healthhub.com</a></li>
                <li><strong>Location:</strong> Plot No.- IIA/27, AA II,Aliah University Newtown, Kolkata 700156, Kadampukur, West Bengal ,India</li>
            </ul>
        </div>
        
        <div class="contact-form">
            <h2>Send Us a Message</h2>
            <form action="processcontact" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea>
                
                <button type="submit">Submit</button>
               
            </form>

               <% if (request.getAttribute("contact") != null) { %>
            <h4><%= request.getAttribute("contact") %></h4>
        <% } %>
        </div>
         <a class="custom" href="javascript:history.back()">Back</a>
    </div>
</body>
</html>