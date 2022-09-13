package kr.co.ictedu.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
public class LoginController2 {
	//네이버로그인
	String apiURL;
	@Autowired
	private LoginService service;
	
	
	@RequestMapping( value = "/login/callback", method = RequestMethod.GET )
	public String  callback(HttpServletRequest request, MemberDTO dto, PrintWriter out, HttpSession session ) throws UnsupportedEncodingException {
		//여기서 받고
		String clientId = "QvRj8WrRD8KDfZX6YYiy";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "mSnNP6S48l";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8081/ictedu/login/callback", "UTF-8");//자신의 CallBack URL";
		//client_id값과 client_secret값 그리고 위 code, state값을 합하여 access_token을 발급 받기위한 apiURL을 생성
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
				
		String access_token = "";
		String refresh_token = "";
				
		// 네이버와 apiURL을 통해서 연결 후 access_token, refresh_token, token_type, expires_in 를 받아 그 중 access_token만 token 변수에 저장
	
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			// apiURL 연결
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("네이버로 부터 받응 응답 코드인 responseCode는 : "+responseCode);
			System.out.println("응답 코드 200이 정상");
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if(responseCode==200) {
				System.out.println("");
				System.out.println("");
				System.out.println(" 네이버와 통신 후  access_token, refresh_token, token_type, expires_in정보를 받아서 res 변수에 넣음 ");
				System.out.println("");
				System.out.println("");
				System.out.println("**************** res의 원래 모습 (String) ****************");
				System.out.println(res.toString());
				System.out.println("******************************************************");
				System.out.println("");
				System.out.println("");
				JSONObject jsonObject = new JSONObject(); // JSONObject를 사용하여 JSON객체를 생성 하기위해 로드
				JSONParser parser = new JSONParser(); // String 객체(Json문자열)를 JSON Object로 변환 하기위해 로드
				jsonObject = (JSONObject) parser.parse(res.toString()); //String 객체(Json문자열)를 JSON Object형태("key", "value")로 변환(Parse)하여 JSON객체에  저장 
			
				System.out.println("JSONParser를 이용하여 JSONObject에 JSON 객체 저장");
				System.out.println("access_token 값만을 token 변수에 저장");
				
				String token = jsonObject.get("access_token").toString();// res의 정보 중 access_token의 값만을 token변수에 저장
				System.out.println("token의 값은 : " + token);
						
				System.out.println("");
				System.out.println("");
				
				System.out.println("============== 4. 접근 토큰을 이용하여 프로필 API 호출하기 ==============");
				String header = "Bearer " + token; // token
				apiURL = "https://openapi.naver.com/v1/nid/me";

				Map<String, String> requestHeaders = new HashMap<String, String>();
				requestHeaders.put("Authorization", header);
				String responseBody = get(apiURL,requestHeaders);

				System.out.println("===========<네이버에 access_token을 주고 네이버 프로필을 내용을 받음>===========");
				System.out.println(responseBody);
				JSONObject jsonObject2 = (JSONObject) parser.parse(responseBody);
				System.out.println("*****************************************************");

				System.out.println("===========<네이버에서 받은 프로필 내용을 하나씩 쪼갬>===========");
				System.out.println(jsonObject2.get("response"));
				JSONObject jsonObject3 = (JSONObject) jsonObject2.get("response");
				dto.setM_email( (String) jsonObject3.get("email") );
				
				
				//내가 소스코드 지정 : 로그인 확인
				MemberDTO dtoFromDB = null;
				System.out.println(dto.getM_email());
				dtoFromDB = service.idCheck( dto.getM_email() ); // 네이버 로그인을 통해 들어온 유저가 그 전에 가입한 적이있는지 확인
				System.out.println(dtoFromDB  + "확인");
				
				if(dtoFromDB != null && !dtoFromDB.equals("")) {
					System.out.println("뿎2");
					//로그인하기
					MemberDTO dtoFromDB2 = null;
					dtoFromDB2 = service.login( dtoFromDB );
					session.setAttribute("login_info", dtoFromDB2);
					//로그인 이후 경로
					return "redirect:/main/select";
				}else {
					System.out.println("뿎1");
					//null값 - 회원가입 이메일만 정보보냄
					session.setAttribute("email_save", dto.getM_email());
					//로그인 실패시 이동경로
					return "redirect:/login/sign";
				}
				
			}//if
		} catch ( NullPointerException e) {
			return "/login/login_form"; // 가입페이지에서 새로고침 할경우 access_token 유실되어 nullpoint exception 발생---------------------------------->
		} catch (Exception e) {
			System.out.println(e);
		}//try
		
		return "login/login_form";//jsp file name
	}//callback_naver



	private static HttpURLConnection connect(String apiUrl){
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
		
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}//get
	
	private static String readBody(InputStream body){
	InputStreamReader streamReader = new InputStreamReader(body);
		
		try  {
			BufferedReader lineReader = new BufferedReader(streamReader);
			StringBuilder responseBody = new StringBuilder();
		
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}//readBody
}
