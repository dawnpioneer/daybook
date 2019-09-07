<g:set var="isEdit" value="${user?.id != null}" />
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h4>使用者 - ${isEdit ? "修改" : "註冊"}</h4>
            </div>
        </div>
        <div class="row">
            <g:form name="signupForm" controller="user" action="${isEdit ? 'update' : 'save'}" class="col s12">
                <g:hiddenField name="id" value="${user?.id}"/>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="username" name="username" value="${user?.username}" type="text" class="validate" required>
                        <label for="username">名稱</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="password" name="password" value="${user?.password}" type="password" class="validate" required>
                        <label for="password">密碼</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="confirmPassword" name="confirmPassword" type="password" class="validate" required>
                        <label for="confirmPassword">確認密碼</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="email" name="email" value="${user?.email}" type="email" class="validate" required>
                        <label for="email">電子郵件</label>
                    </div>
                    <div class="col s12">
                        <g:hasErrors bean="${this.user}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.user}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                    </div>
                    <div class="col s12">
                        <button type="submit" class="waves-effect waves-light btn a-button">
                            <i class="fa fa-save" aria-hidden="true"></i>
                        </button>
                        <a href="/" class="waves-effect btn a-button"><i class="fa fa-arrow-left" aria-hidden="true"></i> </a>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
<script>
    var password = document.getElementById("password")
        , confirmPassword = document.getElementById("confirmPassword");

    function validatePassword(){
        if(password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("確認密碼與密碼不符合。");
        } else {
            confirmPassword.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirmPassword.onkeyup = validatePassword;
</script>