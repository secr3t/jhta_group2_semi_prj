package pro.mypage.image.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import pro.lecturer.vo.Lecturer;
import pro.mypage.dao.MypageLecturerDao;

@SuppressWarnings("serial")
@WebServlet("/mypage/lecturer/myinfo/image-update.jsp")
@MultipartConfig()
public class UploadServlet extends HttpServlet {
	
	private static final String SAVED_DIRECTORY = "C:\\Users\\JHTA\\git\\jhta_group2_semi_prj\\jhta_group2_semi_prj\\WebContent\\images\\";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		if(session == null) {
			resp.sendRedirect("/mypage/temp-login.jsp");
			return;
		}
		
		Lecturer lecturer = (Lecturer) session.getAttribute("loginedUser");
		if(lecturer == null) {
			resp.sendRedirect("/mypage/temp-login.jsp");
			return;
		}
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		Part part = req.getPart("userimage");
		String fileName = System.currentTimeMillis() + "_" + getFileName(part);
		
		part.write(SAVED_DIRECTORY + fileName);
		
		lecturer.setPicture(fileName);
		
		pw.println(fileName);
		
		try {
			MypageLecturerDao.getInstance().updateMyInfo(lecturer);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
	private String getFileName(Part part) {
		String[] dispositionArray = part.getHeader("content-disposition").split(";");
		for(String item : dispositionArray) {
			if(item.trim().startsWith("filename")) {
				return item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return null;
	}
}
