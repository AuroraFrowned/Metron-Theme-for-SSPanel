                        <div class="p-5" id="auth-stf"></div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var loginConfig = {
                'base_url': "{$base_url}",
                'switch': {
                    'geetest': {if $geetest_html != null}true{else}false{/if},
                    'recaptcha': {if $recaptcha_sitekey != null}true{else}false{/if}
                },
                'telegram': {
                    bot: "{$telegram_bot}",
                    token: "{$login_token}",
                    number: "{$login_number}",
                },
                'register': {
                    'code': {if $config['register_mode'] == 'invite' && $metron['register_code'] === true}true{else}false{/if},
                },
            };
        </script>

        {if $geetest_html != null}
        <script src="//static.geetest.com/static/tools/gt.js"></script>
        <script>
            captcha = '';
            var handlerEmbed = function (captchaObj) {
                captchaObj.onSuccess(function () {
                    validate = captchaObj.getValidate();
                });
                captchaObj.appendTo(".embed-captcha");
                captcha = captchaObj;
            };
            initGeetest({
                gt: "{$geetest_html->gt}",
                challenge: "{$geetest_html->challenge}",
                product: "float",
                width: "100%",
                lang: 'zh-cn',
                offline: {if $geetest_html->success}0{else}1{/if}
            }, handlerEmbed);
        </script>
        {/if}

        {if $recaptcha_sitekey != null}
            <script src="https://recaptcha.net/recaptcha/api.js" async defer></script>
        {/if}

        <script src="{$metron['assets_url']}/plugins/global/plugins.bundle.js"></script>
        <script src="{$metron['assets_url']}/js/metron-plugin.js"></script>
        <script src="{$metron['assets_url']}/js/scripts.js"></script>
        <script src="{$metron['assets_url']}/js/auth.js"></script>

        <script>
            jQuery(document).ready(function () {
                $('#auth-stf').html(window.atob('PHNwYW4+PGEgaHJlZj0iL3N0YWZmIiB0YXJnZXQ9Il9ibGFuayIgY2xhc3M9InRleHQtd2hpdGUgZm9udC13ZWlnaHQtYm9sZCI+U1RBRkY8L2E+PC9zcGFuPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHNwYW4+PGEgaHJlZj0iaHR0cHM6Ly90Lm1lL21ldHJvbl90aGVtZSIgdGFyZ2V0PSJfYmxhbmsiIGNsYXNzPSJ0ZXh0LXdoaXRlIGZvbnQtd2VpZ2h0LWJvbGQgbWwtNSI+TWV0cm9uPC9hPjwvc3Bhbj4='));
            });
        </script>

        {if $metron['enable_cust_auth'] === true}
        {if $metron['enable_cust'] === 'crisp' && $metron['crisp_id'] != ''}
        {include file='include/global/crisp.tpl'}
        {else if $metron['enable_cust'] === 'chatra' && $metron['chatra_id'] != ''}
        {include file='include/global/chatra.tpl'}
        {/if}
        {/if}