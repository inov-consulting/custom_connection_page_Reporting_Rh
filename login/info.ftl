<#import "template_login.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${message.summary}
    <#elseif section = "form">

        <#-- Mail icon -->
        <div style="display:flex;justify-content:center;margin-bottom:20px;">
            <div style="width:56px;height:56px;background:#f0fdf4;border-radius:50%;display:flex;align-items:center;justify-content:center;">
                <svg style="width:26px;height:26px;color:#22c55e;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75"/>
                </svg>
            </div>
        </div>

        <h2 style="font-size:22px;font-weight:700;color:#111827;letter-spacing:-0.02em;text-align:center;margin-bottom:10px;">Consultez votre boîte mail</h2>

        <p style="font-size:13px;color:#6b7280;text-align:center;line-height:1.6;margin-bottom:20px;">
            ${kcSanitize(message.summary)?no_esc}
        </p>

        <#-- Required actions list -->
        <#if requiredActions??>
            <ul style="list-style:none;padding:0;margin:0 0 20px;">
                <#list requiredActions as reqAction>
                    <li style="font-size:13px;color:#6b7280;padding:4px 0;">${msg("requiredAction.${reqAction}")}</li>
                </#list>
            </ul>
        </#if>

        <#-- Security notice -->
        <div style="display:flex;align-items:flex-start;gap:10px;padding:12px 14px;background:#eff6ff;border:1px solid #bfdbfe;border-radius:10px;margin-bottom:24px;">
            <svg style="width:15px;height:15px;color:#3b82f6;flex-shrink:0;margin-top:1px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z"/>
            </svg>
            <p style="font-size:12px;color:#1d4ed8;line-height:1.5;">Pour des raisons de sécurité, ce message s'affiche même si l'adresse n'existe pas dans notre système.</p>
        </div>

        <#-- Return to login button -->
        <#if pageRedirectUri??>
            <a href="${pageRedirectUri}"
               style="display:flex;align-items:center;justify-content:center;gap:8px;width:100%;height:44px;background:#0c1b33;color:#fff;border-radius:9px;font-size:14px;font-weight:600;text-decoration:none;font-family:inherit;">
                <svg style="width:15px;height:15px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"/>
                </svg>
                Retour à la connexion
            </a>
        <#elseif client?? && client.baseUrl?has_content>
            <a href="${client.baseUrl}"
               style="display:flex;align-items:center;justify-content:center;gap:8px;width:100%;height:44px;background:#0c1b33;color:#fff;border-radius:9px;font-size:14px;font-weight:600;text-decoration:none;font-family:inherit;">
                <svg style="width:15px;height:15px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"/>
                </svg>
                Retour à la connexion
            </a>
        <#else>
            <a href="${url.loginUrl!''}"
               style="display:flex;align-items:center;justify-content:center;gap:8px;width:100%;height:44px;background:#0c1b33;color:#fff;border-radius:9px;font-size:14px;font-weight:600;text-decoration:none;font-family:inherit;">
                <svg style="width:15px;height:15px;" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"/>
                </svg>
                Retour à la connexion
            </a>
        </#if>

        <#-- Action link (proceed, etc.) -->
        <#if actionUri??>
            <div style="text-align:center;margin-top:14px;">
                <a href="${actionUri}" style="font-size:13px;color:#6b7280;text-decoration:none;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">
                    ${msg("proceedWithAction")?no_esc}
                </a>
            </div>
        </#if>

        <#-- Resend email link if login URL is available -->
        <#if !actionUri?? && !pageRedirectUri?? && url.loginUrl??>
            <div style="text-align:center;margin-top:14px;">
                <a href="${url.loginUrl}" style="font-size:13px;color:#6b7280;text-decoration:none;" onmouseover="this.style.color='#374151'" onmouseout="this.style.color='#6b7280'">
                    Renvoyer l'e-mail
                </a>
            </div>
        </#if>

    </#if>
</@layout.registrationLayout>
