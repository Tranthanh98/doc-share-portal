<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section="image">
    <img src="https://release-release1-0.da0ls7damv3qc.amplifyapp.com/img/invoice-email.png" />
    </#if>
    <#if section="title">
        Confirm Your Email Address
    </#if>
    <#if section="content">
        Click the "Activate" button below to complete the subscription process. 
        DocSoup is the best choice.
    </#if>
    <#if section="link-text">
        ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
    </#if>
</@layout.htmlEmailLayout>
