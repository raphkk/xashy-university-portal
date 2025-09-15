<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <h1 class="logo">🎓 Xashy Tech University</h1>
            <nav class="nav">
                <a href="${pageContext.request.contextPath}/" class="nav-link">Home</a>
                <a href="${pageContext.request.contextPath}/students" class="nav-link">Students</a>
                <a href="${pageContext.request.contextPath}/about" class="nav-link active">About</a>
            </nav>
        </div>
    </header>

    <main class="main">
        <div class="container">
            <div class="page-header">
                <h2>ℹ️ About This Application</h2>
                <p>Technical details and application information</p>
            </div>

            <div class="about-content">
                <section class="app-info">
                    <h3>🏫 Application Information</h3>
                    <div class="info-table">
                        <table>
                            <tr>
                                <td><strong>Application Name:</strong></td>
                                <td><c:out value="${appName}"/></td>
                            </tr>
                            <tr>
                                <td><strong>Version:</strong></td>
                                <td>${version}</td>
                            </tr>
                            <tr>
                                <td><strong>Started:</strong></td>
                                <td>${startTime}</td>
                            </tr>
                            <tr>
                                <td><strong>Current Time:</strong></td>
                                <td>${currentTime}</td>
                            </tr>
                            <tr>
                                <td><strong>Java Version:</strong></td>
                                <td>${javaVersion}</td>
                            </tr>
                            <tr>
                                <td><strong>Server Info:</strong></td>
                                <td>${serverInfo}</td>
                            </tr>
                        </table>
                    </div>
                </section>

                <section class="tech-stack">
                    <h3>💻 Technology Stack</h3>
                    <div class="tech-grid">
                        <div class="tech-item">
                            <h4>☕ Java</h4>
                            <p>Core programming language with Servlet API for web development</p>
                        </div>
                        <div class="tech-item">
                            <h4>📦 Maven</h4>
                            <p>Build automation and dependency management tool</p>
                        </div>
                        <div class="tech-item">
                            <h4>🌐 Servlets & JSP</h4>
                            <p>Java web technologies for server-side processing and dynamic pages</p>
                        </div>
                        <div class="tech-item">
                            <h4>🐱 Apache Tomcat</h4>
                            <p>Web server and servlet container for deployment</p>
                        </div>
                    </div>
                </section>

                <section class="architecture">
                    <h3>🏗️ Application Architecture</h3>
                    <div class="architecture-info">
                        <div class="arch-layer">
                            <h4>Presentation Layer</h4>
                            <ul>
                                <li>JSP pages for dynamic HTML generation</li>
                                <li>CSS for styling and responsive design</li>
                                <li>Basic JavaScript for client-side interactions</li>
                            </ul>
                        </div>
                        <div class="arch-layer">
                            <h4>Controller Layer</h4>
                            <ul>
                                <li>StudentServlet - handles student-related requests</li>
                                <li>AboutServlet - provides application information</li>
                                <li>Request routing and response handling</li>
                            </ul>
                        </div>
                        <div class="arch-layer">
                            <h4>Service Layer</h4>
                            <ul>
                                <li>StudentService - business logic for student operations</li>
                                <li>In-memory data management (for demo purposes)</li>
                                <li>CRUD operations and data validation</li>
                            </ul>
                        </div>
                        <div class="arch-layer">
                            <h4>Model Layer</h4>
                            <ul>
                                <li>Student model class with properties and methods</li>
                                <li>Data encapsulation and object-oriented design</li>
                                <li>Easy to extend for database integration</li>
                            </ul>
                        </div>
                    </div>
                </section>

                <section class="maven-info">
                    <h3>🔧 Maven Build Commands</h3>
                    <div class="commands-info">
                        <div class="command-item">
                            <h4>Compile the project:</h4>
                            <code>mvn compile</code>
                        </div>
                        <div class="command-item">
                            <h4>Run tests:</h4>
                            <code>mvn test</code>
                        </div>
                        <div class="command-item">
                            <h4>Package as WAR:</h4>
                            <code>mvn package</code>
                        </div>
                        <div class="command-item">
                            <h4>Clean build:</h4>
                            <code>mvn clean install</code>
                        </div>
                        <div class="command-item">
                            <h4>Deploy to Tomcat:</h4>
                            <code>mvn tomcat7:deploy</code>
                        </div>
                    </div>
                </section>

                <section class="learning-objectives">
                    <h3>🎯 Learning Objectives</h3>
                    <div class="objectives-list">
                        <div class="objective-item">
                            <strong>Maven Build Lifecycle:</strong>
                            <p>Understand compile, test, package phases and their execution order</p>
                        </div>
                        <div class="objective-item">
                            <strong>Servlet Architecture:</strong>
                            <p>Learn HTTP request handling, session management, and response generation</p>
                        </div>
                        <div class="objective-item">
                            <strong>JSP Technology:</strong>
                            <p>Dynamic web page creation with Java code embedded in HTML</p>
                        </div>
                        <div class="objective-item">
                            <strong>MVC Pattern:</strong>
                            <p>Separation of concerns with Model-View-Controller design pattern</p>
                        </div>
                        <div class="objective-item">
                            <strong>Tomcat Deployment:</strong>
                            <p>Web application packaging and deployment to servlet container</p>
                        </div>
                    </div>
                </section>

                <section class="contact-info">
                    <h3>📞 Support & Contact</h3>
                    <div class="contact-card">
                        <p><strong>Educational Use:</strong> This application is designed for teaching Java web development concepts.</p>
                        <p><strong>Repository:</strong> Source code available for educational purposes</p>
                        <p><strong>Questions:</strong> Contact your instructor for technical assistance</p>
                    </div>
                </section>
            </div>
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
