<!DOCTYPE html>
<html xmlns:g="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Purchase')}"/>
    <title>
        <g:message code="default.list.label" args="[entityName]"/>
    </title>
</head>
<body>
<a href="#list-purchase" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<div class="nav" role="navigation">
    <ul>
        <li>
            <g:link class="create bg-success text-white" action="create" controller="purchase">בקשה חדשה</g:link>
        </li>
        <li>
            <g:link class="create bg-info text-white" action="showCompletedPurchases" controller="purchase">בקשות
                שהושלמו
            </g:link>
        </li>
        <li>
            <g:link class="create bg-info text-white" action="index" controller="summary">סיכומי ישיבות</g:link>
        </li>
    </ul>
</div>
<div id="list-purchase" class="content scaffold-list" role="main">
    <h1>
        רשימת בקשות
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${purchaseList}"
             properties="['name','status','departmentApproval','accountantApproval','communityApproval','ceoApproval']"/>

    <div class="pagination">
        <g:paginate total="${purchaseCount ?: 0}"/>
    </div>
</div>
</body>
</html>