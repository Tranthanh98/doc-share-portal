<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section="image">
    </#if>
    <#if section="title">
        Testing connection
    </#if>
    <#if section="content">
        This is testing connection content
    </#if>
    <#if section="link-text">
        ${kcSanitize(msg("emailTestBody",realmName))?no_esc}
    </#if>
    <#if section="footer">
        This is a footer
    </#if>
</@layout.htmlEmailLayout>