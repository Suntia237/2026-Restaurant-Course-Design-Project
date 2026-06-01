<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>RAMIJO Restaurant - ${pageTitle}</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins', sans-serif;
        }

        body{
            width:100vw;
            height:100vh;
            background:#f5f5f5;
            overflow:hidden;
        }

        .admin-container{
            display:flex;
            width:100vw;
            height:100vh;
        }

        .content-area{
            width:82vw;
            display:flex;
            flex-direction:column;
            overflow:hidden;
        }

        .main-content{
            flex:1;
            padding:2vw;
            overflow-y:auto;
            background:#f5f5f5;
        }

    </style>

</head>

<body>

    <div class="admin-container">

        <%@ include file="/view/components/admin-navbar.jsp" %>

        <div class="content-area">

            <%@ include file="/view/components/admin-header.jsp" %>

            <main class="main-content">

                <jsp:include page="${contentPage}" />

            </main>

            <%@ include file="/view/components/admin-footer.jsp" %>

        </div>

    </div>

</body>
</html>