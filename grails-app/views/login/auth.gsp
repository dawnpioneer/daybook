<g:render template="/shared/header"/>
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
                <div class="row">
                    <div class="input-field col s12">
                            <div class="error-message" style="color: red">帳號或密碼錯誤</div>
                    </div>
                </div>
                </g:if>
                <div class="row">
                    <div class="col s12">
                        <label for="rememberMe">
                            <input type="checkbox" class="filled-in" id="rememberMe" name="remember-me">
                            <span>記住我</span>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <a href="/user/create" class="waves-effect btn">註冊 </a>
                    </div>
                    <div class="input-field col s4">
                    </div>
                    <div class="input-field col s4">
                        <button class="btn waves-effect waves-light teal" type="submit" name="action">登入</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<g:render template="/shared/footer"/>