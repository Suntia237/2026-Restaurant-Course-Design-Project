<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add New Menu Item</title>
    <style>
        /* Global styles inspired by your main page */

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 2vh;
        }

        /* Form container */
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 3vh;
            border-radius: 25px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        /* Heading */
        h2 {
            text-align: center;
            margin-bottom: 3vh;
            color: #222;
            font-size: 2vw;
        }

        /* Form layout */
        form {
            display: flex;
            flex-direction: column;
        }

        /* Labels */
        label {
            margin-bottom: 0.5vh;
            font-weight: 600;
            color: #555;
        }

        /* Input fields, select, file upload */
        input[type="text"],
        input[type="number"],
        select,
        input[type="file"] {
            padding: 1vh;
            margin-bottom: 2vh;
            border: 1px solid #ddd;
            border-radius: 12px;
            font-size: 0.95vw;
        }

        /* Submit button */
        button {
            padding: 1vh;
            background-color: #ff6b00;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 0.95vw;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #e45f00;
        }

        /* Responsive styles for smaller screens */
        @media(max-width: 992px) {
            input[type="text"],
            input[type="number"],
            select,
            input[type="file"] {
                font-size: 14px;
            }
            button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Menu</h2>
    <form action="${pageContext.request.contextPath}/saveMenu" method="post" enctype="multipart/form-data">

        <!-- Name -->
        <label for="menuName">Name</label>
        <input type="text" id="menuName" name="menuName" placeholder="Dish or Drink Name" required>

        <!-- Price -->
        <label for="price">Price (RMB)</label>
        <input type="number" id="price" name="price" step="0.01" placeholder="e.g., 12.50" required>

        <!-- Category -->
        <label for="category">Category</label>
        <select id="category" name="category" required>
            <option value="dish">Dish</option>
            <option value="drink">Drink</option>
        </select>

        <!-- Image Upload -->
        <label for="imageFile">Image</label>
        <input type="file" id="imageFile" name="imageFile" accept="image/*" required>

        <!-- Submit Button -->
        <button type="submit">Add</button>
    </form>
</div>

</body>
</html>