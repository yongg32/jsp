package jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

//ConnectionFactory로부터 maxConn만큼 conn객체를 생성해서 풀(당구)에 보관하는 클래스
public class ConnectionPool {
   //Vector는 동기화(Synchronized)가 적용된 arrayList
   private static Vector<Connection> pool = new Vector<>();
   //시스템에서 하나의 pool만 공유되도록 싱글톤패턴적용
   private static ConnectionPool instance = new ConnectionPool();
   public static ConnectionPool getInstance(){
      return instance;
   }
   private ConnectionPool() {
      try {
         initPool();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   // 1. 풀에서 사용가능한 연결을 가져오는 메서드, 사용가능한 연결이 없을 경우 wait()
   public synchronized Connection getConnection() {
      if(pool.size()==0) {
         try {
            System.out.println("가능한 연결이 없음... wait.....");
            wait();
         }catch(InterruptedException e) {
            e.printStackTrace();
         }
      }
      Connection conn = pool.get(0);
      pool.remove(0);
      return conn;
   }
   // 2. 사용이 끝난 연결을 풀에 다시 반환하는 메서드
   public synchronized void releaseConn(Connection conn) {
      System.out.println("사용 끝남");
      pool.add(conn);
      notify();   // wait를 깨움
   }
   // 3. 시스템이 끝나면 모든 연결을 닫는
   private synchronized void destroyPool() throws SQLException {
      for(int i = 0; i < pool.size(); i++) {
         pool.get(i).close();
      }
      pool.clear();
   }
   // 4. 최초에 초기화하는 메서드
   private synchronized void initPool() throws SQLException {
      destroyPool();
      ConnectionFactory factory = ConnectionFactory.getInstance();
      int maxConn = factory.getMaxConn();
      for(int i = 0; i < maxConn; i ++) {
         pool.add(factory.getConnection());   // 연결 후 담기
      }
   }
public void releascConnection(Connection conn) {
	// TODO Auto-generated method stub
	
}
}