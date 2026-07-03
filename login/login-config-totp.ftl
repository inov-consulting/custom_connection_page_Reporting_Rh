<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
  <#if section = "title">
    ${msg("loginTotpTitle")}
  <#elseif section = "header">
    ${msg("loginTotpTitle")}
  <#elseif section = "form">
    <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("loginTotpTitle")}</h2>
    <ol class="login-config-totp">
      <li>
        <p class="text-gray-700 text-sm">${msg("loginTotpStep1")}</p>

        <div class="grid mt-4 mb-4 grid-cols-3">

          <div class="ml-1  p-2 items-center border border-secondary-200 flex justify-start py-2 rounded-lg ">
            <div class="max-[40px] inline">
              <img class="rounded-lg" width="40px" height="40px" src="${url.resourcesPath}/images/google_auth.png"/>
            </div>
            <div class="flex pl-2">
              <h3 class="text-sm" ><a target="_blank" href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=fr&gl=US">Google Authenticator</a></h3>
            </div>
          </div>


          <div class="ml-1  p-2 items-center  border border-secondary-200 flex justify-start py-2 rounded-lg ">
            <div class="max-[40px] inline">
              <img class="rounded-lg" width="40px" height="40px" src="${url.resourcesPath}/images/authy.png"/>
            </div>
            <div class="flex pl-2">
              <h3 class="text-sm" ><a  target="_blank" href="https://authy.com/download/">Microsoft Authenticator</a></h3>
            </div>
          </div>

          <div class="ml-1  p-2  items-center  border border-secondary-200 flex justify-start py-2 rounded-lg ">
            <div class="max-[40px]">
              <img class="rounded-lg" width="40px" height="40px" src="${url.resourcesPath}/images/free_otp.png"/>
            </div>
            <div class="flex pl-2">
              <h3 class="text-sm" ><a  target="_blank" href="https://freeotp.github.io/">Free OTP</a></h3>
            </div>
          </div>

        </div>
      </li>
      <li>
        <p class="text-gray-700 text-sm">
          ${msg("loginTotpStep2")}
          <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br />
          <span class="code">${totp.totpSecretEncoded}</span>
        </p>
      </li>
      <li>
        <p>${msg("loginTotpStep3")}</p>
      </li>
    </ol>
    <form action="${url.loginAction}" class="mt-1" id="kc-totp-settings-form" method="post">
        <#if messagesPerField.existsError('totp')>
          <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('totp'))?no_esc}
              </span>
        </#if>
      <input type="hidden" id="totp" name="totp" autocomplete="off" class="holi-input-field" autofocus placeholder="${msg("loginTotpOneTime")}"/>
      <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />

      <div class="py-4 flex justify-center">
        <div id="otp" class="flex flex-row justify-center text-center px-2 mt-5">
          <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="first" maxlength="1" />
          <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="second" maxlength="1" />
          <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="third" maxlength="1" />
          <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="fourth" maxlength="1" />
          <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="fifth" maxlength="1" />
          <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="sixth" maxlength="1" />
        </div>

      </div>
      <div class="pb-2 mt-3">
        <button  type="submit"
                 class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
        >
            ${msg("doSubmit")}
        </button>
      </div>

    </form>
  </#if>
</@layout.registrationLayout>
