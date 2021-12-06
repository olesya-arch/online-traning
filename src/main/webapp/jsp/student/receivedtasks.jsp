<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${locale}" scope="session"/>
<fmt:setBundle basename="pagecontent" var="rb" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Available courses</title>
</head>
<body>
<jsp:include page="../../jsp/student/parts/header.jsp"/>

<H1 align="center"><fmt:message key="label.receivedtasks.title" bundle="${rb}"/></H1>

<div class="container theme-showcase" role="main">
    <div class="col-md-4"></div>
    <div class="col-md-4">
    </div>
    <div class="col-md-4"></div>
    <div class="row">
        <div class="col-md-12">

            <br/>
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <th><fmt:message key="label.receivedtasks.tasktitle" bundle="${rb}"/></th>
                    <th><fmt:message key="label.receivedtasks.taskdescription" bundle="${rb}"/></th>
                    <th><fmt:message key="label.receivedtasks.taskmark" bundle="${rb}"/></th>
                    <th><fmt:message key="label.receivedtasks.teachercomment" bundle="${rb}"/></th>
                    <th width="80"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.receivedTasks}" var="task">
                    <tr>
                        <td>${task.title}</td>
                        <td>${task.description}</td>
                        <td>
                            <c:choose>
                                <c:when test="${task.taskreview.mark eq 0}">
                                    <fmt:message key="label.receivedtasks.tasknotreviewed" bundle="${rb}"/>
                                </c:when>
                                <c:otherwise>
                                    ${task.review.mark}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${task.review.review}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="../../jsp/student/parts/footer.jsp"/>
</body>
</html>