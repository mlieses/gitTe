package userDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class UserDAO {
	
	// DB 작업 객체
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 커넥션 풀을 담을 변수 선언
	DataSource ds = null;
	// 생성자
	public UserDAO() {
		// TODO Auto-generated constructor stub
		try {
			// 1. Was서버와 연결된 웹프로젝트의 모든정보를 가지고 있는 컨텍스트 객체 생성
			Context init = new InitialContext();
			// 2. 연결된 Was서버에서 DataSource(커넥션 풀)을 검색해서 얻기
			ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("커넥션풀 가져오기 실패 : "+e);
		}
	}// 생성자 끝
	
	// 리소스 반납(해제) 메서드
	public void freeResource(){
		if(con != null){
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
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
		}
	}
	// 사용자 로그인시 등록된 계정이 있는지 유무
	public int userCheck(String email, String pass) {
		// TODO Auto-generated method stub
			int check=-1;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT pass FROM user WHERE email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			System.out.println("email : "+email+" pass : "+pass);
			
			rs = pstmt.executeQuery();
			
			System.out.println(pstmt.toString());
			
			boolean row = rs.next();
			
			System.out.println("row : "+row);
			
			if(row){
				System.out.println("rs.getString('pass') : " +rs.getString("pass"));
				if(rs.getString("pass").equals(pass)){
					
					check = 1;
					
				}else{
					
					check = 0;
				}
				
			}		
			
		} catch (Exception e) {
			System.out.println("userCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
		
		return check;
	}

	public UserDTO getUser(String email) {
		
		UserDTO udto = new UserDTO();
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM user WHERE email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);		
			
			rs = pstmt.executeQuery();		
			
			rs.next();		
			
			udto.setEmail(rs.getString("email"));
			udto.setPass(rs.getString("pass"));
			udto.setName(rs.getString("name"));
			udto.setHost(rs.getInt("host"));
			udto.setPoint(rs.getInt("point"));
			
			
			
		} catch (Exception e) {
			System.out.println("userCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		
		return udto;
	}
	
	public boolean insertUser(UserDTO udto) {
		boolean result = false;
		try {
			
			con = ds.getConnection();
			
			String sql = "INSERT user(email,name,pass,host,point) VALUES(?,?,?,0,0)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, udto.getEmail());
			pstmt.setString(2, udto.getName());
			pstmt.setString(3, udto.getPass());
			
			int row = pstmt.executeUpdate();
			
			if(row >= 1){
				result = true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return result;
	}
	
	public boolean getEmail(String email) {
		
		boolean flag = false;
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM user WHERE email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);		
			
			rs = pstmt.executeQuery();		
			
			flag = rs.next();
			
			
		
		} catch (Exception e) {
			System.out.println("userCheck() 메서드에서 "+e);
		} finally {
			freeResource();
		}
		
		return flag;
		
		
	}

	public JSONObject getarticles() {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();;
		JSONObject oneSpace;
		try {
			
			
			con = ds.getConnection();
			String sql = "select * from map_test";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				oneSpace = new JSONObject();
				oneSpace.put("id", String.valueOf(rs.getInt(1)));
				oneSpace.put("name", rs.getString("name"));
				oneSpace.put("lat", Float.parseFloat(rs.getString("lat")));
				oneSpace.put("lng", Float.parseFloat(rs.getString("lon")));
				jsonArray.add(oneSpace);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		jsonObject.put("positions", jsonArray);
		return jsonObject;
	}
	
	
	
	
	
}
