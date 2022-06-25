package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import domain.Member;
import service.MemberService;
import utils.Const;

@WebServlet("/member/ProcAuth")
public class ProcAuth extends HttpServlet{
	private MemberService memberService = MemberService.getInstance();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String authToken = req.getParameter("authToken");
		String id = req.getParameter("id");
		
		
		Member member = memberService.get(id);
		String msg = "";
		member.setAuth(BCrypt.checkpw(member.getAuthToken(), authToken) ? "1" : "0");
		if(member.getAuth().equals("1")) {
			memberService.updateAuth(member);
			msg = "이메일 인증을 성공했습니다.";
		} else{
			
			msg = "이메일 인증을 실패했습니다.";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("href", req.getContextPath());
		req.getRequestDispatcher(Const.common("msg")).forward(req, resp);

		}
	}
