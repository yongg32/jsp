package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO (data Access Obejct)
//데이터베이스의 데이터에 접근하는 작업
//데이터 엑세스 로직과 비즈니스 로직을 분리하여 사용하기 위함.
public class UserDAO { // 데이터를 조회하는 클래스
	private static UserDAO instance = new UserDAO();
	public static UserDAO gatInstance() {
		return instance;
	}
	private UserDAO() {}
	
	public UserVO loginUser(Connection conn, String id) throws SQLException {
		// userid로 정도 조회
		StringBuffer query = new StringBuffer();
		query.append("SELECT user_id");
		query.append("        ,user_pw");
		query.append("        ,user_nm");
		query.append(" FROM tb_user");
		query.append(" WHERE user_id = ?");
		query.append(" AND use_yn = 'Y' ");
		PreparedStatement ps = conn.prepareStatement(query.toString());
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		UserVO vo = new UserVO();
		while(rs.next()) {
			vo.setUserId(rs.getString("user_id"));
			vo.setUserPw(rs.getString("user_pw"));
			vo.setUserNm(rs.getString("user_nm"));
		}
		if(ps != null) ps.close();
		if(rs != null) rs.close();
		
		
		return vo;
	}
	
	//회원가입
	public int insertUser(Connection conn, UserVO vo) throws SQLException {
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO tb_user (user_id, user_pw, create_dt)");
		query.append("VALUES(?, ?, sysdate) ");
		PreparedStatement ps = conn.prepareStatement(query.toString());
		ps.setString(1, vo.getUserId());
		ps.setString(2, vo.getUserPw());
		int cnt = ps.executeUpdate();
		if(ps != null) ps.close();
		
		return cnt;
	}
}
