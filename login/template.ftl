<#import "components/molecules/locale-provider.ftl" as localeProvider>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>

    <#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
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

        <link rel="shortcut icon" href="${url.resourcesPath}/images/favicon.ico" type="image/png" />

        <link rel="apple-touch-icon-precomposed" sizes="152x152"
              href="${url.resourcesPath}/images/logotype/apple-touch-icon-ipad-retina-152x152.png?.0.1.0">
        <link rel="apple-touch-icon-precomposed" sizes="60x60"
              href="${url.resourcesPath}/images/logotype/apple-touch-icon-iphone-60x60.png?.0.1.0">
        <link rel="apple-touch-icon-precomposed" sizes="120x120"
            href="${url.resourcesPath}/images/logotype/apple-touch-icon-iphone-retina-120x120.png?.0.1.0">


        <meta name="viewport" content="width=device-width, initial-scale=1">

        <#-- End Holisticon Template <head> content -->


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

    </head>
    <body class="bg-white h-screen m-0 p-0">
      <div class="h-screen mx-auto w-full">
          <div class="mx-0 md:mx-auto flex lg:justify-center gap-0 flex-col lg:flex-row max-[770px] h-screen font-display">
              <!-- Section gauche - Formulaire -->
              <div class="hidden lg:flex lg:w-[40%] xl:w-[34%] flex-col justify-between p-8 lg:p-10 xl:p-12 relative overflow-hidden xl:m-3 xl:rounded-xl"
                style="background: linear-gradient(160deg, #0c1c35 0%, #0a1628 60%, #0d2040 100%);">

                <!-- Decorative background glows -->
                <div class="absolute top-16 right-8 w-56 lg:w-72 h-56 lg:h-72 rounded-full pointer-events-none"
                    style="background: radial-gradient(circle, rgba(3, 35, 19, 0.15), transparent);"></div>
                <div class="absolute bottom-20 left-4 w-80 lg:w-96 h-80 lg:h-96 rounded-full pointer-events-none"
                    style="background: radial-gradient(circle, rgba(3, 35, 19, 0.15), transparent);"></div>

                <!-- Logo -->
                <div class="relative z-10">
                    <div class="inline-block rounded-xl px-2 py-1 bg-white border border-gray-200">
                        <img src="${url.resourcesPath}/images/reporting/logo-financia%201.png" alt="Financia Capital" class="h-16 lg:h-20 w-auto" />
                    </div>
                </div>

                <!-- Main headline + features -->
                <div class="relative z-10 flex-1 flex flex-col justify-center py-5">
                    <h1 class="text-white font-bold text-3xl lg:text-4xl xl:text-[2.4rem] leading-tight mb-4">
                        Pilotez votre activité en toute confiance
                    </h1>
                    <p class="text-sm lg:text-base mb-8 lg:mb-10" style="color:rgba(255,255,255,0.55);">
                        Gestion de portefeuilles &amp; Reporting consolidé
                    </p>

                    <div class="flex flex-col gap-2.5 lg:gap-3">
                        <div class="flex items-center gap-2 lg:gap-2.5 w-fit rounded-full px-3 lg:px-4 py-1.5 lg:py-2 text-white text-xs lg:text-sm"
                            style="border: 1px solid rgba(255,255,255,0.15); background: rgba(255,255,255,0.05);">
                            <span style="color:#4ade80;" class="text-xs">✦</span>
                            Suivi de portefeuilles en temps réel
                        </div>
                        <div class="flex items-center gap-2 lg:gap-2.5 w-fit rounded-full px-3 lg:px-4 py-1.5 lg:py-2 text-white text-xs lg:text-sm"
                            style="border: 1px solid rgba(255,255,255,0.15); background: rgba(255,255,255,0.05);">
                            <span style="color:#4ade80;" class="text-xs">✦</span>
                            Gestion des dossiers clients
                        </div>
                        <div class="flex items-center gap-2 lg:gap-2.5 w-fit rounded-full px-3 lg:px-4 py-1.5 lg:py-2 text-white text-xs lg:text-sm"
                            style="border: 1px solid rgba(255,255,255,0.15); background: rgba(255,255,255,0.05);">
                            <span style="color:#4ade80;" class="text-xs">✦</span>
                            Reporting consolidé multi-entités
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="relative z-10 text-[10px] lg:text-xs" style="color: rgba(245, 246, 244, 0.35);">
                    © 2026 Financia Capital
                </div>
            </div>

              <!-- Section droite - Image de fond -->
              <div class="w-full h-full lg:w-6/12 bg-white py-5 lg:px-[100px]  lg:px-[180px] sm:px-[80px] md:px-[100px] px-[50px] content-center">
                  <!-- Navigation et langue en haut -->
                  <div class="flex items-end justify-between gap-3 mt-2 md:mt-2">
                      <#nested "back">
                      <span></span>
                      <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                          <@localeProvider.kw currentLocale=locale.current locales=locale.supported />
                      </#if>
                  </div>
                  
                  <!-- Header avec logo Financia Capital -->
                  <div class="flex items-center justify-center gap-3 mt-2 md:mt-2">
                      <div class="lg:hidden flex items-center gap-4 md:gap-4 lg:gap-3">
                          <img src="${url.resourcesPath}/images/reporting/logo-financia%201.png" alt="Financia Capital" class="logo w-38 md:w-32 lg:w-38 xl:w-40"/>
                      </div>
                  </div>

                  <!-- Contenu du formulaire -->
                  <#nested "form">
              </div>
          </div>
      </div>
    </body>
</html>

</#macro>
