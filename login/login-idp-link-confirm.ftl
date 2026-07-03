<#import "template.ftl" as layout>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/form.ftl" as form>

<@layout.registrationLayout; section>
  <#if section="header">
    ${msg("confirmLinkIdpTitle")}
  <#elseif section="form">

    <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("ipsLinkTitle")} </h2>
    <@form.kw action=url.loginAction method="post">
      <div class="py-2 flex justify-center">
        <button  type="submit"
                 name="submitAction"
                 id="linkAccount"
                 value="linkAccount"
                 class="w-full  text-[#E09119] px-3 py-2.5 text-sm font-semibold focus-visible:outline focus-visible:outline-2  focus-visible:outline-green-600"
        >
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 inline">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244" />
          </svg>

            ${msg("confirmLinkIdpContinue", idpDisplayName)}
        </button>

      </div>
      <div class="py-1 flex justify-center">
        <p class="pt-1 separate text-center text-secondary-600 text-sm">
            ${msg("or")}
        </p>
      </div>
      <div class="py-1 flex justify-center">
        <button  type="submit"
                 name="submitAction"
                 id="updateProfile"
                 value="updateProfile"
                 class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
        >
            ${msg("confirmLinkIdpReviewProfile")}
        </button>


      </div>
    </@form.kw>
  </#if>
</@layout.registrationLayout>
