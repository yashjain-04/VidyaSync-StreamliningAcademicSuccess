<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VidyaSync - Select Branch & Semester</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Animate.css for animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #1a73e8;
            --secondary: #00bcd4;
            --accent: #ff6d00;
            --light-bg: #f5f7fa;
            --dark-text: #333;
            --light-text: #f5f7fa;
        }

        body {
            font-family: 'Nunito', 'Segoe UI', sans-serif;
            background-color: var(--light-bg);
            color: var(--dark-text);
            overflow-x: hidden;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            transition: all 0.3s ease;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--primary);
        }

        .navbar-brand span {
            color: var(--accent);
        }

        .nav-link {
            font-weight: 600;
            color: var(--dark-text);
            margin: 0 10px;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: var(--secondary);
        }

        /* Main Section */
        .selection-section {
            padding: 80px 0;
            position: relative;
            overflow: hidden;
        }

        .selection-section::before {
            content: '';
            position: absolute;
            top: -150px;
            right: -150px;
            width: 400px;
            height: 400px;
            border-radius: 50%;
            background: linear-gradient(45deg, var(--secondary), var(--primary));
            opacity: 0.1;
            z-index: 0;
        }

        .selection-section::after {
            content: '';
            position: absolute;
            bottom: -100px;
            left: -100px;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: linear-gradient(45deg, var(--primary), var(--accent));
            opacity: 0.1;
            z-index: 0;
        }

        .section-header {
            background: linear-gradient(135deg, var(--primary) 0%, #2c4bff 100%);
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 30px;
            margin-bottom: 0;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .section-title {
            font-weight: 800;
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .section-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .content-card {
            position: relative;
            z-index: 1;
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .card-body {
            padding: 0;
        }

        .info-col {
            background-color: #eef2ff;
            padding: 30px;
            position: relative;
        }

        .info-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 20px;
            position: relative;
        }

        .info-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--secondary);
            border-radius: 10px;
        }

        .resource-list {
            margin: 30px 0;
        }

        .resource-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .resource-item:hover {
            transform: translateX(5px);
        }

        .icon-wrapper {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            color: var(--primary);
            font-size: 1.5rem;
        }

        .resource-info h3 {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 5px;
            color: var(--dark-text);
        }

        .resource-info p {
            font-size: 0.9rem;
            color: #666;
            margin: 0;
        }

        .testimonial {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            position: relative;
        }

        .testimonial:before {
            content: '\f10d';
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            top: -10px;
            left: 20px;
            background-color: var(--secondary);
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
        }

        .testimonial p {
            font-style: italic;
            color: #555;
            margin-bottom: 10px;
        }

        .testimonial .author {
            font-weight: 700;
            font-size: 0.9rem;
            color: var(--primary);
        }

        .form-col {
            padding: 40px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 700;
            color: var(--dark-text);
            margin-bottom: 10px;
            display: block;
        }

        .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s;
            font-family: 'Nunito', sans-serif;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%231a73e8' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }

        .form-select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.25);
        }

        .semester-selector {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 15px;
        }

        .semester-button {
            flex: 1 0 22%;
            min-width: 70px;
            text-align: center;
            padding: 12px 5px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 700;
            transition: all 0.3s;
            background-color: white;
        }

        .semester-button:hover {
            border-color: var(--primary);
            color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.15);
        }

        .semester-button.active {
            background-color: var(--primary);
            color: white;
            border-color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.25);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, #2c4bff 100%);
            border: none;
            padding: 14px 20px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 700;
            width: 100%;
            color: white;
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.25);
            transition: all 0.3s;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(26, 115, 232, 0.4);
        }

        .logo-link {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--primary);
            display: flex;
            align-items: center;
        }

        .logo span {
            color: var(--accent);
        }

        .logo-icon {
            margin-right: 10px;
            color: var(--primary);
        }

        .back-button {
            color: var(--primary);
            text-decoration: none;
            display: flex;
            align-items: center;
            font-weight: 600;
            transition: all 0.3s;
        }

        .back-button:hover {
            color: var(--secondary);
            transform: translateX(-5px);
        }

        .back-button i {
            margin-right: 8px;
        }

        /* Animations */
        .fade-in {
            opacity: 0;
            animation: fadeIn 0.8s forwards;
        }

        .slide-up {
            opacity: 0;
            transform: translateY(30px);
            animation: slideUp 0.8s forwards;
        }

        .slide-up-delay-1 {
            animation-delay: 0.2s;
        }

        .slide-up-delay-2 {
            animation-delay: 0.4s;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        @keyframes slideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Media Queries - IMPROVED FOR RESPONSIVENESS */
        @media (max-width: 991px) {
            .section-title {
                font-size: 1.8rem;
            }

            .section-subtitle {
                font-size: 1rem;
            }

            .navbar .container-fluid {
                justify-content: space-between;
            }
        }

        @media (max-width: 768px) {
            .section-header {
                padding: 20px;
            }

            .info-col, .form-col {
                padding: 25px;
            }

            .semester-button {
                flex: 1 0 31%;
            }

            .selection-section {
                padding: 40px 0;
            }
        }

        @media (max-width: 576px) {
            .semester-button {
                flex: 1 0 45%;
                padding: 10px 5px;
                font-size: 0.9rem;
            }

            .logo {
                font-size: 1.5rem;
            }

            .back-button {
                font-size: 0.9rem;
            }

            .section-title {
                font-size: 1.5rem;
            }

            .section-subtitle {
                font-size: 0.9rem;
            }

            .icon-wrapper {
                width: 40px;
                height: 40px;
                font-size: 1.2rem;
            }

            .resource-info h3 {
                font-size: 1rem;
            }

            .resource-info p {
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid px-0">
                <a href="/" class="logo-link">
                    <div class="logo">
                        <i class="fas fa-book-open logo-icon"></i>
                        Vidya<span>Sync</span>
                    </div>
                </a>
                <a href="javascript:history.back()" class="back-button">
                    <i class="fas fa-arrow-left"></i> Back to Home
                </a>
            </div>
        </nav>

        <!-- Main Selection Section -->
        <section class="selection-section">
            <div class="content-card fade-in">
                <div class="section-header">
                    <h1 class="section-title">Access Your Academic Resources</h1>
                    <p class="section-subtitle">Select your branch and semester to view tailored study materials</p>
                </div>

                <div class="card-body">
                    <!-- FIXED: Using Bootstrap's row/col system correctly -->
                    <div class="row g-0">
                        <!-- Information Column -->
                        <div class="col-lg-5 info-col slide-up">
                            <div class="info-title">What You'll Find</div>
                            <p>VidyaSync provides centralized access to critical academic resources that are typically hard to find.</p>

                            <div class="resource-list">
                                <div class="resource-item">
                                    <div class="icon-wrapper">
                                        <i class="fas fa-file-alt"></i>
                                    </div>
                                    <div class="resource-info">
                                        <h3>MST Papers</h3>
                                        <p>Previous Mid-Semester Test papers organized by subject</p>
                                    </div>
                                </div>

                                <div class="resource-item">
                                    <div class="icon-wrapper">
                                        <i class="fas fa-pencil-alt"></i>
                                    </div>
                                    <div class="resource-info">
                                        <h3>Subject Notes</h3>
                                        <p>Curated study materials aligned with your curriculum</p>
                                    </div>
                                </div>

                                <div class="resource-item">
                                    <div class="icon-wrapper">
                                        <i class="fas fa-search"></i>
                                    </div>
                                    <div class="resource-info">
                                        <h3>Important Topics</h3>
                                        <p>Key focus areas based on past exam trends</p>
                                    </div>
                                </div>

                                <div class="resource-item">
                                    <div class="icon-wrapper">
                                        <i class="fas fa-comments"></i>
                                    </div>
                                    <div class="resource-info">
                                        <h3>Discussion Forums</h3>
                                        <p>Connect with peers for academic and career advice</p>
                                    </div>
                                </div>
                            </div>

                            <div class="testimonial">
                                <p>"VidyaSync saved me hours of searching for MST papers. Everything I need is now in one place!"</p>
                                <div class="author">— Computer Science, 6th Semester</div>
                            </div>
                        </div>

                        <!-- Form Column -->
                        <div class="col-lg-7 form-col slide-up slide-up-delay-1">
                            <form action="process-selection" method="post" id="selectionForm">
                                <div class="form-group">
                                    <label for="branch" class="form-label">Select Your Branch</label>
                                    <select name="branchId" id="branch" class="form-select" required>
                                        <option value="" disabled selected>Choose your branch</option>
                                        <c:forEach var="branch" items="${branches}">
                                            <option value="${branch.branchId}">${branch.branchName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Select Your Semester</label>
                                    <div class="semester-selector">
                                        <div class="semester-button" data-value="1">1st</div>
                                        <div class="semester-button" data-value="2">2nd</div>
                                        <div class="semester-button" data-value="3">3rd</div>
                                        <div class="semester-button" data-value="4">4th</div>
                                        <div class="semester-button" data-value="5">5th</div>
                                        <div class="semester-button" data-value="6">6th</div>
                                        <div class="semester-button" data-value="7">7th</div>
                                        <div class="semester-button" data-value="8">8th</div>
                                    </div>
                                    <input type="hidden" name="semester" id="semester" required>
                                </div>

                                <button type="submit" id="submitBtn" class="btn btn-primary">
                                    <i class="fas fa-arrow-right me-2"></i> Continue to Resources
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Semester button selection
            const semesterButtons = document.querySelectorAll('.semester-button');
            const semesterInput = document.getElementById('semester');
            const form = document.getElementById('selectionForm');

            semesterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Remove active class from all buttons
                    semesterButtons.forEach(btn => btn.classList.remove('active'));

                    // Add active class to clicked button
                    this.classList.add('active');

                    // Set the hidden input value
                    semesterInput.value = this.getAttribute('data-value');
                });
            });

            // Form validation
            form.addEventListener('submit', function(e) {
                if (!semesterInput.value) {
                    e.preventDefault();
                    alert('Please select a semester to continue');
                }
            });

            // Navbar scroll effect
            const navbar = document.querySelector('.navbar');
            window.addEventListener('scroll', function() {
                if (window.scrollY > 50) {
                    navbar.style.padding = '10px 0';
                    navbar.style.boxShadow = '0 5px 20px rgba(0,0,0,0.1)';
                } else {
                    navbar.style.padding = '15px 0';
                    navbar.style.boxShadow = '0 2px 15px rgba(0,0,0,0.1)';
                }
            });
        });
    </script>
</body>
</html>