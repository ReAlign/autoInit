<@compress>
    <#escape x as x?html>
        <#include "/common/macro.ftl">
    <!DOCTYPE html>
    <html>
    <head>
        <title>404</title>
        <@nekcss/>
        <@css/>
    </head>
    <body>
        <#--<@menus/>-->
        <#--<@pageHead title="404"/>-->
        <#--<div class="g-bd col-sm-10 g-mar-left-2" id="maincnt">-->
        <div class="g-bd col-sm-12" id="maincnt">
            <div class="g-error-page" id="m-cnt">
                <p>404</p>
                <a href="/">去首页看看吧</a>
            </div>
        </div>
        <@nekui/>
    </body>
    </html>
    </#escape>
</@compress>