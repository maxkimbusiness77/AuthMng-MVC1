package model;

/**
 * AuthBean
 * - 사용자 인증 정보를 담는 데이터 객체
 * - 로그인 및 프로필에서 사용자 정보를 전달하기 위한 모델 클래스
 * - DTO 역할을 하며 getter/setter를 통해 데이터를 관리
 */
public class AuthBean {

    private String id;
    private String username;
    private String password;

    public AuthBean(String id, String username) {
        this.id = id;
        this.username = username;
    }

    public AuthBean(String id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}