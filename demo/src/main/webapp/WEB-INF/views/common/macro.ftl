<#include "/common/config.ftl">
<#include "/common/function.ftl">
<#macro nekcss>
<!-- @NOPARSE -->
<link rel="stylesheet" href="//unpkg-kl.netease.com/nek-ui/dist/css/nek-ui.red.min.css"/>
<!-- /@NOPARSE -->
</#macro>
<#macro css>
<#--mcss处理的bootstrap.mcss 数值样式会精度丢失,暂时引用源css-->
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- @STYLE -->
<link href="${jsRoot}lib/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${csRoot}base.css" rel="stylesheet" type="text/css"/>
</#macro>

<#macro nekui>
<!-- @NOPARSE -->
<script src="//unpkg-kl.netease.com/nek-ui/dist/vendor/regular.min.js"></script>
<script src="//unpkg-kl.netease.com/nek-ui/dist/js/nek-ui.min.js"></script>
<!-- /@NOPARSE -->
</#macro>

<#macro menus  menuList=menu![] userName=user.username!''  urlCurrentMenus=urlCurrentMenus!['index', '']>
<div class="g-sd g-left-menu" id="sidebar">
    <div class="u-logo">
        <a href="/">
            <img src="/res/images/logo2.png" alt="考拉海淘－售后系统">
        </a>
        <h4>售后系统</h4>
        <p ><span class="acct">${userName}</span></p>
        <div class="f-cb">
            <p class="col-sm-7 col"></p>
            <p class="col-sm-5 col"><a href="/logout.do" class="f-toe">退出</a></p>
        </div>
    </div>
    <div class="m-snav">
        <ul class="nav" id="nav">
            <li class="snav_item <#if  urlCurrentMenus[0] == 'index'> active</#if>">
                <a href="/index.do" class="index-page">
                    <span class="glyphicon glyphicon-home"></span>
                    <span data-href="/index.do" class="index-page">首页</span>
                </a>
            </li>
            <#list  menuList as m>
                <li class="snav_item<#if urlCurrentMenus[0] == m.url> active</#if>">
                    <a href="javascript:;" class="j-firstnav">
                        <span class="glyphicon glyphicon-${m.note!}"></span>
                        <span>${m.name!}</span>
                        <span class="glyphicon glyphicon-chevron-<#if (urlCurrentMenus[0]==m.url)>up<#else>down</#if> pull-right"></span>
                    </a>
                    <ul class='nav'>
                        <#if m.childsList??>
                            <#list m.childsList as child>
                                <li class='<#if urlCurrentMenus[1] == child.url>active</#if>'>
                                    <a href="/<#if m.url == 'index'>index<#else>${m.url!}/${child.url!}</#if>.do">${child.name!}</a>
                                </li>
                            </#list>
                        </#if >
                    </ul>
                </li>
            </#list>
        </ul>
    </div>
    <div class="toggle j-toggle">
        <span class="icon"></span>
    </div>
</div>
    <#nested>
<script>
    <#if refundAuthorization??>
    var refundAuthorization = ${refundAuthorization}||{};
    </#if>
</script>
</#macro>
<#macro breadcrumb>
<#--该面包屑导航只适用 该页面权限存在与菜单配置栏里的，若是其他3级权限页面，请自行手动硬编码导航-->
<ol class="breadcrumb">
    <#if parentMenu??>
        <li><a href="${currentMenu.url!'javascript:void(0);'}">${parentMenu.name!""}</a></li>
    </#if>
    <#if currentMenu??>
        <li><a href="${currentMenu.url!'javascript:void(0);'}">${currentMenu.name!""}</a></li>
    </#if>
    <#nested>
</ol>
</#macro>
<#macro pageHead title="首页">
<div class="g-bd g-mar-left-2 u-ofy-auto u-ofx-hidden" id="maincnt">
    <div class="f-trbl0 f-pa f-mr0">
        <div class="f-trbl0 f-lr15">
            <h2 class="u-page-title b-rds-3">
                <span class="glyphicon pull-right"></span>
                ${title!}
            </h2>
            <div id="app" class="g-inject-app"></div>
        </div>
    </div>
</div>
</#macro>
