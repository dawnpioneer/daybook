<g:render template="/shared/menu"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h4>使用者 - 檢視</h4>
            </div>
        </div>

        <div class="row view">
            <div class="input-field col s12">
                <input id="username" disabled value="${user.username}" type="text" class="validate">
                <label for="username">使用者名稱</label>
            </div>

            <div class="input-field col s12">
                <input id="email" disabled value="${user.email}" type="text" class="validate">
                <label for="email">Email</label>
            </div>

            <div class="input-field col s12">
                <input id="dateCreated" disabled
                       value="<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${user.dateCreated}"/>"
                       type="text" class="validate">
                <label for="dateCreated">建立日期</label>
            </div>

            <div class="input-field col s12">
                <input id="lastUpdated" disabled
                       value="<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${user.lastUpdated}"/>"
                       type="text" class="validate">
                <label for="lastUpdated">編輯日期</label>
            </div>
        </div>

        <div class="row">
            <div class="col s12">
                <g:link action="edit" id="${user.id}" class="waves-effect waves-light btn a-button">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                </g:link>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>
<script>
    $(document).ready(function() {
        $('#comment').trigger('autoresize');
    });
</script>