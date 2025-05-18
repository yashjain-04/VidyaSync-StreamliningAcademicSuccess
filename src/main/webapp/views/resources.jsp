<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VidyaSync - Subject Selection</title>

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

        /* Page Header */
        .page-header {
            background: linear-gradient(135deg, var(--primary) 0%, #2c4bff 100%);
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            top: -150px;
            right: -150px;
            width: 400px;
            height: 400px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            z-index: 0;
        }

        .page-header::after {
            content: '';
            position: absolute;
            bottom: -100px;
            left: -100px;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            z-index: 0;
        }

        .page-title {
            font-weight: 800;
            font-size: 2.5rem;
            position: relative;
            z-index: 1;
        }

        .page-subtitle {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        /* Subject Cards */
        .subject-section {
            padding: 0 0 80px;
            flex-grow: 1;
        }

        .subject-card {
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            height: 100%;
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            display: flex;
            flex-direction: column;
        }

        .subject-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .subject-card-header {
            background: var(--primary);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .subject-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }

        .subject-card-body {
            padding: 20px;
            text-align: center;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .semester-tag {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            color: white;
            background-color: var(--secondary);
            margin-bottom: 15px;
        }

        .subject-btn {
            background-color: var(--primary);
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            border: none;
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.3);
            transition: all 0.3s;
            display: inline-block;
            text-decoration: none;
            width: 100%;
        }

        .subject-btn:hover {
            background-color: #0d5bcd;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(26, 115, 232, 0.4);
            color: white;
        }

        /* Search Input */
        .search-container {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .search-input {
            border-radius: 50px;
            border: 1px solid #ddd;
            padding: 10px 20px;
            box-shadow: none;
            transition: all 0.3s;
        }

        .search-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 50px 20px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 0 auto;
        }

        .empty-state-icon {
            font-size: 5rem;
            color: #ddd;
            margin-bottom: 20px;
        }

        .empty-state-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--primary);
        }

        .empty-state-text {
            color: #777;
            margin-bottom: 20px;
        }

        /* Footer */
        footer {
            background-color: #2d3748;
            color: #cbd5e0;
            padding: 60px 0 30px;
            margin-top: auto;
        }

        .footer-title {
            color: white;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #cbd5e0;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--secondary);
        }

        .footer-links i {
            width: 20px;
            text-align: center;
            margin-right: 5px;
        }

        .social-links {
            display: flex;
            gap: 10px;
        }

        .social-links a {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255,255,255,0.1);
            border-radius: 50%;
            color: white;
            transition: all 0.3s;
        }

        .social-links a:hover {
            background-color: var(--secondary);
            transform: translateY(-5px);
        }

        .copyright {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid rgba(255,255,255,0.1);
            margin-top: 30px;
        }

        /* Animation Classes */
        .fade-in {
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        .fade-in.visible {
            opacity: 1;
        }

        /* No Results */
        .no-results {
            text-align: center;
            padding: 50px 0;
        }

        .no-results-icon {
            font-size: 5rem;
            color: #ddd;
            margin-bottom: 20px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .page-header {
                padding: 40px 0;
            }

            .page-title {
                font-size: 2rem;
            }

            .subject-card {
                margin-bottom: 20px;
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
                        <a class="nav-link active" href="#">Resources</a>
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

    <!-- Page Header -->
    <header class="page-header">
        <div class="container">
            <h1 class="page-title animate__animated animate__fadeIn">Select Your Subject</h1>
            <p class="page-subtitle mt-3 animate__animated animate__fadeIn animate__delay-1s">Access MST papers, important topic analysis, notes, lab manuals, and syllabi for your chosen subject</p>
        </div>
    </header>

    <!-- Main Content -->
    <section class="subject-section">
        <div class="container">
            <!-- Search Input -->
            <div class="search-container fade-in">
                <div class="row align-items-center">
                    <div class="col-md-6 mx-auto">
                        <div class="input-group">
                            <span class="input-group-text bg-white border-end-0"><i class="fas fa-search text-muted"></i></span>
                            <input type="text" class="form-control search-input border-start-0" placeholder="Search subjects..." id="subjectSearch">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Subjects Grid -->
            <div class="row" id="subjectsContainer">
                <c:choose>
                    <c:when test="${not empty subjects}">
                        <c:forEach var="subject" items="${subjects}" varStatus="loop">
                            <div class="col-lg-4 col-md-6 mb-4 subject-item fade-in">
                                <div class="subject-card">
                                    <div class="subject-card-header">
                                        <div class="subject-icon">
                                            <i class="fas fa-book"></i>
                                        </div>
                                        <h3>${subject.subjectName}</h3>
                                    </div>
                                    <div class="subject-card-body">
                                        <div>
                                            <c:if test="${not empty subject.semester}">
                                                <span class="semester-tag">Semester ${subject.semester}</span>
                                            </c:if>
                                        </div>
                                        <form action="resource-details" method="get">
                                            <input type="hidden" name="subjectId" value="${subject.subjectId}">
                                            <button type="submit" class="subject-btn">View Resources</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12">
                            <div class="empty-state fade-in">
                                <div class="empty-state-icon">
                                    <i class="fas fa-books"></i>
                                </div>
                                <h3 class="empty-state-title">No Subjects Found</h3>
                                <p class="empty-state-text">We're still adding subjects to our database. Please check back later.</p>
                                <a href="/" class="btn subject-btn">Return to Home</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- No Search Results Message -->
            <div class="no-results d-none fade-in" id="noResults">
                <div class="no-results-icon">
                    <i class="fas fa-search"></i>
                </div>
                <h3>No matching subjects found</h3>
                <p>Try a different search term</p>
                <button class="btn subject-btn mt-3" onclick="resetSearch()">Show All Subjects</button>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <h5 class="footer-title">VidyaSync</h5>
                    <p>Streamlining academic success through centralized resources and collaborative learning.</p>
                    <div class="social-links mt-4">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5 class="footer-title">Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="/">Home</a></li>
                        <li><a href="#">Resources</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <h5 class="footer-title">Resources</h5>
                    <ul class="footer-links">
                        <li><a href="#">MST Papers</a></li>
                        <li><a href="#">Subject Notes</a></li>
                        <li><a href="#">Lab Manuals</a></li>
                        <li><a href="#">Syllabi</a></li>
                        <li><a href="#">Discussion Forums</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <h5 class="footer-title">Contact Us</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-map-marker-alt"></i> Indore Institute of Science & Technology</li>
                        <li><i class="fas fa-map-marker-alt"></i> Pithampur Road, Opposite IIM, Rau</li>
                        <li><i class="fas fa-map-marker-alt"></i> Indore 453331, MP</li>
                        <li><i class="fas fa-envelope"></i> info@vidyasync.com</li>
                        <li><i class="fas fa-phone"></i> +91 123 456 7890</li>
                    </ul>
                </div>
            </div>
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
            // Animation on scroll
            const animateOnScroll = function() {
                const fadeElements = document.querySelectorAll('.fade-in');

                const options = {
                    threshold: 0.2,
                    rootMargin: '0px 0px -100px 0px'
                };

                const observer = new IntersectionObserver(function(entries, observer) {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            entry.target.classList.add('visible');
                            observer.unobserve(entry.target);
                        }
                    });
                }, options);

                fadeElements.forEach(el => observer.observe(el));
            };

            // Subject search functionality
            const initSearch = function() {
                const searchInput = document.getElementById('subjectSearch');
                const subjectItems = document.querySelectorAll('.subject-item');
                const noResults = document.getElementById('noResults');

                searchInput.addEventListener('keyup', function() {
                    const searchTerm = this.value.toLowerCase();
                    let hasResults = false;

                    subjectItems.forEach(item => {
                        const subjectName = item.querySelector('h3').textContent.toLowerCase();
                        const isVisible = subjectName.includes(searchTerm);

                        if (isVisible) {
                            item.style.display = '';
                            hasResults = true;
                        } else {
                            item.style.display = 'none';
                        }
                    });

                    if (!hasResults) {
                        noResults.classList.remove('d-none');
                    } else {
                        noResults.classList.add('d-none');
                    }
                });
            };

            // Reset search function
            window.resetSearch = function() {
                const searchInput = document.getElementById('subjectSearch');
                const subjectItems = document.querySelectorAll('.subject-item');
                const noResults = document.getElementById('noResults');

                // Clear search
                searchInput.value = '';

                // Show all subjects
                subjectItems.forEach(item => {
                    item.style.display = '';
                });

                // Hide no results message
                noResults.classList.add('d-none');
            };

            // Navbar scroll effect
            const initNavbarEffect = function() {
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
            };

            // Initialize all functions
            animateOnScroll();
            initSearch();
            initNavbarEffect();
        });
    </script>
</body>
</html>