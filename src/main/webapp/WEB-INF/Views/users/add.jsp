<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Add New User</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: #f5f5f5;
      padding: 2rem;
      color: #333;
    }

    h1 {
      color: #2c3e50;
      text-align: center;
      margin-bottom: 2rem;
      font-size: 2.5rem;
      position: relative;
      padding-bottom: 0.5rem;
    }

    h1::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 100px;
      height: 4px;
      background: linear-gradient(to right, #3498db, #2980b9);
      border-radius: 2px;
    }

    .form-container {
      max-width: 800px;
      margin: 0 auto;
      background-color: white;
      border-radius: 8px;
      padding: 2rem;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: #2c3e50;
      font-weight: 600;
      font-size: 0.95rem;
    }

    input, select {
      width: 100%;
      padding: 0.75rem;
      border: 2px solid #e2e8f0;
      border-radius: 5px;
      font-size: 1rem;
      transition: border-color 0.3s ease;
    }

    input:focus, select:focus {
      outline: none;
      border-color: #3498db;
    }

    .button-container {
      display: flex;
      justify-content: space-between;
      margin-top: 2rem;
      gap: 1rem;
    }

    button {
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: 5px;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .submit-button {
      background-color: #3498db;
      color: white;
      flex: 1;
    }

    .submit-button:hover {
      background-color: #2980b9;
    }

    .cancel-button {
      background-color: #e2e8f0;
      color: #2c3e50;
      flex: 1;
    }

    .cancel-button:hover {
      background-color: #cbd5e1;
    }

    .form-row {
      display: flex;
      gap: 1rem;
      margin-bottom: 1.5rem;
    }

    .form-group.half {
      flex: 1;
    }

    @media (max-width: 768px) {
      body {
        padding: 1rem;
      }

      .form-row {
        flex-direction: column;
        gap: 0;
      }

      h1 {
        font-size: 2rem;
      }

      .form-container {
        padding: 1.5rem;
      }
    }

    /* Optional: Add field requirements indicator */
    .required::after {
      content: '*';
      color: #e74c3c;
      margin-left: 4px;
    }

    /* Error state styling */
    input.error {
      border-color: #e74c3c;
    }

    .error-message {
      color: #e74c3c;
      font-size: 0.85rem;
      margin-top: 0.25rem;
    }
  </style>
</head>
<body>
<h1>Add New User</h1>

<c:if test="${not empty error}">
  <div class="error-message">
      ${error}
  </div>
</c:if>

<form:form modelAttribute="user" action="${pageContext.request.contextPath}/users" method="post" cssClass="form-container">
  <div class="form-row">
    <div class="form-group half">
      <form:label path="firstName" cssClass="required">First Name</form:label>
      <form:input path="firstName" cssClass="form-control" required="true"/>
      <form:errors path="firstName" cssClass="error-message"/>
    </div>
    <div class="form-group half">
      <form:label path="lastName" cssClass="required">Last Name</form:label>
      <form:input path="lastName" cssClass="form-control" required="true"/>
      <form:errors path="lastName" cssClass="error-message"/>
    </div>
  </div>

  <div class="form-group">
    <form:label path="identificationNumber" cssClass="required">Identification Number</form:label>
    <form:input path="identificationNumber" cssClass="form-control" required="true"/>
    <form:errors path="identificationNumber" cssClass="error-message"/>
  </div>

  <div class="form-group">
    <form:label path="nationality" cssClass="required">Nationality</form:label>
    <form:select path="nationality" cssClass="form-control" required="true">
      <form:option value="" label="Select Nationality"/>
      <form:option value="US" label="United States"/>
      <form:option value="UK" label="United Kingdom"/>
      <form:option value="CA" label="Canada"/>
      <form:option value="AU" label="Australia"/>
    </form:select>
    <form:errors path="nationality" cssClass="error-message"/>
  </div>

  <div class="form-row">
    <div class="form-group half">
      <form:label path="registrationDate" cssClass="required">Registration Date</form:label>
      <form:input path="registrationDate" type="date" cssClass="form-control" required="true"/>
      <form:errors path="registrationDate" cssClass="error-message"/>
    </div>
    <div class="form-group half">
      <form:label path="expirationDate" cssClass="required">Expiration Date</form:label>
      <form:input path="expirationDate" type="date" cssClass="form-control" required="true"/>
      <form:errors path="expirationDate" cssClass="error-message"/>
    </div>
  </div>

  <div class="form-group">
    <form:label path="active">Status</form:label>
    <form:select path="active" cssClass="form-control">
      <form:option value="true" label="Active"/>
      <form:option value="false" label="Inactive"/>
    </form:select>
  </div>

  <div class="button-container">
    <button type="button" class="cancel-button" onclick="window.location.href='${pageContext.request.contextPath}/users'">Cancel</button>
    <button type="submit" class="submit-button">Add User</button>
  </div>
</form:form>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const registrationDate = document.getElementById('registrationDate');
    const expirationDate = document.getElementById('expirationDate');

    // Set default registration date to today
    registrationDate.valueAsDate = new Date();

    form.addEventListener('submit', function(e) {
      const regDate = new Date(registrationDate.value);
      const expDate = new Date(expirationDate.value);

      if (expDate <= regDate) {
        e.preventDefault();
        alert('Expiration date must be after registration date');
        return false;
      }
    });
  });
</script>
</body>
</html>