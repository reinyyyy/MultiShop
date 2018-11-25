package main.controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.crypto.Cipher;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Controller
public class IndexController {
	
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private static String RSA_WEB_KEY = "_RSA_WEB_Key_";
	private static String RSA_INSTANCE = "RSA";

	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section","/section/index.jsp");
		mav.setViewName("/main/main");
		return mav;
	}
	@RequestMapping(value="/member/signup.do",method=RequestMethod.POST)
	public @ResponseBody String signup(@ModelAttribute MemberDTO memberDTO,ModelAndView mav) {
		System.out.println("컨트롤러 들림");
		int su = memberDAO.member_signup(memberDTO);
		if(su==1) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="/member/loginForm.do",method=RequestMethod.POST)
    public ModelAndView loginForm(@ModelAttribute ModelAndView mav, HttpSession session) throws Exception {
		initRsa(mav, session);
		mav.setViewName("jsonView");
		return mav;
    }
	
	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public @ResponseBody String login(@RequestParam String RSA_email, @RequestParam String RSA_pwd, HttpSession session,HttpServletRequest request) {
        PrivateKey privateKey = (PrivateKey) session.getAttribute(RSA_WEB_KEY);
        try {
        	RSA_email = decryptRsa(privateKey, RSA_email);
        	RSA_pwd = decryptRsa(privateKey, RSA_pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        memberDTO = memberDAO.member_view(RSA_email, RSA_pwd);
        if(memberDTO!=null) {
        	session.removeAttribute(RSA_WEB_KEY);
        	session.setAttribute("session_name", memberDTO.getM_name());
        	session.setAttribute("session_email", RSA_email);
        	return "true";
        }else {
        	return "false";
        }
        
	}
	
	@RequestMapping(value="/member/idCheck.do", method=RequestMethod.POST)
	public @ResponseBody String idCheck(@RequestParam String email) {
		return memberDAO.idCheck(email);
	}
	
	@RequestMapping(value="/member/logout.do",method=RequestMethod.POST)
	public @ResponseBody void logout(HttpSession session) {
		session.invalidate();
	}
	
	private String decryptRsa(@ModelAttribute PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance(RSA_INSTANCE);
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8");
        return decryptedValue;
	}
	
	public ModelAndView initRsa(@ModelAttribute ModelAndView mav, HttpSession session) {
	 
        KeyPairGenerator generator;
        Map<String,String> map = new HashMap<String,String>();
        try {
            generator = KeyPairGenerator.getInstance(RSA_INSTANCE);
            generator.initialize(1024);
 
            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            session.setAttribute(RSA_WEB_KEY, privateKey);
 
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            
            mav.addObject("RSAModulus", publicKeyModulus);
            mav.addObject("RSAExponent", publicKeyExponent);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }
	 public static byte[] hexToByteArray(String hex) {
	        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
	 
	        byte[] bytes = new byte[hex.length() / 2];
	        for (int i = 0; i < hex.length(); i += 2) {
	            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
	            bytes[(int) Math.floor(i / 2)] = value;
	        }
	        return bytes;
	 }
	    
	/*   @RequestMapping(value="/member/membermodify.do",method=RequestMethod.POST)
	   public @ResponseBody String membermodify(@ModelAttribute MemberDTO memberDTO,ModelAndView mav) {
	      System.out.println(memberDTO.getM_email());
	      System.out.println(memberDTO.getM_pwd());
	      int su = memberDAO.membermodify(memberDTO);
	      if(su==1) {
	         return "true";
	      }else {
	         return "false";
	      }
	   }*/
	 @RequestMapping(value="/member/findEmail.do", method=RequestMethod.POST)
	   public @ResponseBody String findEmail(@RequestParam Map<String,String> map) {
	      memberDTO = memberDAO.findEmail(map);
	      if(memberDTO!=null) {
	           return memberDTO.getM_email();
	        }else {
	           return "false";
	        }
	   }
	   @RequestMapping(value="/member/findPwd.do", method=RequestMethod.POST)
	   public @ResponseBody String findPwd(@RequestParam Map<String,String> map) {
	      memberDTO = memberDAO.findPwd(map);
	      if(memberDTO!=null) {
	         return "true";
	      }else {
	         return "false";
	      }
	   }
	   
	   @RequestMapping(value = "/member/sendMail.do",method=RequestMethod.POST) 
	   public @ResponseBody String sendMail(@RequestParam final Map<String,String> map) {
	      final String password = getPassword();
	      MimeMessagePreparator preparator = new MimeMessagePreparator() { 
	         public void prepare(MimeMessage mimeMessage) throws Exception { 
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
	            helper.setFrom("justCozy@gmail.com"); 
	            helper.setTo(map.get("m_email")); 
	            helper.setSubject("임시비밀번호발송해드립니다."); 
	            helper.setText("임시비밀번호는 "+password+"입니다.", true); 
	         } 
	      }; 
	      mailSender.send(preparator);
	      map.put("m_pwd", password);
	      int su = memberDAO.findPwd2(map);
	      if(su==1) {
	         return "true"; 
	      }else {
	         return "false"; 
	      }
	   }
	   
	   /*임시비밀번호*/
	   public String getPassword() {   
	      String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
	      uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
	      return uuid;
	   }
	   
	   /*마이페이지*/
	  
	   
	 
}
