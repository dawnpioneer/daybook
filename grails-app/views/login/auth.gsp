<html>

<head>
    <title>
        <g:message code='springSecurity.login.title' />
    </title>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8" />
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Import main.css -->
    <asset:stylesheet src="application.css"/>

    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <asset:javascript src="application.js"/>

    <style type="text/css" media="screen">
    /* Login Template */
    body {
        background: #f5f5f5;
    }
    h5 {
        font-weight: 400;
    }
    .container {
        margin-top: 230px;
        width: 400px;
    }
    .tabs .indicator {
        background-color: #e0f2f1;
        height: 60px;
        opacity: 0.3;
    }
    .form-container {
        padding: 40px;
        padding-top: 10px;
    }
    .confirmation-tabs-btn {
        position: absolute;
    }
    /* Toast */
    #toast-container {
        top: auto !important;
        right: auto !important;
        bottom: 5%;
        left: 45%;
    }
    </style>
</head>
<body>
<div class="container white z-depth-2">
    <div id="login" class="col s12">
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="col s12" autocomplete="off">
            <div class="form-container">
                <h4 class="teal-text">登入</h4>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" name="${usernameParameter ?: 'username'}" id="username" class="validate" required/>
                        <label for="username">帳號</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="password" name="${passwordParameter ?: 'password'}" id="password" class="validate" required/>
                        <label for="password">密碼</label>
                    </div>
                </div>
                <g:if test='${flash.message}'>
                    <div class="error-message" style="color: red">帳號或密碼錯誤</div>
                </g:if>
                <br>
                <center>
                    <button class="btn waves-effect waves-light teal" type="submit" name="action">登入</button>
                </center>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var onloadCallback = function () {
        grecaptcha.render('html_element', <recaptcha:renderParameters type="audio" tabindex="2"/>);
    };

    $(document).ready(function () {
        var gender = '${comment?.gender}';
        if (gender.length > 0) {
            $(':radio[value=' + gender + ']').prop('checked', true);
        }
    });
</script>
</body>
</html>