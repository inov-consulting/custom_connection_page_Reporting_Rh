<#import "reset-flow-layout.ftl" as layout>
<@layout.resetFlowLayout step=2; section>
    <#if section = "form">
      <p class="form-eyebrow">Étape 2 sur 3</p>
      <h2 class="form-title">${msg("loginTotpOneTime")}</h2>
      <p class="form-desc">${msg("loginTotpStep3")}</p>

      <form id="kc-totp-login-form" action="${url.loginAction}" method="post">
        <input id="otp-hidden" name="otp" type="hidden" />

        <div class="otp-group" role="group" aria-label="Code OTP à 6 chiffres">
          <input class="otp-input" type="text" inputmode="numeric" maxlength="1" aria-label="Chiffre 1" />
          <input class="otp-input" type="text" inputmode="numeric" maxlength="1" aria-label="Chiffre 2" />
          <input class="otp-input" type="text" inputmode="numeric" maxlength="1" aria-label="Chiffre 3" />
          <span class="otp-sep" aria-hidden="true">·</span>
          <input class="otp-input" type="text" inputmode="numeric" maxlength="1" aria-label="Chiffre 4" />
          <input class="otp-input" type="text" inputmode="numeric" maxlength="1" aria-label="Chiffre 5" />
          <input class="otp-input" type="text" inputmode="numeric" maxlength="1" aria-label="Chiffre 6" />
        </div>

        <#if messagesPerField.existsError('totp')>
          <span class="text-red-800 text-xs" aria-live="polite">
            ${kcSanitize(messagesPerField.get('totp'))?no_esc}
          </span>
        </#if>

        <button type="submit" name="login" id="kc-login" class="btn-primary" style="background:#1B6B45;">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><polyline points="20 6 9 17 4 12"/></svg>
          ${msg("doLogIn")}
        </button>
      </form>
    </#if>
</@layout.resetFlowLayout>
