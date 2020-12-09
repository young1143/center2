<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>참가자 목록 조회</h3>

<%@ page import="java.sql.*"%>

<table border="1">
<tr>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>생년월일</td>
	<td>성별</td>
	<td>특기</td>
	<td>소속사</td>
</tr>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT ARTIST_ID, ARTIST_NAME, ARTIST_BIRTH, " +
									     "ARTIST_GENDER, TALENT, AGENCY " +
									 "FROM "+ 
									     "TBL_ARTIST_201905");
	while (rs.next()) {
		String talent = null;
		switch(rs.getString(5)) {
		case "1":
			talent = "보컬";
			break;
		case "2":
			talent = "댄스";
			break;
		case "3":
			talent = "랩";
			break;
		}
		
		String year = rs.getString(3).substring(0, 4);
		String month = rs.getString(3).substring(4, 6);
		String day = rs.getString(3).substring(6, 8);
		
		%> 
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=String.format("%s년 %s월 %s일", year, month, day) %></td>
				<td><%=rs.getString(4).equals("F") ? "여" : "남" %></td>
				<td><%=talent %></td>
				<td><%=rs.getString(6) %></td>
			</tr>
		
		<%
	
	}
	stmt.close();
	con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>
</table>