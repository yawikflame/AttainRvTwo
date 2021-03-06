<!DOCTYPE html>
<html xmlns:g="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>
        <g:message code="default.list.label" args="[entityName]"/>
    </title>
    <style type="text/css">
        label{
            float:right;
        }
        input{
            margin-left:10px;
            margin-bottom:10px;
        }
        input.btn {
            float:right;
        }


    </style>
</head>
<body>
<h1 class="mx-auto" style="width: 300px;">ברוכים הבאים למערכת לניהול הרכש ביישוב</h1>

<g:if test="${flash.message}">
    <div class="message mx-auto text-center" style="width: 300px;">
        ${flash.message}
    </div>
</g:if>
<g:if test="${session.user}">
</g:if>
<g:else>
    <g:form action="login">
        <div class="container" style="width:300px">
            <label>שם משתמש</label>
            <input type="text" dir="rtl" placeholder="הכנסת שם משתמש" name="username"/>
            <label>סיסמה</label>
            <input type="password" dir="rtl" placeholder="הכנסת סיסמה" name="password"/>
            <input class="btn bg-info" type="submit" value="כניסה למערכת"/>
            <input class="btn bg-danger" type="button" value="שחזור סיסמה"
                   onclick="alert('לצורך איפוס הסיסמה פנה למזכירות הישוב')">
        </div>
    </g:form>
</g:else>
</body>
</html>