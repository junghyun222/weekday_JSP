package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.UserService;
import service.implement.UserServiceImpl;

public class UserServlet extends CommonServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService us = new UserServiceImpl();
	
	public void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		if(command==null) {
			doProcess(resp, "잘못된 요청입니다.");
		}else {
			if(command.equals("signin")) {
				String str = request.getParameter("param");
				//Gson 사용
				Gson g= new Gson();
				HashMap<String, String> hm = g.fromJson(str, HashMap.class);
				System.out.println(hm);	
				String result = "회원가입에 실패하셨습니다.";
				int rCnt = us.insertUser(hm);
				if(rCnt==1) {
					result ="<script>";
					result +="alert('회원가입에 성공하셨습니다. 로그인해주시기 바랍니다.');";
					result +="location.href='/login.jsp';";
					result +="</script>";
				}
				doProcess(resp, result);
			}else if(command.equals("login")) {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				Map<String, String> hm = us.getUserLogin(id, pwd);
				String result = "로그인에 실패하셨습니다.";
				if(hm!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("user", hm);
					result = "로그인에 성공했습니다.";
					resp.sendRedirect("/main.jsp");
				}
				
				doProcess(resp, result);
			}else if(command.equals("logout")) {
				HttpSession session = request.getSession();
				session.invalidate();
				resp.sendRedirect("/user/login.jsp");
			}else if(command.equals("delete")) {
				String userNo = request.getParameter("userNo");
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("user_no", userNo);
				int rCnt = us.deleteUser(hm);
				String result ="회원탈퇴에 실패하셨습니다.";
				if(rCnt==1) {
					result = "회원탈퇴에 성공하셨습니다.";
					result += "<script>";
					result += "alert('회원탈퇴에 성공하셨습니다.');";
					result += "</script>";
					
					/*result = "회원가입에 성공";
					result +="다시로그인해";*/
				}
				doProcess(resp, result);
			}else if(command.equals("update")) {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String name = request.getParameter("name");
				String[] hobbies = request.getParameterValues("hobby");
				String hobby ="";
				for(String h : hobbies) {
					hobby += h + ",";
				}
				hobby = hobby.substring(0, hobby.length()-1);
				String userNo = request.getParameter("userNo");
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("id", id);
				hm.put("pwd", pwd);
				hm.put("name", name);
				hm.put("hobby", hobby);
				hm.put("user_no", userNo);
				int rCnt = us.updateUser(hm);
				String result = "회원 정보 수정이 실패했습니다. 다시 해보세요";
				if(rCnt==1) {
					result = "회원 정보 수정이 성공했습니다.";
				}
				doProcess(resp, result);
		
			}else if(command.equals("list")) {
				Map<String, String> hm = new HashMap<String, String>();
				List<Map<String,String>> userList = us.selectUserList(hm);
				String result = "<table border='1'>";
				for(Map<String,String> m : userList) {
					result += "<tr>";
					result += "<td>" + m.get("name") +"</td>";
					result += "<td>" + m.get("id") +"</td>";
					result += "<td>" + m.get("hobby") +"</td>";
					result += "</tr>";
					result += "<td><input type='button' value='수정' data-num'" + m.get("hobby") +"</td>";
				}
				result += "</table>";
				doProcess(resp, result);
			}else if(command.equals("view")){
				String userNo = request.getParameter("userNo");
				Map<String, String> hm = us.selectUser(userNo);
				Gson g= new Gson(); //자바스크립트가 읽기 편하도록 map을 제이슨으로 변환해줌
				String result = g.toJson(hm);//화면에 뿌려주기 위해제이슨을 사용
			}
		}
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {

	}	
	public void doProcess(HttpServletResponse resp, String writeStr) 
			throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(writeStr);
	}
}
