package com.xashytech.university.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Simple servlet to demonstrate basic servlet functionality
 * Shows information about the application
 */
public class AboutServlet extends HttpServlet {
    
    private String applicationStartTime;
    
    @Override
    public void init() throws ServletException {
        super.init();
        applicationStartTime = LocalDateTime.now()
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        System.out.println("AboutServlet initialized at: " + applicationStartTime);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Set application information
        request.setAttribute("appName", "Xashy Tech University Student Portal");
        request.setAttribute("version", "1.0.0");
        request.setAttribute("startTime", applicationStartTime);
        request.setAttribute("currentTime", LocalDateTime.now()
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        request.setAttribute("javaVersion", System.getProperty("java.version"));
        request.setAttribute("serverInfo", getServletContext().getServerInfo());
        request.setAttribute("pageTitle", "About - Xashy Tech University");
        
        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/views/about.jsp")
               .forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect POST requests to GET
        response.sendRedirect(request.getRequestURI());
    }
}
