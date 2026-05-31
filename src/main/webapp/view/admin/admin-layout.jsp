<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title><%= request.getAttribute("title") %></title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:#f5f6fa;
        }

        .admin-container{
            display:flex;
            min-height:100vh;
        }

        .content-area{
            flex:1;
            display:flex;
            flex-direction:column;
        }

        .main-content{
            flex:1;
            padding:2vw;
        }

    </style>

</head>

<body>

<div class="admin-container">

    <%@ include file="admin-navbar.jsp" %>

    <div class="content-area">

        <%@ include file="admin-header.jsp" %>

        <main class="main-content">

            <jsp:include page="<%= (String)request.getAttribute(\"contentPage\") %>" />

        </main>

        <%@ include file="admin-footer.jsp" %>

    </div>

</div>

</body>
</html>