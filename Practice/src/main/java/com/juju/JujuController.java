package com.juju;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;
import java.util.function.Supplier;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.DaoController;
import com.validation.EmailValidation;

@Controller
public class JujuController {
	EmailValidation emailv = new EmailValidation();
	DaoController dao = new DaoController();
	String Pancards = " ";
	
	@RequestMapping("/move")
	public String relogin() 
	{
		return "login.jsp";
	}

	// After fail register then relogin
///========================================================================================	
	@RequestMapping("/regmove")
	public String reregister() {
		return "registration.jsp";
	}

	@RequestMapping("/register")

	public ModelAndView Register(HttpServletRequest req, HttpServletResponse res) 
	
	{
		System.out.println();
		String uname = req.getParameter("uname");
		String pancard = req.getParameter("pancard");
		String mobnumber = req.getParameter("mobnumber");
		String Email = req.getParameter("Email");
		String pword = req.getParameter("psw");
		Pancards = pancard;
		ModelAndView mv = new ModelAndView();

		/// Email validation

		try {
			if (emailv.checkEmail(Email) == true && emailv.CheckPannumber(pancard) == true
					&& emailv.checkpassword(pword) == true && emailv.checkMobile(mobnumber) == true) 
			{
				System.out.println("Email,pan,password,mobile successfully validated");

				/// OTP
				Map<String, Integer> map = new LinkedHashMap<String, Integer>();
				JujuController obj = new JujuController();
				int otp = obj.RandOtp();
				System.out.println("OTP is" + otp);
				map.put(mobnumber, otp);
				if (map.get(mobnumber) == otp) {
					System.out.println("Going for otp generate");
					String message = otp + " " + "Is your OTP:" + " " + new Date().toLocaleString();
					try {
						String apiKey = "prMTtPlKNXW1C3DugOmxzbHwB5hji7UV9YSsaFcq2A06onfv4IR9HF3cwk4tCaiBYfXuU1m85dqlMyPn";
						String senderId = "FSTSMS";

						/// Important code for convert our simple message test to encoded format
						message = URLEncoder.encode(message, "UTF-8");
						String language = "english";
						String route = "p";
						/// Important for fire url
						String myUrl = "https://www.fast2sms.com/dev/bulk?authorization=" + apiKey + "&sender_id="
								+ senderId + "&message=" + message + "&language=" + language + "&route=" + route
								+ "&numbers=" + mobnumber;

						/// Url passed and open https url
						URL url = new URL(myUrl);
						HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
						con.setRequestMethod("GET");

						con.setRequestProperty("User-Agent", "Chrome/81.0.4044.138");
						con.setRequestProperty("cache-control", "no-cache");

						System.out.println("Wait.....");

						int code = con.getResponseCode();
						System.out.println("Code" + " " + code);
						/// Store response data
						StringBuffer response = new StringBuffer();
						/// For Read the data
						BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
						while (true) {
							String line = br.readLine();
							if (line == null) {
								break;
							}
							response.append(line);
						}
						System.out.println(response);

						System.out.println(myUrl);
					} catch (Exception e) {
						e.printStackTrace();
					}

				} else {
					throw new RuntimeException("Map Otp and send OTP not match");
				}

				/// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				dao.create(uname, pancard, mobnumber, Email, pword, otp);
			}

		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		if (dao.get(Email, pword)) {
			System.out.println("Go to otp validate jsp");
			String name = uname;
			mv.setViewName("otpVelidate.jsp");
			mv.addObject("data", name);
		}

		else {
			System.out.println("go to again registraton");
			mv.setViewName("registration.jsp");
		}
		return mv;
	}

	/// otp validate then registation successful

	@RequestMapping("/otpvalidate")
	
	public ModelAndView Otpdata(HttpServletRequest req, HttpServletResponse res) {

		int userotp = Integer.parseInt(req.getParameter("otp"));

		System.out.println("entry inside otpvalidate");

		ModelAndView mv = new ModelAndView();
		if (dao.getotp(userotp) == true) {
			System.out.println("database and input otp matched");
			mv.setViewName("successfullyreg.jsp");
		} else {
			mv.setViewName("regfail.jsp");
		}
		return mv;
	}

////OTP Generate
	public int RandOtp() {
		Supplier<Integer> s = () -> {
			Random random = new Random();
			int rand = random.nextInt(5518) + 2340;
			return rand;
		};
		return s.get();

	}

	@RequestMapping("/login")

	public ModelAndView Login(HttpServletRequest req, HttpServletResponse res) {
		String Email = req.getParameter("email");
		String pword = req.getParameter("pass");

		ModelAndView mv = new ModelAndView();
		if (dao.get(Email, pword) == true) {
			mv.setViewName("finalpage.jsp");
		} else {
			mv.setViewName("error.jsp");
		}
		return mv;
	}
	/// redirect to fileup jsp page

	@RequestMapping("/redirectupload")
	public String redirectupload() 
	{
		return "fileup.jsp";
	}

	/// Redirect to userlogout page

	@RequestMapping("/logout")
	public String redirectlogoutpage() {
		return "userlogout.jsp";
	}

	/// User Forgot the password

	@RequestMapping("/forGot")
	public ModelAndView Userforgot(HttpServletRequest req, HttpServletResponse res) {

		String pancard = req.getParameter("pancard");
		String mobnumber = req.getParameter("mobnumber");
		String pword = req.getParameter("pass");
		String conpword = req.getParameter("confirmpass");

		ModelAndView mv = new ModelAndView();
		if (pword.equals(conpword)) {
			try {
				if (emailv.CheckPannumber(pancard) == true && emailv.checkpassword(pword) == true
						&& emailv.checkMobile(mobnumber) == true) {

					System.out.println("Forgot data pass from controller in to DAO validated");
					dao.forgot(pancard, mobnumber, pword);
				} else {
					System.out.println("Wrong format data entry ! please try again");
				}

			} catch (Exception e) {
				System.out.println("Wrong format data entry ! please try again");
			}

			if (dao.checkforgotData(pancard, pword)) {
				mv.setViewName("login.jsp");
			} else {
				mv.setViewName("error.jsp");
			}
		} else {
			mv.setViewName("userforgot.jsp");
		}
		return mv;
	}

	/// File upload in database
///=======================================================================================	 
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)

	public ModelAndView upload(@RequestParam("File") CommonsMultipartFile file, HttpSession session) {
		System.out.println("bansjsbaDSb");
		String path = session.getServletContext().getRealPath("/");
		String filename = file.getOriginalFilename();
		System.out.println("path" + path + "filename" + filename);
		try {
			byte barr[] = file.getBytes();
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + "/" + filename));
			Object o = bout;
			bout.write(barr);
			bout.flush();
			bout.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return new ModelAndView("finalpage.jsp");
		
	}

}
