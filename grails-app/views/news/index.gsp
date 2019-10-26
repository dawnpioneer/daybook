<g:render template="/shared/menu"/>
<style>
    html {
        font-size: 20px !important;
    }
    .collapsible-body {
        padding: 0.5rem 1rem !important;
    }
</style>
<div class="container">
    <div class="section">
        <div class="row">
            <div class="col s12">
                <ul class="collapsible">
                    <li>
                        <div class="collapsible-header">
                            <i class="material-icons">filter_drama</i>
                            2019/10/26 記帳類別新增排序功能
                            <span class="new badge"></span></div>
                        <div class="collapsible-body">
                            <p>1. 「記帳類別」新增排序按鈕</p>
                            <g:img file="news/20191026_1.png" width="100%"/>
                            <p>2. 按住滑鼠左鍵進行項目拖曳</p>
                            <g:img file="news/20191026_2.png" width="100%"/>
                            <p>3. 放開後隨即更改排序，並進行存檔</p>
                            <g:img file="news/20191026_3.png" width="100%"/>
                            <p>4. 存檔後將自動儲存排序編號</p>
                            <g:img file="news/20191026_4.png" width="100%"/>
                            <p>5. 新建記帳本的類別順序將會套用排序結果</p>
                            <g:img file="news/20191026_5.png" width="100%"/>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>
<script>
    $(document).ready(function(){
        $('.collapsible').collapsible();
    });
</script>