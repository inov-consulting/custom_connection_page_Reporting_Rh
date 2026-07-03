<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "back">
        <a class="link-back" href="${url.loginUrl}">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
          </svg>
        </a>
    <#elseif section = "form">

      <h2 class="text-center font-poppins font-semibold text-2xl mt-5 text-gray-800 mb-[10px]">${msg("registerWithTitle2")}</h2>

      <p class="text-gray-700 text-center font-poppins mb-[40px]" style="font-size:13px;">
          ${msg("registerWithText2")}
      </p>

      <form action="${url.registrationAction}" method="post">
        <div class="py-2">
            <#if !realm.registrationEmailAsUsername>
              <label for="username" class="block">
                  <span  class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                    ${msg("createUsername")}
                  </span>
                  <input id="username" type="text" data-qa="username" value="${(register.formData.username!'')}" name="username" placeholder="${msg("username")}" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" readonly />
              </label>
              <#if messagesPerField.existsError('username')>
                <span  class="text-red-800 text-xs position: absolute" aria-live="polite">
                      ${kcSanitize(messagesPerField.get('username'))?no_esc}
                  </span>
              </#if>
            </#if>
        </div>

        <div class="py-2">
          <label for="firstName" class="block">
                  <span  class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                    ${msg("firstName")}
                  </span>
            <input type="text" id="firstName" data-qa="firstName" value="${(register.formData.firstName!'')}" name="firstName" placeholder="" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
          </label>
            <#if messagesPerField.existsError('firstName')>
              <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
              </span>
            </#if>
        </div>

        <div class="py-2">
          <label for="lastName" class="block">
                  <span  class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                    ${msg("lastName")}
                  </span>
            <input type="text" id="lastName" data-qa="lastName" value="${(register.formData.lastName!'')}" name="lastName" placeholder="" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
          </label>
            <#if messagesPerField.existsError('lastName')>
              <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
              </span>
            </#if>
        </div>

        <div class="py-2">
          <label for="email" class="block">
                  <span  class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                    ${msg("email")}
                  </span>
            <input type="email" id="email" data-qa="email" value="${(register.formData.email!'')}" name="email" placeholder="examle@domain.abc" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
          </label>
            <#if messagesPerField.existsError('email')>
              <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('email'))?no_esc}
              </span>
            </#if>
        </div>

        <#if passwordRequired>

          <div class="py-2">
            <label for="password" class="block">
                  <span  class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                    ${msg("createPassword")}
                  </span>
              <input type="password" id="password" data-qa="password" name="password" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
            </label>
              <#if messagesPerField.existsError('password')>
                <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('password'))?no_esc}
              </span>
              </#if>
          </div>

          <div class="py-2">
            <label for="password-confirm" class="block">
                  <span  class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                    ${msg("passwordConfirm")}
                  </span>
              <input type="password" id="password-confirm" data-qa="password" name="password-confirm" class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500" />
            </label>
              <#if messagesPerField.existsError('password-confirm')>
                <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
              </span>
              </#if>
          </div>
        </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>
        <div class="pb-2 mt-3">
          <button  type="submit"
                   class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
          >
              ${msg("doRegister")}
          </button>
        </div>

        </form>
    </#if>
</@layout.registrationLayout>
