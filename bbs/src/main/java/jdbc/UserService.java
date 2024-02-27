package jdbc;

import java.sql.Connection;
import java.sql.SQLException;

// Service 비즈니스 로직을 처리하는 부분
public class UserService {
   private UserDAO dao = UserDAO.gatInstance();
   private ConnectionPool cp = ConnectionPool.getInstance();
   private static UserService instance = new UserService();
   public static UserService getInstance() {
      return instance;
   }
   private UserService() {}
   // 로그인 처리
   public UserVO loginUser(String id,String pw) {
      Connection conn = cp.getConnection();
      try {
         UserVO vo = dao.loginUser(conn, id);
         if(vo.getUserId() != null && vo.getUserPw().equals(pw)) {
         return vo; // 입렵 pw와 db의 pw가 같을때
         }
      } catch(SQLException e) {
         e.printStackTrace();
      }finally {
         if(conn != null) cp.releaseConn(conn); // 사용 후 돌려주기
      }
      return null;
   }   
   // 회원가입
   public int insertUser(UserVO vo) {
      Connection conn = cp.getConnection();
      try {
         return dao.insertUser(conn, vo);
      } catch (SQLException e) {
         System.out.println("중복된 아이디"); //저장이 안되면 중복인 오류남.
      } finally {
         if(conn != null) cp.releaseConn(conn);
      }
      return 0;
      
   }
    //회원정보 조회
      public UserVO userInfo(String id) {
         Connection conn = cp.getConnection();
         try {
            UserVO vo = dao.loginUser(conn, id);
            return vo;
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            if(conn != null)
               cp.releaseConn(conn);
            
         }
         return null;
      }

   

   
}