<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}"/>
    <title>
        <g:message code="default.show.label" args="[entityName]"/>
    </title>
</head>
<body>
<a href="#show-supplier" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<div class="nav" role="navigation">
    <ul>
        <li>
            <g:link class="list" action="index">
                רשימת ספקים
            </g:link>
        </li>
        <li>
            <g:link class="create" action="create">
                יצירת ספק חדש
            </g:link>
        </li>
    </ul>
</div>
<div id="show-supplier" class="content scaffold-show" role="main">
    <h1>
        פרטי ספק
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="supplier"/>
    <g:form resource="${this.supplier}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.supplier}">
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
