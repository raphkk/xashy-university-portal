<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xashy Tech University - Student Portal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <h1 class="logo">🎓 Xashy Tech University</h1>
            <nav class="nav">
                <a href="${pageContext.request.contextPath}/" class="nav-link active">Home</a>
                <a href="${pageContext.request.contextPath}/students" class="nav-link">Students</a>
                <a href="${pageContext.request.contextPath}/about" class="nav-link">About</a>
            </nav>
        </div>
    </header>

    <main class="main">
        <div class="container">
            <section class="hero">
                <h2>Welcome to Xashy Tech University Student Portal</h2>
                <p>Your gateway to academic excellence and technological innovation</p>
            </section>

            <section class="features">
                <div class="feature-grid">
                    <div class="feature-card">
                        <div class="feature-icon">👥</div>
                        <h3>Student Management</h3>
                        <p>View and manage student information, enrollment details, and academic records.</p>
                        <a href="${pageContext.request.contextPath}/students" class="btn btn-primary">View Students</a>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">📚</div>
                        <h3>Academic Programs</h3>
                        <p>Explore our cutting-edge programs in Computer Science, IT, Software Engineering, and Data Science.</p>
                        <a href="#" class="btn btn-secondary">Learn More</a>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">💻</div>
                        <h3>Technology Focus</h3>
                        <p>Built with modern Java technologies including Maven, Servlets, JSP, and deployed on Tomcat.</p>
                        <a href="${pageContext.request.contextPath}/about" class="btn btn-secondary">Technical Details</a>
                    </div>
                </div>
            </section>

            <section class="stats">
                <h3>University Statistics</h3>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number">4</div>
                        <div class="stat-label">Academic Programs</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number"><%
                            // Simple scriptlet to show current year
                            java.time.Year currentYear = java.time.Year.now();
                            int foundedYear = 2020;
                            int yearsOperating = currentYear.getValue() - foundedYear;
                            out.print(yearsOperating + "+");
                        %></div>
                        <div class="stat-label">Years of Excellence</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100%</div>
                        <div class="stat-label">Technology Focused</div>
                    </div>
                </div>
            </section>

            <section class="info">
                <div class="info-box">
                    <h3>📋 Demo Application Features</h3>
                    <ul>
                        <li><strong>Maven Build System:</strong> Compile, test, and package with standard Maven lifecycle</li>
                        <li><strong>Servlet Architecture:</strong> Java servlets handling HTTP requests and responses</li>
                        <li><strong>JSP Views:</strong> Dynamic web pages with JavaServer Pages technology</li>
                        <li><strong>Tomcat Deployment:</strong> Ready for deployment on Apache Tomcat server</li>
                        <li><strong>MVC Pattern:</strong> Clean separation of concerns with Model-View-Controller design</li>
                    </ul>
                </div>
            </section>
        </div>
    </main>

    <footer class="footer">
        <div class="container">
            <p>&copy; <%= java.time.Year.now() %> Xashy Tech University. Built for educational purposes.</p>
            <p>Demonstrating Maven, Servlets, JSP, and Tomcat deployment.</p>
        </div>
    </footer>
</body>
</html>
