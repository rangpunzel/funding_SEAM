package com.funding.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.dto.BannerVO;
import com.funding.dto.EmailVO;
import com.funding.dto.MemberVO;
import com.funding.dto.PopupVO;
import com.funding.dto.ProjectVO;
import com.funding.exception.InvalidPasswordException;
import com.funding.exception.NotFoundIDException;
import com.funding.request.SearchCriteria;
import com.funding.service.MemberService;
import com.funding.service.NoticeService;
import com.funding.service.admin.BannerService;
import com.funding.service.admin.PopupService;
import com.funding.service.project.ProjectService;
import com.funding.util.NaverCaptchaKey;
import com.funding.util.NaverCaptchaResult;
import com.funding.util.TempKey;

@Controller
@RequestMapping("/")
public class CommonController {
	
	@Autowired
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ProjectService pService;
	
	@Autowired
	private PopupService popService;
	
	@Autowired
	private BannerService bannerService;

	private static String stcKeys;
	
	@Autowired
	public EmailSender mailSender;
	
	@Autowired
	public EmailVO email;

	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String test() throws Exception {
		String url = "home.page";
		String js="js";
		return url;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model,SearchCriteria cri) throws Exception {
		String url = "commons/main.page";
		
		//cri.setPerPageNum(5);
//		Map<String, Object> dataMap = noticeService.getNoticeListAll();
		
		//팝업리스트
		List<PopupVO> activePopupList = popService.selectActivePopup();
		//배너리스트(메인배너)
		List<BannerVO> activeBannerList = bannerService.selectActiveBanner();
		//배너리스트(파트너십)
		List<BannerVO> activePartnerBannerList = bannerService.selectActivePartnerBanner();
		
		
//		model.addAllAttributes(dataMap);
		model.addAttribute("activePopupList",activePopupList);
		model.addAttribute("activeMainBannerList",activeBannerList);
		model.addAttribute("activePartnerBannerList",activePartnerBannerList);
		
		return url;
	}
	
