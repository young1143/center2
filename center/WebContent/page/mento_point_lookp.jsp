<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>멘토 점수 조회</h3>

<%@ page import="java.sql.*"%>

<table border="1">
<tr>
	<td>채점번호</td>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>생년월일</td>
	<td>점수</td>
	<td>평점</td>
	<td>멘토</td>
</tr>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT " + 
							 	 	 "    POINT.SERIAL_NO, ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, artist.artist_birth, " + 
								 	 "    POINT.POINT, mento.mento_name " + 
									 "FROM " + 
									 "    TBL_MENTO_201905 MENTO, TBL_POINT_201905 POINT, TBL_ARTIST_201905 ARTIST " + 
									 "WHERE " + 
									 "    MENTO.MENTO_ID = POINT.MENTO_ID AND " + 
									 "    POINT.ARTIST_ID = ARTIST.ARTIST_ID");
	while (rs.next()) {
		String year = rs.getString("artist_birth").substring(0, 4);
		String month = rs.getString("artist_birth").substring(4, 6);
		String day = rs.getString("artist_birth").substring(6, 8);
		
		String rate = null;
		int point = rs.getInt(5);
		if (point >= 90) {
			rate = "A";
		}
		else if (point >= 80) {
			rate = "B";
		}
		else if (point >= 70) {
			rate = "C";
		}
		else if (point >= 60) {
			rate = "D";
		}
		else {
			rate = "F";
		}
		
		%> 
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=String.format("%s년 %s월 %s일", year, month, day) %></td>
				<td><%=rs.getInt(5) %></td>
				<td><%=rate %></td>
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