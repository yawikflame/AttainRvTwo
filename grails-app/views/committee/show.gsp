<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'committee.label', default: 'Committee')}"/>
    <title>
        <g:message code="default.show.label" args="[entityName]"/>
    </title>
</head>
<body>
<a href="#show-committee" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<div class="nav" role="navigation">
    <ul>
        <li>
            <g:link class="list" action="index">
                רשימת ועדות
            </g:link>
        </li>
        <li>
            <g:link class="create" action="create">
                יצירת ועדה חדשה
            </g:link>
        </li>
    </ul>
</div>
<div id="show-committee" class="content scaffold-show" role="main">
    <h1>
        פרטי הועדה
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="committee"/>
    <g:form resource="${this.committee}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.committee}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
