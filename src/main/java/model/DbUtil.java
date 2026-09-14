package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 데이터베이스 연결 클래스
 * JDBC 드라이버 로드 후 DB Connection 객체를 생성해 반환
 */
public class DbUtil {
	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private static final String URL="jdbc:oracle:thin:@//localhost:1521/XEPDB1";
	private static final String USER = "LOGIN";
	private static final String PASS = "123456";
	
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}