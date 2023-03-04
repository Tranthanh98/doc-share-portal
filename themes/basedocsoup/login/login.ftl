<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "nav-tabs">
        <ul class="${properties.kcFormNavTabClass!}">
            <li>
                <a class="${properties.kcFormNavLinkClass!} active" href="${url.loginUrl}">${msg("loginAccountTitle")}</a>
            </li>
            <li>
                <a class="${properties.kcFormNavLinkClass!}" href="${url.registrationUrl}">${msg("registerTitle")}</a>
            </li>
        </ul>
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">

        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
                </ul>
                <div class="${properties.kcFormSeparatorClass!}">
                    <span>${msg("identity-provider-login-label")}</span>
                </div>
            </div>
        </#if>

        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" placeholder="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" placeholder="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </#if>
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" placeholder="password" type="password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                    />
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    <span for="password" class="${properties.kcInputEyeSlashIcon!}" onclick="togglePasswordVisibility(event)"></span>
                    <#if messagesPerField.existsError('password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked><span>${msg("rememberMe")}</span>
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"><span>${msg("rememberMe")}</span>
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        <#if realm.password && !registrationDisabled??>
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="5" id="kc-link-forgot-password" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                <#else>
                                    <span>${msg("noAccount")}</span>
                                </#if>
                            </div>
                        </#if>
                    </div>
                        <#--  <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>  -->
                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                  </div>
            </form>
        </#if>
        </div>

    </div>
    </#if>

</@layout.registrationLayout>
