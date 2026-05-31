<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
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

    <%@ include file="/view/components/admin-navbar.jsp" %>

    <div class="content-area">

        <%@ include file="/view/components/admin-header.jsp" %>

        <main class="page-content">

            <jsp:include page="${contentPage}" />

        </main>

        <%@ include file="/view/components/admin-footer.jsp" %>

    </div>

</div>

</body>
</html>