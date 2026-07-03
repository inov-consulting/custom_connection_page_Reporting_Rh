<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "back">
      <a class="link-back" href="${url.loginUrl}">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
        </svg>
      </a>
    <#elseif section = "form">
      <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("emailVerificationTitle")}</h2>

      <div class="py-3" role="alert">
        <div class="flex">
          <div class="py-2">
            <svg class="h-6 w-6 mr-4 text-[#E09119]" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <div>
            <p class="text-gray-700 text-sm">${msg("emailVerifyInstruction1",user.email)?no_esc}</p>
            <p class="text-gray-700  mt-1  text-sm">${msg("emailVerifyInstruction2")}  <a class="text-green-600" href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}</p>
          </div>
        </div>
      </div>


    <#elseif section = "info">
        <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("emailVerificationTitle")}</h2>

        <div class="py-3" role="alert">
          <div class="flex">
            <div class="py-2"><svg class=" h-6 w-6 text-[#E09119] mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" />
              </svg>

              <div>
                <p class="text-gray-700 text-sm">${msg("emailVerifyInstruction2")}  <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}</p>
              </div>
            </div>
          </div>

    </#if>
</@layout.registrationLayout>
