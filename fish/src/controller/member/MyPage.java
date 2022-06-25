package controller.member;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import service.MemberService;
import utils.Const;
import utils.Util;

@WebServlet("/member/myPage")
public class MyPage extends HttpServlet{
	private MemberService memberService = MemberService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("member") == null) {
			resp.sendRedirect(req.getContextPath() + "/member/login?link="+req.getRequestURI() + "?" + 
					URLEncoder.encode(req.getQueryString() == null ? "" : req.getQueryString(), "utf-8"));
			return;
		}
		Member member = (Member)req.getSession().getAttribute("member");
		member = memberService.get(member.getId());
		req.setAttribute("memberInfo", member);
		req.getRequestDispatcher(Const.member("mypage")).forward(req, resp);

		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Util.getParam(req, Member.class);
		memberService.modify(member);
		req.setAttribute("msg", "수정완료입니다.");
		
		req.getRequestDispatcher(Const.common("msg")).forward(req, resp);

	}
	
}
