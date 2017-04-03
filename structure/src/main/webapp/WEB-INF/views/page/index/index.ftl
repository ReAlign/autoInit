<@compress>
    <#escape x as x?html>
        <#include "/common/macro.ftl">
    <!DOCTYPE html>
    <html>
    <head>
        <title>首页</title>
        <@nekcss/>
        <@css/>
    </head>
    <body>
        <@menus/>
        <@pageHead/>
        <@nekui/>
        <!-- @NOPARSE -->
            <#noescape>

            </#noescape>
        <!-- /@NOPARSE -->
        <script src="${jslib}define.js?pro=${jspro}"></script>
        <script src="${jspro}page/index/index.js"></script>
    </body>
    </html>
    </#escape>
</@compress>