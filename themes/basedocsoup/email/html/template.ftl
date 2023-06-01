<#macro htmlEmailLayout>
<html>
    <head>
        <style>
            .container {
                font-family: 'Noto Sans KR', sans-serif;
                width: 100%; 
                padding: 20px;
                background-color: #f3f4f8;
                color: #6c6c6c;
                text-align: center;
            }
            .container__logo-wrapper {
                margin: auto;
                padding-bottom: 15px;
                text-align: center;
            }
            .container__body {
                width: 480px;
                height: auto;
                margin: auto;
                padding: 30px 30px 20px;
                background-color: #fff;
            }
            .container__body__title {
                margin: 20px; 
                color: #1e1e1e; 
                font-size: 20px; 
                font-weight: bold;
            }
            .container__body__content {
                font-size: 13px;
            }
            .container__body__divider {
                min-width: 420px;
                height: 1px;
                margin: 20px 0 30px;
                opacity: 0.5;
                background-color: #dadada;
            }
            .container__body__link {
                display: block;
                width: 144px;
                margin: 30px auto;
                padding: 14px 16px;
                border-radius: 2px;
                background-color: #f79f1a;
                color: #fff !important;
                font-size: 16px;
                font-weight: 500;
                line-height: initial;
                text-decoration: none;
            }
            .container__body__link:hover {
                background-color: #e09119;
            }
            .container__copyright {
                font-size: 12px;
                margin-top: 16px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="container__logo-wrapper">
                <img id="logo"
                src="https://release-release1-0.da0ls7damv3qc.amplifyapp.com/img/logo-black.png"
                alt="Logo"
                width="117"
                height="31" 
                style="object-fit: contain;"/>
            </div>
            <div class="container__body">
                <#nested "image">
                <p class="container__body__title">
                    <#nested "title">
                </p>
                <p class="container__body__content">
                    <#nested "content">
                </p>
                <div class="container__body__divider"></div>
                <#if link??>        
                    <a href="${link}" class="container__body__link"><#nested "link-text"></a>
                </#if>
                <p class="container__body__content">
                    <#nested "footer">
                </p>
            </div>
            <p class="container__copyright">Copyright ⓒ DocSoup 2021, All right reserved.</p>
        </div>
    </body>
</html>
</#macro>