<#--  <html>
<body>
${kcSanitize(msg("passwordResetBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
</body>
</html>  -->

<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section="image">
        <img
            src="https://main.da0ls7damv3qc.amplifyapp.com/img/reset-pass-email.png"
            alt="mail"
            width="180"
            height="151" 
            style="margin: auto; object-fit: contain;"/>
    </#if>
    <#if section="title">
        ${kcSanitize(msg("passwordResetTitle", user.firstName, user.lastName))?no_esc}
    </#if>
    <#if section="content">
        ${kcSanitize(msg("passwordResetContentHtml"))?no_esc}
    </#if>
    <#if section="link-text">
        ${kcSanitize(msg("passwordResetLinkText"))?no_esc}
    </#if>
    <#if section="footer">
        ${kcSanitize(msg("passwordResetFooterHtml"))?no_esc}
    </#if>
</@layout.htmlEmailLayout>