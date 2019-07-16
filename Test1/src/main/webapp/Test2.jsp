<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null; // Connection 객체 생성
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// JDBC 드라이버 이름을 설정합니다. (DBMS 마다 다릅니다. )
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	// JDBC 드라이버를 사용하여 접속할 URL 입니다.
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	boolean result = false;
	
	try {
		// JDBC 드라이버 이름으로 드라이버를 로드합니다.
		Class.forName(driver);
		
		// 설정했던 JDBC URL을 이용하여 Connection 객체를 얻어 옵니다.
		conn = DriverManager.getConnection(url, "scott", "tiger");
		
		String query = "select ename, floor(sysdate-hiredate) from emp";
		
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery(query);
		
		while(rs.next()) {
			System.out.println(rs.getString(1) + " " + rs.getString(2)+"일");
		}
		
		
	} catch(Exception e) {
		result = false;
		e.printStackTrace();
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>