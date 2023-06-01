<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "nav-tabs">
        <ul class="${properties.kcFormNavTabClass!}">
            <li>
                <a class="${properties.kcFormNavLinkClass!}" href="${url.loginUrl}">${msg("loginAccountTitle")}</a>
            </li>
            <li>
                <a class="${properties.kcFormNavLinkClass!} active" href="${url.registrationUrl}">${msg("registerTitle")}</a>
            </li>
        </ul>
    <#elseif section = "form">
        <form id="kc-register-form" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" placeholder="firstName" autofocus
                    value="${(register.formData.firstName!'')}"
                    aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                />
                <#if messagesPerField.existsError('firstName')>
                    <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                    </span>
                </#if>
                <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" placeholder="lastName"
                    value="${(register.formData.lastName!'')}"
                    aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                />
                <#if messagesPerField.existsError('lastName')>
                    <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                    </span>
                </#if>
                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <input type="text" id="email" class="${properties.kcInputClass!}" name="email" placeholder="email"
                    value="${(register.formData.email!'')}" autocomplete="email"
                    aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                />
                <#if messagesPerField.existsError('email')>
                    <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </span>
                </#if>
                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" placeholder="username"
                        value="${(register.formData.username!'')}" autocomplete="username"
                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <input type="password" id="password" class="${properties.kcInputClass!}" name="password" placeholder="password"
                        autocomplete="new-password"
                        aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                    />
                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    <span for="password" class="${properties.kcInputEyeSlashIcon!}" onclick="togglePasswordVisibility(event)"></span>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                           name="password-confirm" placeholder="password-confirm"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                    />
                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    <span for="password-confirm" class="${properties.kcInputEyeSlashIcon!}" onclick="togglePasswordVisibility(event)"></span>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if realm.resetPasswordAllowed>
                            <span><a tabindex="5" id="kc-link-forgot-password" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                        <#else>
                            <span></span>
                        </#if>
                    </div>
                    <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>