package Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import space.CommentDTO;

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
		int commentNo = 0;
		try{
			con = ds.getConnection();
			String sql ="insert into comment values(0, ?, 'ddd@gmail.com', ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_no);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			
			con = ds.getConnection();
			sql ="select max(comment_no) from comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				commentNo=rs.getInt(1);
			}
			
		}catch(Exception e){
			System.out.println("insertComment에서 오류"+e);
		}finally{
			freeResource();
		}		
		return commentNo;
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

	public int updateComment(String comment_no, String content) {
		int result = 0;
		try{
			con = ds.getConnection();
			String sql = "update comment set com_content=? where comment_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, Integer.parseInt(comment_no));
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("updateComment에서 오류"+e);
		}finally{
			freeResource();
		}
		return result;
	}

	public void getSelectComment(int startNo, int room_no) {
		JsonObject json = new JsonObject();
		
		try{
			con = ds.getConnection();
			String sql = "select c.comment_no, c.room_no, u.email, "
						+"u.name, c.com_content, c.com_date "
						+"from comment c join user u "
						+"on u.email = c.email "
						+"where room_no=? "
						+"order by com_date desc limit ?, ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_no);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, startNo+10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				json.addProperty("comment_no", rs.getInt(1));
				json.addProperty("room_no", room_no);
				json.addProperty("email", rs.getString(3));
				json.addProperty("name", rs.getString(4));
				json.addProperty("com_content", rs.getString(5));
				json.addProperty("com_date", rs.getDate(6).toString());
				
			}
			
		}catch(Exception e){
			System.out.println("getSelectComment");
		}finally{
			freeResource();
		}
		
	}
	
	
	
	
}
