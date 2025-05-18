<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VidyaSync - Resource Documents</title>

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
            --google-drive: #0F9D58;
            --google-docs: #4285F4;
            --google-sheets: #0F9D58;
            --google-slides: #F4B400;
            --google-forms: #673AB7;
            --google-pdf: #E53935;
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

        .resource-subtitle {
            color: var(--secondary);
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }

        .document-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .document-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }

        .doc-header {
            padding: 15px 20px;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            background-color: rgba(0,0,0,0.02);
            display: flex;
            align-items: center;
        }

        .doc-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            margin-right: 15px;
            flex-shrink: 0;
        }

        .doc-type {
            font-weight: 600;
            margin: 0;
            color: var(--dark-text);
        }

        .doc-body {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .doc-name {
            font-weight: 700;
            font-size: 1.2rem;
            margin-bottom: 8px;
            color: var(--dark-text);
            word-break: break-word;
        }

        .doc-meta {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .doc-buttons {
            margin-top: auto;
            display: flex;
            gap: 10px;
        }

        .doc-link {
            flex: 1;
            text-align: center;
            padding: 10px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .view-btn {
            background-color: var(--primary);
            color: white;
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.3);
        }

        .view-btn:hover {
            background-color: #0d5bbd;
            color: white;
            box-shadow: 0 8px 20px rgba(26, 115, 232, 0.4);
        }

        .download-btn {
            background-color: var(--secondary);
            color: white;
            box-shadow: 0 5px 15px rgba(0, 188, 212, 0.3);
        }

        .download-btn:hover {
            background-color: #0097a7;
            color: white;
            box-shadow: 0 8px 20px rgba(0, 188, 212, 0.4);
        }

        .action-btn {
            display: inline-block;
            border-radius: 50px;
            padding: 0.75rem 1.5rem;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.1);
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

        /* Empty State */
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

            .doc-buttons {
                flex-direction: column;
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
                        <a class="nav-link" href="/#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/#contact">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <section class="main-content">
        <div class="container">
            <h2 class="page-title fade-in">Available Resource Documents</h2>

            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <c:choose>
                        <c:when test="${not empty resources}">
                            <h4 class="resource-subtitle slide-up">${resources[0].resourceType.resourceName}</h4>

                            <div class="row">
                                <c:forEach var="resource" items="${resources}" varStatus="status">
                                    <div class="col-md-6 slide-up" style="animation-delay: ${status.index * 0.1}s">
                                        <div class="document-card">
                                            <div class="doc-header">
                                                <div class="doc-icon" style="background-color:
                                                    <c:choose>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.pdf')}">var(--google-pdf)</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.doc') || resource.fileName.toLowerCase().endsWith('.docx')}">var(--google-docs)</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.xls') || resource.fileName.toLowerCase().endsWith('.xlsx')}">var(--google-sheets)</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.ppt') || resource.fileName.toLowerCase().endsWith('.pptx')}">var(--google-slides)</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.form')}">var(--google-forms)</c:when>
                                                        <c:otherwise>var(--google-drive)</c:otherwise>
                                                    </c:choose>
                                                ">
                                                    <i class="
                                                        <c:choose>
                                                            <c:when test="${resource.fileName.toLowerCase().endsWith('.pdf')}">fas fa-file-pdf</c:when>
                                                            <c:when test="${resource.fileName.toLowerCase().endsWith('.doc') || resource.fileName.toLowerCase().endsWith('.docx')}">fas fa-file-word</c:when>
                                                            <c:when test="${resource.fileName.toLowerCase().endsWith('.xls') || resource.fileName.toLowerCase().endsWith('.xlsx')}">fas fa-file-excel</c:when>
                                                            <c:when test="${resource.fileName.toLowerCase().endsWith('.ppt') || resource.fileName.toLowerCase().endsWith('.pptx')}">fas fa-file-powerpoint</c:when>
                                                            <c:when test="${resource.fileName.toLowerCase().endsWith('.form')}">fas fa-clipboard-list</c:when>
                                                            <c:otherwise>fas fa-file-alt</c:otherwise>
                                                        </c:choose>
                                                    "></i>
                                                </div>
                                                <h3 class="doc-type">
                                                    <c:choose>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.pdf')}">PDF Document</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.doc') || resource.fileName.toLowerCase().endsWith('.docx')}">Word Document</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.xls') || resource.fileName.toLowerCase().endsWith('.xlsx')}">Spreadsheet</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.ppt') || resource.fileName.toLowerCase().endsWith('.pptx')}">Presentation</c:when>
                                                        <c:when test="${resource.fileName.toLowerCase().endsWith('.form')}">Form</c:when>
                                                        <c:otherwise>Document</c:otherwise>
                                                    </c:choose>
                                                </h3>
                                            </div>
                                            <div class="doc-body">
                                                <h4 class="doc-name">${resource.fileName}</h4>
                                                <p class="doc-meta">
                                                    <i class="fas fa-calendar-alt"></i> Added
                                                    <c:choose>
                                                        <c:when test="${not empty resource.uploadedAt}">
                                                            ${resource.uploadedAt}
                                                        </c:when>
                                                        <c:otherwise>
                                                            recently
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <div class="doc-buttons">
                                                    <a href="${resource.fileLink}" target="_blank" class="doc-link view-btn">
                                                        <i class="fas fa-eye"></i> View
                                                    </a>
                                                    <a href="download?fileLink=${resource.fileLink}" class="doc-link download-btn">
                                                        <i class="fas fa-download"></i> Download
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
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