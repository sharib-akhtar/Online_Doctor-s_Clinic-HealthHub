# onlineClinic

## Overview

`onlineClinic` is a web-based application designed to facilitate interactions between patients, doctors, and administrators in a healthcare setting. 
Built with Spring Boot for the backend and JSP with Bootstrap for the frontend, this project aims to provide a comprehensive solution for managing medical appointments and user profiles.

It is my first project using SpringBoot,JPA,JSP and MYSQL for DB.It has below mentioned features and some of the features ae quite simple.

## Features

### **Admin Features**
- **Admin Login:** Secure login for administrators.
- **Dashboard:** Overview of the system with access to various administrative functions.
- **View All Doctors:** List and manage all registered doctors.
- **View Doctor’s Profile:** Detailed information about individual doctors.
- **View All Patients:** List and manage all registered patients.

### **Doctor Features**
- **Doctor Login:** Secure login for doctors.
- **Dashboard:** Overview of the system for doctors.
- **View Patients:** Access and manage patient profiles.
- **New Doctor Job Application:** Apply to work as a Doctor.

### **User Features**
- **User Login:** Secure login for users (patients).
- **New User Registration:** Register new users with essential details.
- **Patient Registration:** Register and manage patient profiles.
- **View Appointments:** Check all appointments made by the user.

### **General Pages**
- **Home Page:** Welcome and introductory information about the online clinic.
- **About Us:** Information about the clinic and its mission.
- **Services:** Details about the medical services offered.
- **Contact Us/Feedback:** Form for user feedback and inquiries.

## Technology Stack

- **Backend:** Spring Boot, JPA, MySQL
- **Frontend:** JSP, Bootstrap, CSS, JavaScript

## Setup and Installation

### **Prerequisites**

- Java Development Kit (JDK) 11 or later
- Apache Maven or Gradle
- MySQL Database
  
### If you want to test this project on your PC follow the below mentioned steps:-
-First create a Database in MySQL , preferred name is OnlineClinic as less changes will be required to be be made then.
-Tables will be automatically created by hibernate so you don't need to care about that.
-Navigate to the src/main/resources/ folder then open the file named as application.properties there update the mysql login password that you have created to login into mysql server.
-As I have not provided the option to add admin. you have to manually add admin data, that is email(primarykey),name and passsword to login the admin panel of the app through mysql command line client.
-Now You are good to go....
