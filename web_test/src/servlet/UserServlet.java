package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.UserService;
import service.UserServiceImpl;

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
				String result = "회원가입에 실패하셨습니다.";
				int rCnt = us.insertUser(hm);
				if(rCnt==1) {
					result = "회원가입성공";
				}
				HashMap rehm = new HashMap();
				rehm.put("msg", result);
				rehm.put("url", "/login.jsp");
				
				str = g.toJson(rehm);
				doProcess(resp, str);
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
				resp.sendRedirect("/login.jsp");
			}else if(command.equals("modify")) {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String name = request.getParameter("name");
				String user_no = request.getParameter("user_no");
				String[]  hobbies = request.getParameterValues("hobby");
				String hobby="";
				for(String h : hobbies) {
					hobby += h+",";
				}
				hobby = hobby.substring(0, hobby.length()-1);
				
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("id", id);
				hm.put("pwd", pwd);
				hm.put("name", name);
				hm.put("hobby", hobby);
				hm.put("user_no", user_no);
				HttpSession session = request.getSession(); //세션받기
				String result = "회원정보 수정에 실패하셨습니다.";
			/*	Map<String, String> user = (Map)session.getAttribute("user");
				hm.put("user_no", user.get("user_no"));*/
				int rCnt = us.updateUser(hm);				
				if(rCnt==1) {
					Map<String,String> user =(Map<String,String>)session.getAttribute("user");
					if(user.get("admin").equals("1")) {
						result ="<script>";
						result +="alert('회원수정에 성공하셨습니다. );";
						result +="location.href='/list.jsp';";
						result +="</script>";
					}else {
						session.invalidate();
						result ="<script>";
						result +="alert('회원수정에 성공하셨습니다. 다시 로그인해주시기 바랍니다.');";
						result +="location.href='/login.jsp';";
						result +="</script>";
					}
				}
				
				doProcess(resp, result);
			}else if(command.equals("delete")) {
				String userNo = request.getParameter("userNo");
				Map<String, String> hm = new HashMap<String, String>();
				String result ="회원탈퇴에 실패하셨습니다.";
				hm.put("userNo", userNo);
				int rCnt = us.deleteUser(hm);
				if(rCnt==1) {
					HttpSession session = request.getSession();
					Map<String, String> user = (Map<String, String>)session.getAttribute("user");
					if(user.get("admin").equals("1")) {
						result += "<script>";
						result += "alert('회원탈퇴에 성공하셨습니다.');";
						result += "location.href='/list.jsp';";
						result += "</script>";
					}
				}else{
					result += "<script>";
					result += "alert('회원탈퇴에 성공하셨습니다.다시로긴');";
					result += "location.href='/login.jsp';";
					result += "</script>";
				}
				doProcess(resp, result);
			}else if(command.equals("list")) {
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("name", request.getParameter("name"));
				List<Map<String,String>> userList = us.getUserList(hm);
				String result = "<table border='1'>";
				for(Map<String,String> m : userList) {
					result += "<tr>";
					result += "<td>" + m.get("userNo") +"</td>";
					result += "<td>" + m.get("id") +"</td>";
					result += "<td>" + m.get("name") +"</td>";
					result += "<td>" + m.get("hobby") +"</td>";
					result += "<td><input type='button' value='수정' data-num'" + m.get("userNo") +"</td>";
					result += "<td><input type='button' value='삭제' data-num'" + m.get("userNo") +"</td>";
					result += "</tr>";
					
				}
				result += "</table>";
				doProcess(resp, result);
			}else if(command.equals("view")){
				String userNo = request.getParameter("userNo");
				Map<String, String> hm = us.selectUser(userNo);
				Gson g= new Gson(); //자바스크립트가 읽기 편하도록 map을 제이슨으로 변환해줌
				String result = g.toJson(hm);//화면에 뿌려주기 위해제이슨을 사용
				doProcess(resp, result);
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
