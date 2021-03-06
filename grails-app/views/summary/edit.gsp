<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'summary.label', default: 'Summary')}"/>
    <title>
        <g:message code="default.edit.label" args="[entityName]"/>
    </title>
</head>
<body>
<a href="#edit-summary" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>
<div class="nav" role="navigation">
    <ul>
        <li>
            <g:link class="list" action="index">
                רשימת סיכומים
            </g:link>
        </li>
        <li>
            <g:link class="create" action="create">
                יצירת סיכום חדש
            </g:link>
        </li>
    </ul>
</div>
<div id="edit-summary" class="content scaffold-edit" role="main">
    <h1>
        עריכת סיכום
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.summary}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.summary}" var="error">
                <li
                <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>
                >
                <g:message error="${error}"/>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.summary}" method="PUT">
        <g:hiddenField name="version" value="${this.summary?.version}"/>
        <fieldset class="form">
            <f:all bean="summary"/>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
