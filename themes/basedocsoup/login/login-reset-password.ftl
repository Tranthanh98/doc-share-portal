<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
        <p id="kc-info-wrapper">${msg("emailInstruction")}</p>
    <#elseif section = "form">
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" placeholder="username" />
                <#if messagesPerField.existsError('username')>
                    <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </span>
                </#if>
                <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmitPassword")}"/>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <div id="kc-registration-container">
            <div id="kc-registration">
                <span></span>
                <span>${msg("doBack")}<a href="${url.loginUrl}">${kcSanitize(msg("doLogIn"))?no_esc}</a></span>
                <span></span>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
