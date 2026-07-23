<#import "components/molecules/locale-provider.ftl" as localeProvider>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>

    <#assign LANG_CODE = "fr">
    <#if .locale??>
        <#assign LANG_CODE = .locale>
    </#if>
    <#if locale??>
        <#list locale.supported>
            <#items as supportedLocale>
                <#if supportedLocale.label == locale.current>
                    <#if supportedLocale.url?contains("?kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                    </#if>
                    <#if supportedLocale.url?contains("&kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                    </#if>
                </#if>
            </#items>
        </#list>
    </#if>

    <!--[if lt IE 9]>
    <html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
    <!--[if gt IE 8]><!-->
    <html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}" />
            </#list>
        </#if>
        <title><#nested "title"> - ${realm.displayName!'Financia Capital'}</title>
        <link rel="shortcut icon" href="${url.resourcesPath}/images/favicon.ico" type="image/ico" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <style>
          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
          html, body { min-height: 100vh; }
          body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
          }
          .fc-outer {
            width: 100%;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 32px 16px;
          }
          .fc-card {
            width: 100%;
            max-width: 960px;
            display: flex;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 4px 40px rgba(0,0,0,0.10), 0 1px 6px rgba(0,0,0,0.06);
            min-height: 540px;
          }
          /* Left: white form panel */
          .fc-form-panel {
            flex: 1 1 100%;
            display: flex;
            flex-direction: column;
            background: #ffffff;
          }
          /* Right: dark navy stats panel (hidden on mobile) */
          .fc-right-panel { display: none; }

          @media (min-width: 1024px) {
            .fc-form-panel { flex: 0 0 44%; }
            .fc-right-panel {
              display: flex;
              flex: 1;
              flex-direction: column;
            }
          }

          .fc-logo-bar {
            padding: 28px 36px 0;
          }
          .fc-logo {
            display: flex;
            align-items: center;
            gap: 9px;
            text-decoration: none;
          }
          .fc-logo img { height: 26px; width: auto; display: block; }

          .fc-locale-bar {
            padding: 10px 36px 0;
            display: flex;
            justify-content: flex-end;
          }

          .fc-form-wrap {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 28px 36px;
          }
          .fc-form-inner {
            width: 100%;
            max-width: 400px;
          }

          .fc-footer {
            padding: 0 36px 24px;
            font-size: 11px;
            color: #9ca3af;
            line-height: 1.6;
          }
          .fc-footer a { color: #9ca3af; text-decoration: underline; }
          .fc-footer a:hover { color: #6b7280; }
          .fc-tls {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-top: 6px;
            font-size: 11px;
            color: #9ca3af;
          }
          .fc-tls-dot {
            width: 7px; height: 7px;
            background: #22c55e;
            border-radius: 50%;
            flex-shrink: 0;
          }

          /* ── Right panel ── */
          .fc-stats-panel {
            padding: 36px 32px;
            background: linear-gradient(160deg, #0c1c35 0%, #0a1628 60%, #0d2040 100%);
            display: flex;
            flex-direction: column;
          }

          .fc-portfolio-card {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.09);
            border-radius: 14px;
            padding: 20px 22px 16px;
            margin-bottom: 16px;
          }
          .fc-portfolio-label {
            font-size: 10px;
            font-weight: 600;
            color: rgba(255,255,255,0.45);
            letter-spacing: 0.12em;
            text-transform: uppercase;
            margin-bottom: 8px;
          }
          .fc-portfolio-amount {
            font-size: 34px;
            font-weight: 700;
            color: #fff;
            letter-spacing: -0.03em;
            line-height: 1.1;
            margin-bottom: 5px;
          }
          .fc-portfolio-trend {
            font-size: 13px;
            color: #4ade80;
            font-weight: 500;
            margin-bottom: 14px;
          }
          .fc-sparkline {
            width: 100%;
            height: 44px;
            display: block;
            overflow: visible;
          }

          .fc-stats-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 9px;
            margin-bottom: 24px;
          }
          .fc-stat-card {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 10px;
            padding: 13px 11px;
          }
          .fc-stat-label {
            font-size: 8px;
            font-weight: 600;
            color: rgba(255,255,255,0.4);
            letter-spacing: 0.09em;
            text-transform: uppercase;
            margin-bottom: 5px;
            line-height: 1.3;
          }
          .fc-stat-value {
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            letter-spacing: -0.02em;
            line-height: 1.1;
            margin-bottom: 3px;
          }
          .fc-stat-sub {
            font-size: 10px;
            color: rgba(255,255,255,0.35);
            line-height: 1.3;
          }

          .fc-marketing {
            margin-top: auto;
          }
          .fc-badge {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 100px;
            padding: 5px 13px;
            font-size: 10px;
            font-weight: 600;
            color: rgba(255,255,255,0.75);
            letter-spacing: 0.08em;
            text-transform: uppercase;
            margin-bottom: 14px;
          }
          .fc-badge-dot {
            width: 7px; height: 7px;
            background: #22c55e;
            border-radius: 50%;
            flex-shrink: 0;
          }
          .fc-marketing-title {
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            line-height: 1.35;
            letter-spacing: -0.02em;
            margin-bottom: 9px;
          }
          .fc-marketing-sub {
            font-size: 13px;
            color: rgba(255,255,255,0.55);
            line-height: 1.6;
          }
        </style>
    </head>

    <body>
      <div class="fc-outer">
        <div class="fc-card">

          <!-- LEFT: White form panel -->
          <div class="fc-form-panel">

            <div class="fc-logo-bar">
              <div class="fc-logo">
                <img src="${url.resourcesPath}/images/reporting/logo-financia%201.png" alt="Financia Capital" />
              </div>
            </div>

            <#if realm.internationalizationEnabled && locale?? && locale.supported?size gt 1>
              <div class="fc-locale-bar">
                <@localeProvider.kw currentLocale=locale.current locales=locale.supported />
              </div>
            </#if>

            <div class="fc-form-wrap">
              <div class="fc-form-inner">
                <#nested "form">
              </div>
            </div>

            <div class="fc-footer">
              <p>Accès réservé aux utilisateurs autorisés. <a href="#">Conditions d'utilisation</a> &middot; <a href="#">Confidentialité</a></p>
              <div class="fc-tls">
                <span class="fc-tls-dot"></span>
                <span>Connexion sécurisée TLS 1.3</span>
              </div>
            </div>
          </div>

          <!-- RIGHT: Dark navy stats panel -->
          <div class="fc-right-panel fc-stats-panel">

            <div class="fc-badge">
              <span class="fc-badge-dot"></span>
              Espace RH Sécurisé
            </div>

            <div class="fc-portfolio-card">
              <p class="fc-portfolio-label">Heures suivies ce mois</p>
              <p class="fc-portfolio-amount">3 240 h</p>
              <p class="fc-portfolio-trend">▲ +6 % vs mois dernier</p>
            </div>

            <div class="fc-stats-grid">
              <div class="fc-stat-card">
                <p class="fc-stat-label">Collaborateurs Actifs</p>
                <p class="fc-stat-value">62</p>
                <p class="fc-stat-sub">+4 ce mois</p>
              </div>
              <div class="fc-stat-card">
                <p class="fc-stat-label">Dossiers En Cours</p>
                <p class="fc-stat-value">48</p>
                <p class="fc-stat-sub">3 secteurs</p>
              </div>
              <div class="fc-stat-card">
                <p class="fc-stat-label">Taux de Validation</p>
                <p class="fc-stat-value">91 %</p>
                <p class="fc-stat-sub">vs 86 % N-1</p>
              </div>
            </div>

            <div class="fc-marketing">
              <p class="fc-marketing-title">Pilotez la charge de vos équipes, en toute confiance</p>
              <p class="fc-marketing-sub">Gestion des dossiers clients et pilotage des équipes réunis dans un seul espace.</p>
            </div>

          </div>
        </div>
      </div>
    </body>
    </html>
</#macro>