	@RequestMapping("/footerNotice")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> footerNotice(Model model)throws Exception{
		ResponseEntity<Map<String, Object>> entity=null;
		try {
			Map<String, Object> dataMap = noticeService.getNoticeListAll();
			entity=new ResponseEntity<>(dataMap,HttpStatus.OK);
			model.addAllAttributes(dataMap);
		}catch(SQLException e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/main/news")
	@ResponseBody
	public ResponseEntity<String> news()throws Exception{
		ResponseEntity<String> entity=null;
		String clientId = "LFVL_G0lLWWjd3dQYW50"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "JAM2powp9B"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        try {
            text = URLEncoder.encode("소상공인", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
        entity = new ResponseEntity<>(responseBody,HttpStatus.OK);
        
        return entity;
	}
	
	@RequestMapping(value = "/commons/main/search",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ProjectVO>> searchProject( String val, Model model)throws Exception{
		
		ResponseEntity<List<ProjectVO>> entity = null;
		System.out.println("val = " + val);
		try {
			List<ProjectVO> projectList = pService.getSearchProjectList(val);
			//model.addAttribute("projectList",projectList);
			System.out.println(projectList);
			entity = new ResponseEntity<List<ProjectVO>>(projectList, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ProjectVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/commons/loginFormWithCapcha")
	public String loginFormWithCapcha(HttpServletRequest request) throws Exception {
		String url = "commons/login_addCapcha.page";
		
		String naverid = "CdDmuUEG8PE0B6pdNVZl";
		String naverkey = "PR1202TAvY";

		String key = NaverCaptchaKey.keyGo(naverid, naverkey);

		int idx = key.indexOf(":");
		int idx2 = key.lastIndexOf("}");

		String keys = key.substring(idx + 2, idx2 - 1);
		System.out.println(keys);
		stcKeys = keys;
		
		request.setAttribute("keys", keys);
		
		return url;
	}
	
	@RequestMapping("/commons/loginForm")
	public String loginForm(Model model, HttpServletRequest request) throws Exception {
		
		String url = "commons/login.page";
		
	    /*
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	    if (!(auth instanceof AnonymousAuthenticationToken)) {
	    	url="redirect:/main";
	         
	        return url;
	    }*/
		
		return url;
	}
	
	@RequestMapping(value = "/commons/login", method=RequestMethod.POST)
	public String login(String mem_email,
						String mem_pw,
						HttpServletRequest request,
						HttpServletResponse response,	
						HttpSession session,
						Model model,
						SearchCriteria cri) throws Exception {
		String url = "redirect:/main";
		String message=null;
		MemberVO loginUser = null;
		int loginFailCnt = 0;
		loginFailCnt = memberService.getLoginFailCount(mem_email);
		
		if(loginFailCnt > 4) {
			url = "commons/login_capcha";
			
			String naverid = "CdDmuUEG8PE0B6pdNVZl";
			String naverkey = "PR1202TAvY";

			String key = NaverCaptchaKey.keyGo(naverid, naverkey);

			int idx = key.indexOf(":");
			int idx2 = key.lastIndexOf("}");

			String keys = key.substring(idx + 2, idx2 - 1);
			System.out.println(keys);
			stcKeys = keys;
			request.setAttribute("keys", keys);
			request.setAttribute("mem_email", mem_email);
			
			return url;
		}
		
		String strDormantMember = memberService.getDormantMember(mem_email);
		
		if(strDormantMember != null) {
			
			if(strDormantMember.equals(mem_email) == true) {
				url = "commons/login_dormant";
				
				String uuid_key = TempKey.getKey(15, false);
				System.out.println("mem_email > " + mem_email + " login uuid_key > " + uuid_key);
				memberService.updateUuidKey(uuid_key, mem_email);
				
				email.setReceiver(mem_email);	//수신자 메일주소
				email.setContent("안녕하세요 FUN SEAM DING 입니다.\n 인증키는 " + uuid_key + "입니다.");
				email.setSubject(mem_email + "님 휴면계정 해제를 위한 인증 메일입니다.");
				
				try {
					mailSender.SendEmail(email);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.setAttribute("mem_email", mem_email);
				return url;	
			}
			else {
				return url;
			}
		}
		
		try {
			memberService.login(mem_email, mem_pw);
			loginUser = memberService.getMember(mem_email);
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(60*6);
			
			//select login lastDate
			Date loginLastDate = memberService.getMemberLoginLastDate(mem_email);
			System.out.println("loginLastDate >>> " + loginLastDate);
			
			//clear login fail count
			memberService.updateClearLoginFailCount(mem_email);

		} catch (NotFoundIDException e) {
			message="아이디가 존재하지 않습니다.";
			url="redirect:login_fail";
		}  catch (InvalidPasswordException e) {
			message="패스워드가 일치하지 않습니다.";
			url="redirect:login_fail";
			memberService.updatePlusLoginFailCount(mem_email);
		} catch (SQLException e) {
			e.printStackTrace();
			message="시스템장애로 로그인이 불가합니다.";	
			url="redirect:loginForm";
		}
		
		Map<String, Object> dataMap = noticeService.getNoticeList(cri);
		model.addAllAttributes(dataMap);
		session.setAttribute("msg",message);
		session.setAttribute("mem_email", mem_email);
		
		return url;
	}
	
/*	@RequestMapping("/commons/logout")
	public String logout(HttpSession session, Model model) throws Exception {
		String url="commons/logout";
		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return url;
	}*/
	
	@RequestMapping("/commons/login_fail")
	public String login_fail() throws Exception {
		String url = "commons/login_fail";
		return url;
	}
	
//	@RequestMapping("/commons/login_capcha")
//	public String login_capcha(HttpServletRequest request,
//								HttpServletResponse response
//								) throws Exception {
//		String url="/commons/login_capcha";
//		
//		String naverid = "CdDmuUEG8PE0B6pdNVZl";
//		String naverkey = "PR1202TAvY";
//
//		String key = NaverCaptchaKey.keyGo(naverid, naverkey);
//
//		int idx = key.indexOf(":");
//		int idx2 = key.lastIndexOf("}");
//
//		String keys = key.substring(idx + 2, idx2 - 1);
//		System.out.println(keys);
//		stcKeys = keys;
//		
//		request.setAttribute("keys", keys);
//		
//		return url;
//	}
	
	
//	@RequestMapping("/commons/capchaResultByAjax")
//	public String capcharesultajax(String capcha_keys,
//									String mem_email,
//									HttpServletRequest request,
//									HttpServletResponse response
//									) throws Exception {
//		String url="";
//		
//		return url;
//	}
	
	@RequestMapping("/commons/capchaResultByAjax")
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> capchaResultByAjax(String mem_email, String keys) throws Exception {
		ResponseEntity<Map<String, Boolean>> entity = null;
		
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		
		if(capcha_check(keys)) {
			
			try {
				memberService.updateClearLoginFailCount(mem_email); //clear login fail count
				result.put("result", true);
				
			} catch (Exception e) {
				result.put("result", false);
				return new ResponseEntity<Map<String, Boolean>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		else {
			result.put("result", false);
		}
		
		entity = new ResponseEntity<Map<String, Boolean>>(result, HttpStatus.OK);
		return entity; 
	}
	

	
	
	@RequestMapping("/commons/capchaResult")
	public String capcharesult(String capcha_keys,
								String mem_email,
								HttpServletRequest request,
								HttpServletResponse response
								) throws Exception {
		String url="";
		if(capcha_check(capcha_keys)) {
			memberService.updateClearLoginFailCount(mem_email); //clear login fail count
			url = "commons/login";
		}
		else
		{
			url = "commons/login_capcha";
			
			String naverid = "CdDmuUEG8PE0B6pdNVZl";
			String naverkey = "PR1202TAvY";

			String key = NaverCaptchaKey.keyGo(naverid, naverkey);

			int idx = key.indexOf(":");
			int idx2 = key.lastIndexOf("}");

			String keys = key.substring(idx + 2, idx2 - 1);
			System.out.println(keys);
			stcKeys = keys;
			request.setAttribute("keys", keys);
			request.setAttribute("mem_email", mem_email);
		}
		
		return url;
	}

	public boolean capcha_check(String val) {
		boolean results = false;
		
		String naverid = "CdDmuUEG8PE0B6pdNVZl";
		String naverkey = "PR1202TAvY";
		
		String res = NaverCaptchaResult.keyres(naverid, naverkey, stcKeys, val);
		int idx = res.indexOf(":");
		int idx2 = res.indexOf(",");

		String strKey = NaverCaptchaKey.keyGo(naverid, naverkey);
		String strKeys = strKey.substring(idx + 2, idx2 - 1);
		String strResult = res.substring(idx + 1, idx2);

		if (strResult.equals("true")) {
			System.out.println("인증완료");

			results = true;

		} else {
			System.out.println("인증실패");
			results = false;
//			capchar();
		}

		return results;
	}
	
//	@RequestMapping("/commons/calmain")
//	public String calmain() throws Exception {
//		String url = "commons/calmain.page";
//		return url;
//	}
	
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
	    }

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

	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	    
	@RequestMapping("/commons/login_dormant")
	public String login_dormant(HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session) throws Exception {
		String url = "/commons/login_dormant";
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		request.setAttribute("member", member);
		
		return url;
	}
	    
	@RequestMapping("/commons/UuidCertify")
	public String uuidCerifyResult(String uuid_key,
								String mem_email,
								HttpServletRequest request,
								HttpServletResponse response
								) throws Exception {
		String url="";
		
		String getUuidKey = memberService.getUuidKeyById(mem_email);
		
		if(getUuidKey.equals(uuid_key) == true) {	//uuid 올바르게 입력
			url = "commons/login_dormant_ok";
			memberService.updateLoginLastDate(mem_email);
			request.setAttribute("mem_email", mem_email);
		}
		else {	//uuid 같지 않음
			url = "redirect:commons/login_dormant";
		}
		
		return url;
	}
	
	@RequestMapping("/commons/loginFail")
	public String showLoginFail(HttpServletRequest request,
								HttpServletResponse response
								) throws Exception {
		String url = "/commons/login_fail_security";
		
		return url;
	}
	
	@RequestMapping("/security/denied")
	public String securityDenied()throws Exception{
		String url="/security/denied";
		
		return url;
	}
}


