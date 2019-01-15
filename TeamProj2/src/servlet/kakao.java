package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class kakao
 */
@WebServlet("/kakao")
public class kakao extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 移댁뭅�삤�넚�뿉�꽌 �젒�냽 REST API CODE瑜� 諛쏆븘�샂
		String code = request.getParameter("code");
		
		System.out.println("code : "+code);
		
		String appKey = "7bed2c2cc35da2f635429b5665085d84";
		
		String redirectURI = "http://localhost:8181/TeamProj/kakao";
		
		String line = null;
		
		String access_token = null;
		
		String refresh_token = null;
		
		try {
			    
			   URL url = new URL("https://kauth.kakao.com/oauth/token");
			   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			   conn.setDoOutput(true);
			   conn.setRequestMethod("POST");
			   conn.setRequestProperty("Accept-Language",  "ko-kr,ko;q=0.8,en-us;q=0.5,en;q=0.3");
			  
			   
			   String param = URLEncoder.encode("grant_type", "UTF-8") + "=" + URLEncoder.encode("authorization_code", "UTF-8");
			   param += "&" + URLEncoder.encode("client_id", "UTF-8") + "=" + URLEncoder.encode(appKey, "UTF-8");
			   param += "&" + URLEncoder.encode("redirect_uri", "UTF-8") + "=" + URLEncoder.encode(redirectURI, "UTF-8");
			   param += "&" + URLEncoder.encode("code", "UTF-8") + "=" + URLEncoder.encode(code, "UTF-8");
			   
			   // 보내기
			   OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
			   osw.write(param);
			   osw.flush();
			 
			   
			   BufferedReader br = null;
			   br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			   
			   while ((line = br.readLine()) != null) {
			    System.out.println(line);			    
			    
				JsonParser jsonParser = new JsonParser();
				
				JsonObject obj =(JsonObject) jsonParser.parse(line);
				
				access_token = obj.get("access_token").getAsString();
				
				refresh_token = obj.get("refresh_token").getAsString();
				
				System.out.println("access_token : "+access_token);
				
				System.out.println("refresh_token : "+refresh_token);
			    
			   }		  
			  
			   
			   osw.close();
			   br.close();
			  
			   
		   } catch (MalformedURLException e) {
		    e.printStackTrace();
		   } catch (ProtocolException e) {
		    e.printStackTrace();
		   } catch (UnsupportedEncodingException e) {
		    e.printStackTrace();
		   } catch (IOException e) {
		    e.printStackTrace();			  			
		   } 
			  
	 try {  			
		   System.out.println("access_token : "+access_token);
		   
		   URL url = new URL("https://kapi.kakao.com/v2/user/me");					   
		   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		   conn.setDoOutput(true);
		   conn.setRequestMethod("POST");
		   //conn.setRequestProperty("Accept-Language",  "ko-kr,ko;q=0.8,en-us;q=0.5,en;q=0.3");
		   conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");		   
		   conn.setRequestProperty("Authorization", "Bearer " + access_token );
		   
		   String param = URLEncoder.encode("Bearer", "UTF-8") + "=" + URLEncoder.encode(access_token, "UTF-8");
		   /*param += "&" + URLEncoder.encode("property_keys", "UTF-8") + "=" + URLEncoder.encode("['kakao_account.has_email']", "UTF-8");*/
		  
		   	   
		   OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
		   osw.write(param);
		   osw.flush();
		 
		   
		   
		   BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		   
		   line = null;
		   while ((line = br.readLine()) != null) {
		    System.out.println(line);			    
		   }
		    
		   
		   osw.close();
		   br.close();
		   
 	   } catch (MalformedURLException e) {
	    e.printStackTrace();
	   } catch (ProtocolException e) {
	    e.printStackTrace();
	   } catch (UnsupportedEncodingException e) {
	    e.printStackTrace();
	   } catch (IOException e) {
	    e.printStackTrace();			  			
	   } 
	 
	   response.setContentType("text/html; charset:UTF-8"); 
	   
	   PrintWriter out = response.getWriter();
		   
		   out.println("<script>");
		   out.println("opener.document.location.reload();");
		   out.println("self.close();");		   
		   out.println("</script>");
		   
		
		
	}

}
