package Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {

	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 커넥션 풀을 담을 변수 선언
	DataSource ds = null;
	// 생성자
	public CommentDao() {
		// TODO Auto-generated constructor stub
		try {
			// 1. Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트 객체 생성
			Context init = new InitialContext();
			// 2. 연결된 Was서버에서 DataSource(커넥션 풀)을 검색해서 얻기
			ds = (DataSource)init.lookup("java:comp/env/jdbc/ShareSpace");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("커넥션풀 가져오기 실패 : "+e);
		}
	}// 생성자 끝
	
	// 리소스 반납(해제) 메서드
	public void freeResource(){
		if(rs != null){
			try {
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}if(pstmt != null){
			try {
				pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}if(con != null){
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
	}

	public int deleteComment(int commentNo) {
		int result = 0;
		try{
			con = ds.getConnection();
			String sql ="delete from comment where comment_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("deleteComment에서 오류"+e);
		}finally{
			freeResource();
		}
		return result;
	}

	public int insertComment(int room_no, String content) {
		int result = 0;
		try{
			con = ds.getConnection();
			String sql ="insert into comment values(0, ?, 'ddd@gmail.com', ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_no);
			pstmt.setString(2, content);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("insertComment에서 오류"+e);
		}finally{
			freeResource();
		}		
		return result;
	}
	/* email받을때 
	public int insertComment(int room_no, String email, String content) {
		int result = 0;
		try{
			con = ds.getConnection();
			String sql ="insert into comment values(0, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_no);
			pstmt.setString(2, email);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("insertComment에서 오류"+e);
		}finally{
			freeResource();
		}		
		return result;
	}*/
	
	
	
	
}
