<#import "reset-flow-layout.ftl" as layout>
<@layout.resetFlowLayout step=3; section>
  <#if section = "form">
    <div class="success-badge">
      <div class="success-badge-icon" aria-hidden="true">
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
      </div>
      Identité vérifiée avec succès
    </div>

    <p class="form-eyebrow">Étape 3 sur 3</p>
    <h2 class="form-title">${msg("passwordResetTitle")}</h2>
    <p class="form-desc" style="margin-bottom:24px;">${msg("passwordResetDesc")}</p>

    <form id="kc-passwd-update-form" action="${url.loginAction}" method="post" onsubmit="return validatePasswordForm(event);">
      <div class="field">
        <label class="field-label" for="pw-new">${msg("passwordNew")}</label>
        <div class="field-wrap">
          <span class="field-pre" aria-hidden="true">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>
          </span>
          <input
            id="pw-new"
            name="password-new"
            class="field-input"
            type="password"
            placeholder="Minimum 8 caractères"
            autocomplete="new-password"
            required
            minlength="8"
            oninput="checkPw(this.value); validatePasswordForm();"
          />
        </div>

        <div class="pw-strength-bar">
          <div class="pw-seg" id="seg1"></div>
          <div class="pw-seg" id="seg2"></div>
          <div class="pw-seg" id="seg3"></div>
          <div class="pw-seg" id="seg4"></div>
        </div>
        <div class="pw-label" id="pw-label" aria-live="polite"></div>
      </div>

      <div class="pw-rules" role="list" aria-label="Critères du mot de passe">
        <div class="pw-rule" id="r-len" role="listitem">
          <div class="pw-rule-icon" aria-hidden="true"><svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></div>
          8 caractères minimum
        </div>
        <div class="pw-rule" id="r-maj" role="listitem">
          <div class="pw-rule-icon" aria-hidden="true"><svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></div>
          Une lettre majuscule
        </div>
        <div class="pw-rule" id="r-num" role="listitem">
          <div class="pw-rule-icon" aria-hidden="true"><svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></div>
          Un chiffre
        </div>
        <div class="pw-rule" id="r-spe" role="listitem">
          <div class="pw-rule-icon" aria-hidden="true"><svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></div>
          Un caractère spécial (!@#$…)
        </div>
      </div>

      <div class="field">
        <label class="field-label" for="pw-confirm">${msg("passwordNewConfirm")!msg("passwordConfirm")}</label>
        <div class="field-wrap">
          <span class="field-pre" aria-hidden="true">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>
          </span>
          <input
            id="pw-confirm"
            name="password-confirm"
            class="field-input"
            type="password"
            placeholder="Répétez le mot de passe"
            autocomplete="new-password"
            required
            oninput="validatePasswordForm();"
          />
          <span id="confirm-error" class="text-red-800 text-xs" aria-live="polite" style="display:none; margin-top:6px;"></span>
        </div>
      </div>

      <button type="submit" id="kc-submit" class="btn-primary" style="background:##0c1b33;">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>
        ${msg("doSubmit")}
      </button>
    </form>

    <script>
      function updateRuleState(id, ok) {
        var rule = document.getElementById(id);
        if (rule) {
          rule.classList.toggle('ok', !!ok);
        }
      }

      function updateStrengthSegments(value) {
        var segments = [document.getElementById('seg1'), document.getElementById('seg2'), document.getElementById('seg3'), document.getElementById('seg4')];
        var score = 0;
        if (value.length >= 8) score++;
        if (/[A-Z]/.test(value)) score++;
        if (/\d/.test(value)) score++;
        if (/[^A-Za-z0-9]/.test(value)) score++;

        segments.forEach(function (seg, index) {
          seg.classList.remove('weak', 'medium', 'strong');
          if (!value) {
            return;
          }
          if (score <= 2) {
            if (index < 2) seg.classList.add('weak');
          } else if (score === 3) {
            if (index < 3) seg.classList.add('medium');
          } else {
            if (index < 4) seg.classList.add('strong');
          }
        });
      }

      function checkPw(value) {
        var len = value.length >= 8;
        var maj = /[A-Z]/.test(value);
        var num = /\d/.test(value);
        var spe = /[^A-Za-z0-9]/.test(value);
        var label = document.getElementById('pw-label');

        updateRuleState('r-len', len);
        updateRuleState('r-maj', maj);
        updateRuleState('r-num', num);
        updateRuleState('r-spe', spe);
        updateStrengthSegments(value);

        if (!value) {
          if (label) label.textContent = '';
          return false;
        }

        var score = [len, maj, num, spe].filter(Boolean).length;
        if (score <= 2) {
          if (label) label.textContent = 'Mot de passe faible';
        } else if (score === 3) {
          if (label) label.textContent = 'Mot de passe moyen';
        } else {
          if (label) label.textContent = 'Mot de passe fort';
        }

        return len && maj && num && spe;
      }

      function validatePasswordForm(event) {
        var password = document.getElementById('pw-new');
        var confirm = document.getElementById('pw-confirm');
        var submitBtn = document.getElementById('kc-submit');
        var errorEl = document.getElementById('confirm-error');

        if (!password || !confirm) {
          return true;
        }

        var passwordValue = password.value || '';
        var confirmValue = confirm.value || '';
        var meetsRules = checkPw(passwordValue);
        var matches = passwordValue.length > 0 && passwordValue === confirmValue;
        var formValid = meetsRules && matches;

        if (submitBtn) {
          submitBtn.disabled = !formValid;
          submitBtn.style.opacity = formValid ? '1' : '0.7';
          submitBtn.style.cursor = formValid ? 'pointer' : 'not-allowed';
        }

        if (errorEl) {
          if (!passwordValue) {
            errorEl.textContent = 'Veuillez saisir un mot de passe.';
            errorEl.style.display = 'block';
          } else if (!meetsRules) {
            errorEl.textContent = 'Le mot de passe ne respecte pas toutes les conditions.';
            errorEl.style.display = 'block';
          } else if (!matches) {
            errorEl.textContent = 'Les mots de passe ne correspondent pas.';
            errorEl.style.display = 'block';
          } else {
            errorEl.textContent = '';
            errorEl.style.display = 'none';
          }
        }

        if (event && !formValid) {
          event.preventDefault();
          return false;
        }

        return formValid;
      }

      document.addEventListener('DOMContentLoaded', function () {
        validatePasswordForm();
      });
    </script>
  </#if>
</@layout.resetFlowLayout>
