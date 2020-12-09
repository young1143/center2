<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>참가자 등수 조회</h3>

<%@ page import="java.sql.*"%>

<table border="1">
<tr>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>총점</td>
	<td>평균</td>
	<td>등수</td>
</tr>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	
	String query = "SELECT " +
		    "ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, sum(POINT.POINT), avg(POINT.POINT) " +
		    "FROM " +
		    "    tbl_artist_201905 ARTIST, TBL_POINT_201905 POINT " +
		    "WHERE " +
		    "    POINT.ARTIST_ID = ARTIST.ARTIST_ID " +
		    "GROUP BY ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME " +
		    "ORDER BY AVG(POINT.POINT) DESC";
	
	ResultSet rs = stmt.executeQuery(query);
	
	int rank = 0;
	while (rs.next()) {
		rank += 1;
		%> 
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getInt(3) %></td>
				<td><%=String.format("%.2f", rs.getFloat(4)) %></td>
				<td><%=rank %></td>
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