<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true"%>

    <%-- ${ answer = "Hello,World" ; ''}
    ${ answer } --%>
    
    ${ result = (a,b) -> a > b ? a: b ; ''}
    
    ${ result(4,8) } 