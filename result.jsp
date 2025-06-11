<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>HealthTrack BMI Result</title>
  <link rel="stylesheet" href="assets/css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    body {
      font-family: 'Montserrat', sans-serif;
      background: #e6f2ff;
      margin: 0;
      padding: 0;
    }
    .result-container {
      max-width: 900px;
      margin: 2rem auto;
      background: #fff;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    .result-header {
      font-size: 24px;
      margin-bottom: 1rem;
      color: #0077cc;
    }
    .bmi-value {
      font-size: 32px;
      font-weight: bold;
      color: #333;
    }
    .bmi-category-display {
      font-size: 20px;
      font-weight: 600;
      margin: 10px 0;
    }
    .underweight {
      color: #5c7cfa;
    }
    .overweight {
      color: #f0ad4e;
    }
    .obese {
      color: #dc3545;
    }
    .result-details h3 {
      margin-top: 2rem;
      color: #333;
    }
    .result-details ul {
      margin-left: 1rem;
    }
    .recommendation-img {
      margin-top: 1rem;
      width: 100%;
      max-width: 500px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .back-btn {
      display: inline-block;
      margin-top: 2rem;
      padding: 10px 20px;
      background: #0077cc;
      color: #fff;
      text-decoration: none;
      border-radius: 8px;
      font-weight: 600;
      transition: background 0.3s ease;
    }
    .back-btn:hover {
      background: #005fa3;
    }
  </style>
</head>
<body>
  <div class="result-container">
    <h2 class="result-header"><i class="fas fa-chart-line"></i> Your BMI Results</h2>
    <div class="bmi-value">${bmi}</div>
    <div class="bmi-category-display ${categoryClass}">${category}</div>

    <div class="result-details">
      <h3><i class="fas fa-info-circle"></i> Details</h3>
      <p><strong>Weight:</strong> ${weight} kg</p>
      <p><strong>Height:</strong> ${height} cm</p>

      <div style="margin-top: 1.5rem;">
        <h4><i class="fas fa-lightbulb"></i> Health Recommendations:</h4>
        <c:choose>
          <c:when test="${category == 'Underweight'}">
            <ul>
              <li>Eat nutrient-rich foods frequently.</li>
              <li>Include healthy snacks like nuts, avocados, and bananas.</li>
              <li>Consult a dietician for a personalized plan.</li>
            </ul>
            <img src="assets/images/underweight_tips.jpg" alt="Underweight Tips" class="recommendation-img" />
          </c:when>

          <c:when test="${category == 'Overweight'}">
            <ul>
              <li>Incorporate regular physical activity into your routine.</li>
              <li>Watch portion sizes and reduce sugary food intake.</li>
              <li>Focus on balanced meals rich in fiber and protein.</li>
            </ul>
            <img src="assets/images/overweight_tips.jpg" alt="Overweight Tips" class="recommendation-img" />
          </c:when>

          <c:when test="${category == 'Obese'}">
            <ul>
              <li>Adopt a low-calorie, high-fiber diet.</li>
              <li>Exercise at least 30 minutes daily (e.g., walking, yoga).</li>
              <li>Consult a healthcare provider for a weight loss program.</li>
            </ul>
            <img src="assets/images/obese_tips.jpg" alt="Obese Tips" class="recommendation-img" />
          </c:when>

          <c:otherwise>
            <p>No special recommendations. Keep maintaining a healthy lifestyle!</p>
          </c:otherwise>
        </c:choose>
      </div>
    </div>

    <a href="index.html" class="back-btn"><i class="fas fa-arrow-left"></i> Calculate Again</a>
  </div>
</body>
</html>
