<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이마켓 건의함</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section>
		<table>
			<tr>
					<td>${suggest.ce_date }</td>	
					<td>${suggest.ce_title }</td>	
					<td>${suggest.ce_id }	</td>
						
			</tr>
		</table>
</section>

<%@ include file="../includes/footer.jsp" %>