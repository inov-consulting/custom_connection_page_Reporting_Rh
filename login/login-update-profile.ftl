<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <#if section = "header">
    ${msg("loginProfileTitle")}
  <#elseif section = "form">

    <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("loginProfileTitle")}</h2>
    <form id="kc-update-profile-form" action="${url.loginAction}" method="post">

        <#if messagesPerField.existsError('username','password')>
          <span class="text-red-800 text-xs" aria-live="polite">
                    ${kcSanitize(messagesPerField.getFirstError('username','email','password'))?no_esc}
            </span>
        </#if>
      <#if user.editUsernameAllowed>
      <div class="py-3">
        <label for="username" class="block">
                      <span
                        class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700"
                      >
                      ${msg("username")}
                      </span>
          <input type="text" id="username" data-qa="username" value="${(user.username!'')}" name="username" placeholder="${msg("username")}" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" readonly /> </label>
          <#if messagesPerField.existsError('username')>
            <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('username'))?no_esc}
              </span>
          </#if>
      </div>

      </#if>


      <div class="py-3">
        <label for="email" class="block">
                      <span
                        class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700"
                      >
                      ${msg("email")}
                      </span>
          <input type="email" id="email" data-qa="email" value="${(user.email!'')}" name="email" placeholder="${msg("username")}" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" readonly /> </label>
          <#if messagesPerField.existsError('email')>
            <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('email'))?no_esc}
              </span>
          </#if>
      </div>

      <div class="py-3">
        <label for="firstName" class="block">
                      <span
                        class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700"
                      >
                      ${msg("firstName")}
                      </span>
          <input type="text" id="firstName" data-qa="firstName" value="${(user.firstName!'')}" name="firstName" placeholder="${msg("firstName")}" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500"  /> </label>
          <#if messagesPerField.existsError('firstName')>
            <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
              </span>
          </#if>
      </div>

      <div class="py-3">
        <label for="firstName" class="block">
                      <span
                        class="after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700"
                      >
                      ${msg("lastName")}
                      </span>
          <input type="text" id="firstName" data-qa="firstName" value="${(user.lastName!'')}" name="lastName" placeholder="${msg("lastName")}" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500"  /> </label>
          <#if messagesPerField.existsError('lastName')>
            <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
              </span>
          </#if>
      </div>

      <div class="py-1 flex justify-center">
        <button  type="submit"
                 class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
        >
            ${msg("doSubmit")}
        </button>

      </div>

    </form>
  </#if>
</@layout.registrationLayout>
