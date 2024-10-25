<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User List</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 0 auto;
        }

        thead {
            background-color: #3498db;
            color: white;
        }

        th {
            padding: 1rem;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid #eee;
            font-size: 0.95rem;
        }

        tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s ease-in-out;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        /* Status styling for active field */
        td:last-child {
            font-weight: 600;
        }

        td:last-child:before {
            content: "•";
            margin-right: 5px;
            color: #2ecc71;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }

            th, td {
                padding: 0.75rem;
                font-size: 0.9rem;
            }

            h1 {
                font-size: 2rem;
            }
        }

        /* Optional: Add zebra striping */
        tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        /* Date columns styling */
        td:nth-child(5), td:nth-child(6) {
            color: #666;
            font-family: monospace;
            font-size: 0.9rem;
        }

        /* ID column styling */
        td:first-child {
            font-weight: 600;
            color: #3498db;
        }
    </style>
</head>
<body>
<h1>User List</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Identification Number</th>
        <th>Nationality</th>
        <th>Registration Date</th>
        <th>Expiration Date</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.firstName} ${user.lastName}</td>
            <td>${user.identificationNumber}</td>
            <td>${user.nationality}</td>
            <td>${user.registrationDate}</td>
            <td>${user.expirationDate}</td>
            <td>${user.active}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>