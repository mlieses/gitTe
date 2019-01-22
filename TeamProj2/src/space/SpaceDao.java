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
				ds = (DataSource)init.lookup("java:comp/env/jdbc/ShareSpace");
				
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
		HOptionDTO hoDto;
		HPicDTO hpDto;
		HostDTO hostDto;
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
				hdto.setHost_id(rs.getString(1));
				hdto.setRoom_no(num);
				hdto.setSubject(rs.getString(3));
				hdto.setRoom(rs.getString(4));
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
				
				hoDto = new HOptionDTO();
				hoDto.setParking(rs.getInt(23));
				hoDto.setWifi(rs.getInt(24));
				hoDto.setProjector(rs.getInt(25));
				hoDto.setLaptop(rs.getInt(26));
				hoDto.setCabinet(rs.getInt(27));
				list.add(hoDto);
				
				hpDto = new HPicDTO();
				hpDto.setPic1(rs.getString(29));
				hpDto.setPic2(rs.getString(30));
				hpDto.setPic3(rs.getString(31));
				hpDto.setPic4(rs.getString(32));
				hpDto.setPic5(rs.getString(33));
				list.add(hpDto);
				
			}
			con = ds.getConnection();
			sql="select * "
			  + "from host "
			  + "where host_id = (select host_id"
			  +					" from hosting "
			  + 				" where room_no=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				hostDto = new HostDTO();
				hostDto.setHost_id(rs.getString(1));
				hostDto.setEmail(rs.getString(2));
				hostDto.setHost_nic(rs.getString(3));
				hostDto.setHost_phone(rs.getString(4));
				hostDto.setHost_level(rs.getInt(5));
				list.add(hostDto);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getErrorCode());
			System.out.println("getSpace에서 오류남"+e);

		}finally {
			freeResource();
		}
		return list;
	}

	public ArrayList getNoDate() {
		ArrayList noList = new ArrayList();
		try{
		con = ds.getConnection();
		String sql = "select b.book_date "
					+"from (select * from booking where book_check=0) b "
					+"join booking_time bt "
					+"on b.book_no = bt.book_no and "
					+"b.book_date = bt.book_date "
					+"where bt.t10 in(1) and bt.t11 in(1) and bt.t12 in(1) and bt.t13 in(1) and bt.t14 in(1) and bt.t15 in(1) and bt.t16 in(1) and bt.t17 in(1) and bt.t18 in(1) and bt.t19 in(1) and bt.t20 in(1) and bt.t21 in(1)";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			noList.add(rs.getDate(1).toString());
			System.out.println(rs.getDate(1).toString());
		}
		}catch(Exception e){
			System.out.println("getNoDate에서 에러"+e);
		}finally{
			freeResource();
		}
		return noList;
	}
	
	
		
		

}
