<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.notice.dto.Notice,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%-- <%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
%> --%>

<style>
<style>
    /* 초기에는 모든 팝업을 숨깁니다. */
    tr#popup {
        display: none;
    }

    /* 팝업이 보여질 때의 스타일을 지정합니다. */
    tr#popup.show {
        display: block;
    }

    /* 팝업 토글 버튼을 스타일링합니다. */
    tr#titleId {
        cursor: pointer;
        background-color: #f0f0f0; /* 팝업 토글 영역을 강조합니다. */
    }
</style>


</style>

<section id="notice-container">
	<h2>공지사항</h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
			List<Notice> notices=(List<Notice>)request.getAttribute("notices");
			if(notices !=null){
				for(int i=0; i<notices.size(); i++){
					Notice notice=notices.get(i);
		%>
		<tr id=titleId>
			<td><%=(i+1)%></td>
			<td><%= notice.getNoticeTitle()%></td>
			<td><%= notice.getNoticeEnrolldate() %></td>
		</tr>
		<tr id=popup>
			<td><%=notice.getNoticeContent() %></td>
		</tr>
		<%
				}
			}
		%>				
		</tbody>
	</table>
</section>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // Get all tr elements with the id "titleId"
    var titleRows = document.querySelectorAll("tr#titleId");
    
    // Add click event listeners to each title row
    titleRows.forEach(function(row) {
        row.addEventListener("click", function() {
            // Toggle visibility of elements with id "popup"
            var popupElements = document.querySelectorAll("#popup");
            popupElements.forEach(function(popup) {
                // Check if the popup is currently visible
                var isVisible = popup.style.display !== "none";
                
                // Toggle visibility based on current state
                popup.style.display = isVisible ? "none" : "block";
            });
        });
    });
});

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>