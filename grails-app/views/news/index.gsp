<g:render template="/shared/menu"/>
<style>
    body {
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
                            2020/01/20 新增個人資料頁面與修改密碼功能
                            <span class="new badge"></span>
                        </div>
                        <div class="collapsible-body">
                            <p>1. 原登出按鈕修改為登入使用者名稱，並新增個人資料</p>
                            <g:img file="news/20200120_1.png"/>
                            <p>2. 進入個人資料頁面後可點擊修改</p>
                            <g:img file="news/20200120_2.png"/>
                            <p>3. 輸入欲修改之密碼，並儲存</p>
                            <g:img file="news/20200120_3.png"/>
                            <p>4. 存檔後將自動更新編輯日期</p>
                            <g:img file="news/20200120_4.png"/>
                            <p>5. 重新登入時便可使用新密碼登入</p>
                            <g:img file="news/20200120_5.png"/>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header">
                            <i class="material-icons">filter_drama</i>
                            2019/10/26 記帳類別新增排序功能
                            <span></span>
                        </div>
                        <div class="collapsible-body">
                            <p>1. 「記帳類別」新增排序按鈕</p>
                            <g:img file="news/20191026_1.png"/>
                            <p>2. 按住滑鼠左鍵進行項目拖曳</p>
                            <g:img file="news/20191026_2.png"/>
                            <p>3. 放開後隨即更改排序，並進行存檔</p>
                            <g:img file="news/20191026_3.png"/>
                            <p>4. 存檔後將自動儲存客製化排序</p>
                            <g:img file="news/20191026_4.png"/>
                            <p>5. 新建記帳本的類別順序將會套用排序結果</p>
                            <g:img file="news/20191026_5.png"/>
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