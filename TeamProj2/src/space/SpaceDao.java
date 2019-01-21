package space;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SpaceDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 커넥션 풀을 담을 변수 선언
		DataSource ds = null;
		// 생성자
		public SpaceDao() {
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

	public List getSpace(int num) {
		ArrayList list = new ArrayList();
		HostingDTO hdto;
		HAddressDTO haDto;
		HBillDTO hbDto;
		HOptionDTO hoDTO;
		HPicDTO hpDTO;
		try {
			con = ds.getConnection();
			String sql = "select * "
						+"from hosting h "
						+"join hosting_address ha "
						+"on h.room_no=ha.room_no "
						+"join hosting_bill hb "
						+"on h.room_no=hb.room_no "
						+"join hosting_option ho "
						+"on h.room_no=ho.room_no "
						+"join hosting_pic hp "
						+"on h.room_no=hp.room_no "
						+"where h.room_no=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				hdto=new HostingDTO();
				hdto.setHost_no(rs.getInt(1));
				hdto.setRoom_no(num);
				hdto.setSubject(rs.getString(3));
				hdto.setRoom(rs.getString(4));
				System.out.println(rs.getString(4));
				hdto.setPeople(rs.getInt(5));
				hdto.setDrink(rs.getInt(6));
				hdto.setElevator(rs.getInt(7));
				hdto.setToilet(rs.getInt(8));
				hdto.setAirconditioner(rs.getInt(9));
				hdto.setHeating(rs.getInt(10));
				hdto.setSocket(rs.getInt(11));
				list.add(hdto);
				
				haDto=new HAddressDTO();
				haDto.setA_wdo(rs.getString(13));
				haDto.setA_kdo(rs.getString(14));
				haDto.setA_woo(rs.getString(15));
				haDto.setA_address(rs.getString(16));
				haDto.setA_D_address(rs.getString(17));
				haDto.setA_etc_address(rs.getString(18));
				list.add(haDto);
				
				hbDto = new HBillDTO();
				hbDto.setRoom_day(rs.getInt(20));
				hbDto.setRoom_sum(rs.getInt(21));
				list.add(hbDto);
				
				hoDTO = new HOptionDTO();
				hoDTO.setParking(rs.getInt(23));
				hoDTO.setWifi(rs.getInt(24));
				hoDTO.setProjector(rs.getInt(25));
				hoDTO.setLaptop(rs.getInt(26));
				hoDTO.setCabinet(rs.getInt(27));
				list.add(hoDTO);
				
				hpDTO = new HPicDTO();
				hpDTO.setPic1(rs.getString(29));
				hpDTO.setPic2(rs.getString(30));
				hpDTO.setPic3(rs.getString(31));
				hpDTO.setPic4(rs.getString(32));
				hpDTO.setPic5(rs.getString(33));
				list.add(hpDTO);
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.getErrorCode());
			System.out.println("getSpace에서 오류남"+e);

		}freeResource();
		return list;
	}
	
	/*
		public void getSpace(int num){
			try {
				con = ds.getConnection();
				String sql = "select * from hosting where room_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					System.out.println(rs.getString("room"));
				}
			}catch(Exception e){
				e.printStackTrace();
				
			}freeResource();
			
		}
		
		*/
		
		

}
