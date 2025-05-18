<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VidyaSync - Resource Details</title>

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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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

        /* Main Content */
        .main-content {
            flex-grow: 1;
            padding: 60px 0;
        }

        .page-title {
            color: var(--primary);
            font-weight: 700;
            margin-bottom: 40px;
            text-align: center;
            position: relative;
        }

        .page-title:after {
            content: '';
            display: block;
            width: 70px;
            height: 4px;
            background: var(--secondary);
            margin: 15px auto 0;
            border-radius: 2px;
        }

        .resource-card {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            align-items: center;
            cursor: pointer;
            border: none;
            width: 100%;
            text-align: left;
            position: relative;
            overflow: hidden;
        }

        .resource-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }

        .resource-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(45deg, var(--secondary), var(--primary));
        }

        .resource-icon {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            margin-right: 20px;
            flex-shrink: 0;
        }

        .resource-name {
            font-weight: 600;
            color: var(--dark-text);
            font-size: 1.1rem;
            margin: 0;
        }

        .resource-description {
            margin: 5px 0 0;
            color: #666;
            font-size: 0.9rem;
        }

        .back-btn {
            background-color: var(--primary);
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            font-weight: 600;
            border: none;
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.3);
            transition: all 0.3s;
            display: inline-block;
            text-decoration: none;
            margin-top: 30px;
        }

        .back-btn:hover {
            background-color: #0d5bbd;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(26, 115, 232, 0.4);
            color: white;
        }

        .back-btn i {
            margin-right: 8px;
        }

        /* Animations */
        .fade-in {
            animation: fadeIn 0.8s ease-in-out;
        }

        .slide-up {
            animation: slideUp 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Footer */
        footer {
            background-color: #2d3748;
            color: #cbd5e0;
            padding: 30px 0;
            margin-top: auto;
        }

        .copyright {
            text-align: center;
        }

        /* Resource Types */
        .no-resources {
            text-align: center;
            padding: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        .no-resources i {
            font-size: 3rem;
            color: var(--secondary);
            margin-bottom: 20px;
            display: block;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .page-title {
                font-size: 1.8rem;
            }

            .resource-icon {
                width: 40px;
                height: 40px;
                font-size: 0.9rem;
            }

            .resource-name {
                font-size: 1rem;
            }

            .back-btn {
                padding: 10px 20px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
        <div class="container">
            <a class="navbar-brand" href="/">Vidya<span>Sync</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <section class="main-content">
        <div class="container">
            <h2 class="page-title fade-in">Available Resources</h2>

            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <c:choose>
                        <c:when test="${not empty resources}">
                            <c:forEach var="resource" items="${resources}" varStatus="status">
                                <form action="resource-type" method="get" class="slide-up" style="animation-delay: ${status.index * 0.1}s">
                                    <input type="hidden" name="resourceTypeId" value="${resource.resourceTypeId}">
                                    <input type="hidden" name="subjectId" value="${subjectId}">
                                    <button type="submit" class="resource-card">
                                        <div class="resource-icon">
                                            <i class="fas fa-file-alt"></i>
                                        </div>
                                        <div class="resource-info">
                                            <h3 class="resource-name">${resource.resourceName}</h3>
                                            <p class="resource-description">Access valuable ${resource.resourceName} for your course</p>
                                        </div>
                                    </button>
                                </form>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="no-resources slide-up">
                                <i class="fas fa-folder-open"></i>
                                <h3>No Resources Available</h3>
                                <p>There are currently no resources available for this selection. Please check back later.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div class="text-center slide-up" style="animation-delay: 0.3s">
                        <a href="/select" class="back-btn">
                            <i class="fas fa-arrow-left"></i> Go Back
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="copyright">
                <p>&copy; 2025 VidyaSync. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
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