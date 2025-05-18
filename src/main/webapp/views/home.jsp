<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VidyaSync - Streamlining Academic Success</title>

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

        /* Hero Section */
        .hero {
            padding: 100px 0 70px;
            background: linear-gradient(135deg, rgba(255,255,255,0.95) 0%, rgba(240,245,255,0.95) 100%);
            position: relative;
            overflow: hidden;
        }

        .hero::before {
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

        .hero::after {
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

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-title {
            font-weight: 800;
            font-size: 3rem;
            margin-bottom: 1.5rem;
            color: var(--primary);
        }

        .hero-subtitle {
            font-size: 1.3rem;
            color: #555;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .hero-image {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .hero-image img {
            max-width: 65%;
            height: auto;
            animation: float 4s ease-in-out infinite;
            border-radius: 10px;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }

        /* Feature Cards */
        .features {
            padding: 80px 0;
            background-color: #fff;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
            font-weight: 700;
            color: var(--primary);
            position: relative;
        }

        .section-title:after {
            content: '';
            display: block;
            width: 70px;
            height: 4px;
            background: var(--secondary);
            margin: 15px auto 0;
            border-radius: 2px;
        }

        .feature-card {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            height: 100%;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: var(--secondary);
            text-align: center;
        }

        .feature-title {
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--primary);
            text-align: center;
        }

        .feature-card p {
            flex-grow: 1;
            text-align: center;
            line-height: 1.6;
        }

        /* About Section */
        .about {
            padding: 80px 0;
            background-color: var(--light-bg);
        }

        .about img {
            width: 65%;
            object-fit: cover;
        }

        .about p {
            margin-bottom: 1rem;
            line-height: 1.7;
        }

        .about-title{
            text-align: center;
        }

        /* CTA Section */
        .cta-section {
            padding: 100px 0;
            background: linear-gradient(135deg, var(--primary) 0%, #2c4bff 100%);
            color: white;
            text-align: center;
        }

        .cta-title {
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .cta-btn {
            background-color: var(--accent);
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            border: none;
            box-shadow: 0 5px 15px rgba(255, 109, 0, 0.4);
            transition: all 0.3s;
            display: inline-block;
            text-decoration: none;
        }

        .cta-btn:hover {
            background-color: #e06100;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(255, 109, 0, 0.5);
            color: white;
        }

        /* Footer */
        footer {
            background-color: #2d3748;
            color: #cbd5e0;
            padding: 60px 0 30px;
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

        /* Mobile Responsiveness */
        @media (max-width: 991px) {
            .about .section-title {
                text-align: center;
                margin-top: 2rem;
            }

            .about img {
                margin-bottom: 2rem;
            }
        }

        @media (max-width: 768px) {
            .hero {
                padding: 80px 0 60px;
                text-align: center;
            }

            .hero-title {
                font-size: 2.2rem;
            }

            .hero-subtitle {
                font-size: 1.1rem;
            }

            .hero-image {
                margin-top: 40px;
            }

            .feature-card {
                margin-bottom: 30px;
            }

            .cta-title {
                font-size: 2rem;
            }

            .section-title {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 576px) {
            .hero-title {
                font-size: 1.8rem;
            }

            .hero-subtitle {
                font-size: 1rem;
            }

            .cta-btn {
                padding: 12px 25px;
                font-size: 1rem;
            }

            .footer-section {
                text-align: center;
            }

            .social-links {
                justify-content: center;
                margin-bottom: 30px;
            }
        }

        /* Animation Classes */
        .fade-in {
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        .fade-in.visible {
            opacity: 1;
        }

        .slide-up {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease-in-out, transform 0.8s ease-in-out;
        }

        .slide-up.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top" >
        <div class="container">
            <a class="navbar-brand" href="#home">Vidya<span>Sync</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#home">Home</a>
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

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="hero-content animate__animated animate__fadeIn">
                        <h1 class="hero-title">Streamlining Academic Success</h1>
                        <p class="hero-subtitle">Access MST papers, important topic analysis, subject notes, lab manuals, and syllabi all in one place. Your one-stop solution for academic excellence.</p>
                        <a href="/select" class="btn cta-btn animate__animated animate__pulse animate__infinite animate__slower">Get Started</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="hero-image animate__animated animate__fadeInRight">
                        <img src="VidyaSync_Logo.png" alt="VidyaSync Platform" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <div class="container">
            <h2 class="section-title fade-in">Why Choose VidyaSync?</h2>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card slide-up">
                        <div class="feature-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <h3 class="feature-title">Centralized Resources</h3>
                        <p>Access all your academic materials in one place - MST papers, notes, lab manuals, and syllabi without hassle.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card slide-up">
                        <div class="feature-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3 class="feature-title">Anonymous Discussions</h3>
                        <p>Engage in peer-to-peer learning and share solutions without revealing your identity in our discussion forums.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card slide-up">
                        <div class="feature-icon">
                            <i class="fas fa-tachometer-alt"></i>
                        </div>
                        <h3 class="feature-title">Personalized Dashboard</h3>
                        <p>Save, organize, and access your favorite resources efficiently through your personalized dashboard.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card slide-up">
                        <div class="feature-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h3 class="feature-title">Important Topic Analysis</h3>
                        <p>Focus on high-priority areas with our important topic analysis feature to make your study time more productive.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card slide-up">
                        <div class="feature-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h3 class="feature-title">Resource Rating System</h3>
                        <p>Rate and provide feedback on resources to ensure quality control and help other students find the best content.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card slide-up">
                        <div class="feature-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h3 class="feature-title">Time Efficiency</h3>
                        <p>Stop wasting time searching for resources and focus on what matters - your academic growth and success.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="about py-5" id="about">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 order-lg-1 fade-in">
                    <img src="/VidyaSync_Logo.png" alt="About VidyaSync" class="img-fluid rounded-3" />
                </div>
                <div class="col-lg-6 order-lg-2 fade-in">
                    <h2 class="section-title  about-title">About VidyaSync</h2>
                    <p>VidyaSync was created to address the challenge students face when accessing reliable academic resources, particularly Mid-Semester Test papers, notes, and syllabi updates.</p>
                    <p>Unlike final exam resources, MST papers and related materials are rarely centralized or readily available. Students often rely on inconsistent sources such as seniors or faculty, which leads to delays and inefficiencies in their preparation.</p>
                    <p>Our platform streamlines the academic journey by offering centralized access to essential resources, fostering collaborative learning, and reducing dependency on unreliable sources.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="cta-title animate__animated animate__fadeIn">Ready to Boost Your Academic Performance?</h2>
                    <p class="mb-4 animate__animated animate__fadeIn animate__delay-1s">Join thousands of students who are already benefiting from VidyaSync's centralized resources.</p>
                    <a href="/select" class="btn cta-btn animate__animated animate__pulse animate__infinite animate__slower">Get Started Now</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <h5 class="footer-title">VidyaSync</h5>
                    <p>Streamlining academic success through centralized resources and collaborative learning.</p>
                    <div class="social-links mt-4">
                        <a href="https://www.linkedin.com/in/-yashjain-/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                        <a href="https://github.com/yashjain-04" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://www.instagram.com/_yashdhupiya_/"><i class="fab fa-instagram" target="_blank"></i></a>
                        <a href="https://www.linkedin.com/in/-yashjain-/"><i class="fab fa-twitter" target="_blank"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5 class="footer-title">Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#features">Features</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <h5 class="footer-title">Resources</h5>
                    <ul class="footer-links">
                        <li><a href="/select">MST Papers</a></li>
                        <li><a href="/select">Subject Notes</a></li>
                        <li><a href="/select">Lab Manuals</a></li>
                        <li><a href="/select">Syllabi</a></li>
                        <li><a href="/select">Discussion Forums</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <h5 class="footer-title">Contact Us</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope"></i> vidyasync2025@gmail.com</li>
                        <a href="https://www.linkedin.com/in/-yashjain-/" target="_blank"><i class="fab fa-linkedin-in"></i>-yashjain-</a>
                        <br>
                        <a href="https://www.linkedin.com/in/vikaschourasiya79/" target="_blank"><i class="fab fa-linkedin-in"></i>vikaschourasiya79</a>
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

    <!-- Custom JavaScript for animations -->
    <script>
        // Intersection Observer for scroll animations
        document.addEventListener('DOMContentLoaded', function() {
            // Function to handle animations
            const animateOnScroll = function() {
                const fadeElements = document.querySelectorAll('.fade-in');
                const slideElements = document.querySelectorAll('.slide-up');

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
                slideElements.forEach(el => observer.observe(el));
            };

            // Apply staggered delay to feature cards
            const applyStaggeredDelay = function() {
                const featureCards = document.querySelectorAll('.feature-card');
                featureCards.forEach((card, index) => {
                    card.style.transitionDelay = `${index * 0.1}s`;
                });
            };

            // Smooth scrolling for navigation links
            const initSmoothScrolling = function() {
                document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                    anchor.addEventListener('click', function (e) {
                        e.preventDefault();

                        const targetId = this.getAttribute('href');
                        if (targetId === '#') return;

                        const targetElement = document.querySelector(targetId);
                        if (targetElement) {
                            window.scrollTo({
                                top: targetElement.offsetTop - 70,
                                behavior: 'smooth'
                            });
                        }
                    });
                });
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
            applyStaggeredDelay();
            initSmoothScrolling();
            initNavbarEffect();
        });
    </script>
</body>
</html>