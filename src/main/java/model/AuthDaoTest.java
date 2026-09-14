package model;

public class AuthDaoTest {
	public static void main(String[] args) {
		AuthDao dao = new AuthDao();
		String id = "maxkim1234";
		String password = "1234";
		
		AuthBean user = dao.login(id, password);
		
		if (user!=null) {
			System.out.println("로그인 성공!");
			System.out.println("ID:" + user.getId());
			System.out.println("ID:" + user.getUsername());
		}else {			
			System.out.println("로그인 실패!");
		}
	}
}
