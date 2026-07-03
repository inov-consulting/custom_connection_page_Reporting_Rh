<#import "template_login.ftl" as layout>
<#import "components/molecules/identity-provider.ftl" as identityProvider>

<@layout.registrationLayout displayInfo=(social?? && social.displayInfo??)?then(social.displayInfo,false); section>

    <#if section = "title">
        ${msg("loginHeading",(realm.displayName!''))}

    <#elseif section = "form">

        <#assign hasFieldError = messagesPerField.existsError('username','password')>

        <h2 style="font-size:26px;font-weight:700;color:#111827;letter-spacing:-0.02em;margin-bottom:4px;">${msg("loginHeading")}</h2>
        <p style="font-size:13px;color:#9ca3af;margin-bottom:24px;">${msg("loginSubtitle")}</p>

        <#-- Session expired / info warning banner -->
        <#if message?has_content && (message.type == "warning")>
          <div style="display:flex;align-items:flex-start;gap:10px;padding:12px 14px;background:#fffbeb;border:1px solid #fed7aa;border-radius:10px;margin-bottom:18px;">
            <svg style="width:16px;height:16px;color:#f97316;flex-shrink:0;margin-top:1px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z"/>
            </svg>
            <div>
              <p style="font-size:13px;font-weight:600;color:#92400e;margin-bottom:2px;">Votre session a expiré</p>
              <p style="font-size:12px;color:#92400e;line-height:1.5;">${kcSanitize(message.summary)?no_esc}</p>
            </div>
          </div>
        </#if>

        <#-- Credentials error banner -->
        <#if message?has_content && (message.type == "error") && !hasFieldError>
          <div style="display:flex;align-items:flex-start;gap:10px;padding:12px 14px;background:#fef2f2;border:1px solid #fecaca;border-radius:10px;margin-bottom:18px;">
            <svg style="width:16px;height:16px;color:#ef4444;flex-shrink:0;margin-top:1px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
            <div>
              <p style="font-size:13px;font-weight:600;color:#991b1b;margin-bottom:2px;">Identifiants incorrects</p>
              <p style="font-size:12px;color:#991b1b;line-height:1.5;">${kcSanitize(message.summary)?no_esc}</p>
            </div>
          </div>
        </#if>

        <#-- Success message -->
        <#if message?has_content && (message.type == "success")>
          <div style="display:flex;align-items:flex-start;gap:10px;padding:12px 14px;background:#f0fdf4;border:1px solid #bbf7d0;border-radius:10px;margin-bottom:18px;">
            <svg style="width:16px;height:16px;color:#22c55e;flex-shrink:0;margin-top:1px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <p style="font-size:13px;color:#166534;line-height:1.5;">${kcSanitize(message.summary)?no_esc}</p>
          </div>
        </#if>

        <#-- Style and variable assignments -->
        <#assign labelColorStyle = hasFieldError?then('color:#ef4444;', 'color:#374151;')>
        <#assign inputBorderStyle = hasFieldError?then('border:1.5px solid #ef4444;color:#ef4444;', 'border:1.5px solid #d1d5db;color:#111827;')>
        <#assign inputStyle = "width:100%;height:42px;border-radius:8px;padding:0 12px;font-size:13px;font-family:inherit;outline:none;transition:border-color 0.15s,box-shadow 0.15s;background:#fff;" + inputBorderStyle>
        <#assign pwdInputBorderStyle = hasFieldError?then('border:1.5px solid #ef4444;color:#374151;', 'border:1.5px solid #d1d5db;color:#111827;')>
        <#assign pwdInputStyle = "width:100%;height:42px;border-radius:8px;padding:0 40px 0 12px;font-size:13px;font-family:inherit;outline:none;transition:border-color 0.15s,box-shadow 0.15s;background:#fff;" + pwdInputBorderStyle>
        <#assign pwdPlaceholder = hasFieldError?then('Ressaisissez votre mot de passe', '')>
        <#assign rememberMeMarginTop = hasFieldError?then('0', '14px')>
        <#assign heightWhenNoError = hasFieldError?then('0', '20px')>

        <form id="kc-form-login" action="${url.loginAction}" method="post" onsubmit="fcSubmit(this)">

            <#-- Email / Username field -->
            <div style="margin-bottom:14px;">
                <label style="display:block;font-size:13px;font-weight:500;margin-bottom:6px;${labelColorStyle}">
                    <#if realm.loginWithEmailAllowed && realm.registrationEmailAsUsername>
                        Adresse e-mail
                    <#elseif !realm.loginWithEmailAllowed>
                        ${msg("username")}
                    <#else>
                        ${msg("usernameOrEmail")}
                    </#if>
                </label>
                <#if realm.loginWithEmailAllowed && realm.registrationEmailAsUsername>
                    <#if usernameEditDisabled??>
                        <input type="email" name="username" value="${(login.username!'')}" style="${inputStyle}" readonly />
                    <#else>
                        <input type="email" name="username" value="${(login.username!'')}" style="${inputStyle}" placeholder="prenom.nom@financia.fr" autofocus autocomplete="email" onfocus="this.style.borderColor='#0c1b33';this.style.boxShadow='0 0 0 3px rgba(12,27,51,0.08)';" onblur="this.style.boxShadow='none';" />
                    </#if>
                <#elseif !realm.loginWithEmailAllowed>
                    <#if usernameEditDisabled??>
                        <input type="text" name="username" value="${(login.username!'')}" style="${inputStyle}" readonly />
                    <#else>
                        <input type="text" name="username" value="${(login.username!'')}" style="${inputStyle}" autofocus autocomplete="username" onfocus="this.style.borderColor='#0c1b33';this.style.boxShadow='0 0 0 3px rgba(12,27,51,0.08)';" onblur="this.style.boxShadow='none';" />
                    </#if>
                <#else>
                    <#if usernameEditDisabled??>
                        <input type="text" name="username" id="username" value="${(login.username!'')}" style="${inputStyle}" readonly />
                    <#else>
                        <input type="text" name="username" id="username" value="${(login.username!'')}" style="${inputStyle}" placeholder="prenom.nom@financia.fr" autofocus autocomplete="off" onfocus="this.style.borderColor='#0c1b33';this.style.boxShadow='0 0 0 3px rgba(12,27,51,0.08)';" onblur="this.style.boxShadow='none';" />
                    </#if>
                </#if>
                <#if hasFieldError && messagesPerField.existsError('username')>
                    <p style="font-size:11px;color:#ef4444;margin-top:4px;">${kcSanitize(messagesPerField.get('username'))?no_esc}</p>
                </#if>
            </div>

            <#-- Password field -->
            <div style="margin-bottom:6px;">
                <div style="margin-bottom:6px;">
                    <label style="display:block;font-size:13px;font-weight:500;${labelColorStyle}">${msg("password")}</label>
                </div>
                <div style="position:relative;">
                    <input id="password" name="password" type="password"
                           data-has-toggle="true"
                           style="${pwdInputStyle}"
                           placeholder="${pwdPlaceholder}"
                           autocomplete="current-password"
                           onfocus="this.style.borderColor='#0c1b33';this.style.boxShadow='0 0 0 3px rgba(12,27,51,0.08)';"
                           onblur="this.style.boxShadow='none';" />
                    <button type="button" onclick="fcTogglePwd()" aria-label="Afficher/masquer le mot de passe"
                            style="position:absolute;right:10px;top:50%;transform:translateY(-50%);background:none;border:none;cursor:pointer;color:#9ca3af;padding:4px;line-height:0;">
                        <svg id="fc-pwd-eye" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                        </svg>
                    </button>
                </div>
                <#if hasFieldError && messagesPerField.existsError('password')>
                    <p style="font-size:11px;color:#ef4444;margin-top:4px;">${kcSanitize(messagesPerField.get('password'))?no_esc}</p>
                </#if>
            </div>

            <#-- Attempt counter (shown when field error exists) -->
            <#if hasFieldError>
              <div style="display:flex;align-items:center;gap:6px;margin-top:6px;margin-bottom:4px;">
                <span style="width:8px;height:8px;background:#ef4444;border-radius:50%;display:inline-block;"></span>
                <span style="width:8px;height:8px;background:#ef4444;border-radius:50%;display:inline-block;"></span>
                <span style="font-size:11px;color:#6b7280;margin-left:2px;">
                  <strong style="color:#111827;">2 tentatives</strong> sur 5 — compte bloqué après 5 échecs
                </span>
              </div>
            </#if>

            <#-- Remember me (gauche) + Mot de passe oublié (droite) -->
            <div style="display:flex;align-items:center;justify-content:space-between;margin-top:12px;margin-bottom:20px;">
              <div>
                <#if realm.rememberMe && !usernameEditDisabled??>
                  <div style="display:flex;align-items:center;gap:7px;">
                    <input type="checkbox" id="rememberMe" name="rememberMe"
                           style="width:15px;height:15px;accent-color:#0c1b33;cursor:pointer;flex-shrink:0;"
                           <#if login.rememberMe??>checked</#if> />
                    <label for="rememberMe" style="font-size:13px;color:#6b7280;cursor:pointer;user-select:none;">${msg("rememberMe")}</label>
                  </div>
                </#if>
              </div>
              <#if realm.resetPasswordAllowed>
                <a href="${url.loginResetCredentialsUrl}"
                   style="font-size:12px;font-weight:500;color:#2563eb;text-decoration:none;"
                   onmouseover="this.style.textDecoration='underline'"
                   onmouseout="this.style.textDecoration='none'">${msg("doForgotPassword")}</a>
              </#if>
            </div>

            <#-- Submit button -->
            <button id="fc-btn" type="submit"
                    style="width:100%;height:44px;background:#0c1b33;color:#fff;border:none;border-radius:9px;font-size:14px;font-weight:600;font-family:inherit;cursor:pointer;transition:opacity 0.15s;display:flex;align-items:center;justify-content:center;gap:8px;"
                    onmouseover="if(!this.disabled)this.style.opacity='0.88'"
                    onmouseout="if(!this.disabled)this.style.opacity='1'">
                <span id="fc-btn-text">${msg("doLogIn")}</span>
                <span id="fc-btn-spin" style="display:none;">
                    <svg style="width:18px;height:18px;animation:fc-spin 0.8s linear infinite;" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="12" cy="12" r="10" stroke="rgba(255,255,255,0.25)" stroke-width="3"/>
                        <path d="M12 2a10 10 0 0110 10" stroke="#ffffff" stroke-width="3" stroke-linecap="round"/>
                    </svg>
                </span>
            </button>

            <#-- Registration link -->
            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                <p style="text-align:center;font-size:12px;color:#9ca3af;margin-top:16px;">
                    ${msg("noEsigmapAccount")}
                    <a style="font-weight:500;color:#2563eb;text-decoration:underline;" href="${url.registrationUrl}">${msg("registerLink")}</a>
                </p>
            </#if>

        </form>

        <style>
          @keyframes fc-spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        </style>
        <script>
        function fcSubmit(form) {
            var btn = document.getElementById('fc-btn');
            var txt = document.getElementById('fc-btn-text');
            var spin = document.getElementById('fc-btn-spin');
            if (btn && txt && spin) {
                txt.style.display = 'none';
                spin.style.display = 'flex';
                btn.disabled = true;
                btn.style.opacity = '0.75';
            }
        }
        function fcTogglePwd() {
            var inp = document.getElementById('password');
            var eye = document.getElementById('fc-pwd-eye');
            if (!inp) return;
            if (inp.type === 'password') {
                inp.type = 'text';
                eye.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88"/>';
            } else {
                inp.type = 'password';
                eye.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z"/><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>';
            }
        }
        </script>

    </#if>
</@layout.registrationLayout>
