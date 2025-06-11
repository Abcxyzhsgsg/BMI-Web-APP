package com.example.bmi;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/calculate")
public class BMIServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String unit = request.getParameter("unit");
            double weight = Double.parseDouble(request.getParameter("weight"));
            double height = Double.parseDouble(request.getParameter("height"));

            if ("imperial".equals(unit)) {
                weight *= 0.453592;
                height *= 2.54;
            }

            double heightInMeters = height / 100;
            double bmi = weight / (heightInMeters * heightInMeters);
            String category, categoryClass;

            if (bmi < 18.5) {
                category = "Underweight";
                categoryClass = "underweight-result";
            } else if (bmi < 25) {
                category = "Normal";
                categoryClass = "normal-result";
            } else if (bmi < 30) {
                category = "Overweight";
                categoryClass = "overweight-result";
            } else {
                category = "Obese";
                categoryClass = "obese-result";
            }

            request.setAttribute("bmi", String.format("%.1f", bmi));
            request.setAttribute("category", category);
            request.setAttribute("categoryClass", categoryClass);
            request.setAttribute("weight", String.format("%.1f", weight));
            request.setAttribute("height", String.format("%.1f", height));
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("index.html");
        }
    }
}
