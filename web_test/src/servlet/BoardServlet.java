package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.javafx.collections.MappingChange.Map;

import service.BoardService;
import service.BoardServiceImpl;

public class BoardServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImpl();
	private Gson g= new Gson();
	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			System.out.println(id);
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("입력하신 ID : " + id);
	} 
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		System.out.println(command);
		if(command.equals("list")) {		
			List<Map<String,String>> boardList=bs.selectBoardList();
			Map<String,Object> rHm=new HashMap<String,Object>
			
			
			
			
			
			/*String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			HashMap hm = new HashMap();
			hm.put("title", title);
			hm.put("content", content);
			hm.put("writer", writer);
			String result = "저장이 완료";*/
			doProcess(response, "");
		}
	}
	
	public void doProcess(HttpServletResponse response, String result)throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(result);
	}
}
