package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DB.DAO;
import DB.HostingAddressDTO;
import DB.HostingBillDTO;
import DB.HostingDTO;
import DB.HostingOptionDTO;
import DB.HostingPicDTO;
import user.HostDTO;


@WebServlet("/updateBoardController2.do")
public class updateBoardController2 extends HttpServlet {



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");
		
	
		ArrayList saveFile = new ArrayList();
		
		
		ArrayList originFile = new ArrayList();
		

		String savePath = request.getRealPath("/upload"); 
		int sizeLimit = 100 * 1024 * 1024;
		
		String room_no =""; 
		String fileName = "";
		String originalFileName = "";	
		String subject ="";
		String room = "";
		String people = "";
		String address ="";
		String postNum ="";
		String detailAddress ="";
		String etcAddress ="";
		String wdo ="";
		String kdo = "";
		String content="";
		String img="";
		String img1="";
		String img2="";
		String img3="";
		String etc ="";
		String host_id="";
		String origin_img1 ="";
		String origin_img2 ="";
		String origin_img3 ="";
		String origin_img4 ="";
		int weekday = 0;
		int holiday = 0;
		int parking = 0;
		int wifi = 0; 
		int toilet = 0;
		int drink = 0;
		int airconditioner = 0;
		int elevator = 0;
		int heating =0;
		int socket = 0;
		int cabinet = 0;
		int projector = 0;
		int laptop = 0;


		try {

			MultipartRequest multi = 
			        new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
										 new DefaultFileRenamePolicy());
						
			Enumeration formNames = multi.getFileNames(); 
			
					
			room_no = multi.getParameter("room_no");
			subject = multi.getParameter("subject");
			room = multi.getParameter("room");
			people = multi.getParameter("people");
			address = multi.getParameter("address");
			postNum = multi.getParameter("postNum");
			detailAddress =multi.getParameter("detailAddress");
			etcAddress = multi.getParameter("etcAddress");
			wdo = multi.getParameter("Wdo");
			kdo = multi.getParameter("Kdo");			
			content = multi.getParameter("content");
			etc = multi.getParameter("etc");
			weekday =  Integer.parseInt(multi.getParameter("weekday"));
			holiday =  Integer.parseInt(multi.getParameter("holiday"));
			parking = Integer.parseInt(multi.getParameter("parking"));
			wifi = Integer.parseInt(multi.getParameter("wifi"));
			toilet = Integer.parseInt(multi.getParameter("toilet"));
			drink = Integer.parseInt(multi.getParameter("drink"));
			airconditioner = Integer.parseInt(multi.getParameter("airconditioner"));
			socket = Integer.parseInt(multi.getParameter("socket"));
			heating = Integer.parseInt(multi.getParameter("heating"));
			elevator = Integer.parseInt(multi.getParameter("elevator"));
			projector = Integer.parseInt(multi.getParameter("projector"));
			laptop = Integer.parseInt(multi.getParameter("laptop"));
			cabinet = Integer.parseInt(multi.getParameter("cabinet"));
			
			

			String alive_img1 = "";
			String alive_img2 = ""; 
			String alive_img3 = "";
			String alive_img4 = ""; 
			
			if(multi.getParameter("alive_img1") != null){
				alive_img1 = multi.getParameter("alive_img1");
			}if(multi.getParameter("alive_img2") != null){
				alive_img2 = multi.getParameter("alive_img2");
			}if(multi.getParameter("alive_img3") != null){
				alive_img3 = multi.getParameter("alive_img3");
			}if(multi.getParameter("alive_img4") != null){
				alive_img4 = multi.getParameter("alive_img4");
			}
					
			
			if(multi.getParameter("alive_img1") == null){
				origin_img1 = multi.getParameter("origin_img1");
				File file = new File(savePath+origin_img1);
				file.delete();
			}
			if(multi.getParameter("alive_img2") == null ){
				origin_img2 = multi.getParameter("origin_img2");
				File file1 = new File(savePath+origin_img2);
				file1.delete();

			}
			if(multi.getParameter("alive_img3") == null ){
				origin_img3 = multi.getParameter("origin_img3");
				File file2 = new File(savePath+origin_img3);
				file2.delete();


			}
			if(multi.getParameter("alive_img4") == null ){
				origin_img4 = multi.getParameter("origin_img4");
				File file3 = new File(savePath+origin_img4);
				file3.delete();
			}
			
									
			while(formNames.hasMoreElements()){
				
				String formName = (String) formNames.nextElement(); 
				fileName = multi.getFilesystemName(formName); 
				saveFile.add(fileName);
				originalFileName = multi.getOriginalFileName(formName); 
				originFile.add(originalFileName);
			}
		
			
			if (fileName == null) { 		
				
				System.out.println("�뙆�씪 �씠由꾩씠 �뾾�쓬.");
				
			} 
			
			for(int i=0 ; i< saveFile.size();i++){
				
				if(i == 0){img = (String)saveFile.get(i);}				
				else if(i == 1){
					img1 = (String)saveFile.get(i);}	
				
				else if(i == 2){
					img2 = (String)saveFile.get(i);}

				
				else if(i == 3){
					img3 = (String)saveFile.get(i);}								
			}
						
			
		
			if(img.equals("") || img == null){
				img = alive_img1;
			}if(img1.equals("") || img1 == null){
				img1 = alive_img2;
			}if(img2.equals("") || img2 == null){
				img2 = alive_img3;
			}if(img3.equals("") || img3 == null){
				img3 = alive_img4;
			}						
			
			
			//Hosting
			HostingDTO dto = new HostingDTO();
			dto.setPeople(people);			
			dto.setContent(content);
			dto.setRoom(room);
			dto.setSubject(subject);
			dto.setAirconditioner(airconditioner);
			dto.setDrink(drink);
			dto.setElevator(elevator);
			dto.setEtc(etc);
			dto.setHeating(heating);
			dto.setHost_id(host_id);
			dto.setSocket(socket);
			dto.setToilet(toilet);
			dto.setRoom_no(Integer.parseInt(room_no));
			
			
			//HostingBill
			HostingBillDTO dto1 = new HostingBillDTO();
			dto1.setWeekday(weekday);
			dto1.setHoliday(holiday);
			
			//HostingOption 
			HostingOptionDTO dto2 = new HostingOptionDTO();
			dto2.setCabinet(cabinet);
			dto2.setParking(parking);
			dto2.setWifi(wifi);
			dto2.setLaptop(laptop);
			dto2.setProjector(projector);
			
			
			//HostingPic
			HostingPicDTO dto3 = new HostingPicDTO();
			dto3.setPic1(img);
			dto3.setPic2(img1);
			dto3.setPic3(img2);
			dto3.setPic4(img3);
			
			//HostingAddress 
			HostingAddressDTO dto4 = new HostingAddressDTO();
			dto4.setA_address(address);
			dto4.setA_D_address(detailAddress);
			dto4.setA_etc_address(etcAddress);
			dto4.setA_woo(postNum);
			dto4.setA_wdo(wdo);
			dto4.setA_kdo(kdo);
			
			
			DAO dao = new DAO();
			dao.update(dto,dto1,dto2,dto3,dto4);			
		
			HttpSession session = request.getSession();
			HostDTO hdto =	(HostDTO)session.getAttribute("hdto");
			String hostId =	hdto.getHost_id();

		
			
			RequestDispatcher dis =		
					request.getRequestDispatcher("/Jong/MyPageDetail.jsp?HostId="+hostId);
			
		
		dis.forward(request, response); 

			

		} catch (Exception e) {
			System.out.println("updateController2에서 오류" + e);
			} //catch		

	
	}

}

