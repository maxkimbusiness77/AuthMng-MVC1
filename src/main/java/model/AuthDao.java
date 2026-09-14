package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * AuthDao
 * - 사용자 인증 정보를 조회하는 DAO 클래스
 * - 로그인 시 ID와 비밀번호를 기준으로 DB에서 사용자 정보를 확인
 * - 일치하는 사용자가 존재하면 AuthBean 객체로 반환
 * - 존재하지 않으면 null 반환
 */
public class AuthDao {
    public AuthBean login(String id, String password) {
        final String sql = "SELECT ID, USERNAME FROM USERS "
                         + "WHERE ID=? AND PASSWORD=?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    return new AuthBean(
                            rs.getString("id"),
                            rs.getString("username")
                    );
                }
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException("로그인 쿼리 실패", e);
        }
    }
}