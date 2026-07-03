<#import "reset-flow-layout.ftl" as layout>
<@layout.resetFlowLayout step=1; section>
    <#if section = "form">

      <p style="font-size:11px;font-weight:600;color:#0c1b33;letter-spacing:.08em;text-transform:uppercase;margin-bottom:8px;">Sécurité du compte</p>
      <h2 style="font-size:24px;font-weight:700;color:#111827;letter-spacing:-0.02em;margin-bottom:6px;">${msg("forgotPasswordTitle")}</h2>
      <p style="font-size:13px;color:#6b7280;line-height:1.6;margin-bottom:24px;">${msg("forgotPasswordInstruction")}</p>

      <#if message?has_content && (message.type == "error")>
        <div style="display:flex;align-items:flex-start;gap:10px;padding:11px 13px;background:#fef2f2;border:1px solid #fecaca;border-radius:9px;margin-bottom:16px;">
          <svg style="width:15px;height:15px;color:#ef4444;flex-shrink:0;margin-top:1px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
          </svg>
          <p style="font-size:12px;color:#991b1b;line-height:1.5;">${kcSanitize(message.summary)?no_esc}</p>
        </div>
      </#if>

      <form id="kc-reset-password-form" action="${url.loginAction}" method="post">

        <div style="margin-bottom:20px;">
          <label for="username" style="display:block;font-size:13px;font-weight:500;color:#374151;margin-bottom:6px;">Adresse e-mail</label>
          <div style="position:relative;">
            <span style="position:absolute;left:12px;top:50%;transform:translateY(-50%);color:#9ca3af;pointer-events:none;display:flex;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                <polyline points="22,6 12,13 2,6"/>
              </svg>
            </span>
            <#assign emailBorder = messagesPerField.existsError('email')?then('border:1.5px solid #ef4444;', 'border:1.5px solid #d1d5db;')>
            <input
              type="email"
              id="username"
              name="username"
              placeholder="${msg("emailPlaceholder")}"
              style="width:100%;height:42px;${emailBorder}border-radius:8px;padding:0 12px 0 40px;font-size:13px;font-family:inherit;color:#111827;outline:none;background:#fff;transition:border-color 0.15s,box-shadow 0.15s;"
              onfocus="this.style.borderColor='#0c1b33';this.style.boxShadow='0 0 0 3px rgba(12,27,51,0.08)';"
              onblur="this.style.boxShadow='none';"
              autofocus
              autocomplete="email"
              autocapitalize="none"
              autocorrect="off"
              required
            />
          </div>
          <#if messagesPerField.existsError('email')>
            <p style="font-size:11px;color:#ef4444;margin-top:5px;" aria-live="polite">
              ${kcSanitize(messagesPerField.get('email'))?no_esc}
            </p>
          </#if>
        </div>

        <button type="submit"
                style="width:100%;height:44px;background:#0c1b33;color:#fff;border:none;border-radius:9px;font-size:14px;font-weight:600;font-family:inherit;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:8px;transition:opacity 0.15s;"
                onmouseover="this.style.opacity='0.88'"
                onmouseout="this.style.opacity='1'">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <line x1="22" y1="2" x2="11" y2="13"/>
            <polygon points="22 2 15 22 11 13 2 9 22 2"/>
          </svg>
          ${msg("sendButton")}
        </button>

        <div style="text-align:center;">
          <a href="${url.loginUrl}"
             style="display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:500;color:#6b7280;text-decoration:none;margin-top:16px;"
             onmouseover="this.style.color='#374151'"
             onmouseout="this.style.color='#6b7280'">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <line x1="19" y1="12" x2="5" y2="12"/>
              <polyline points="12 19 5 12 12 5"/>
            </svg>
            ${msg("backToLogin")}
          </a>
        </div>

      </form>
    </#if>
</@layout.resetFlowLayout>
