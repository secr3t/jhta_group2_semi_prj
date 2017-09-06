package pro.mypage.image.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import pro.lecturer.vo.Lecturer;
import pro.mypage.dao.MypageLecturerDao;

@SuppressWarnings("serial")
@WebServlet("/mypage/lecturer/myinfo/update.jsp")
public class UploadServlet extends HttpServlet {
	
	private static final String SAVED_DIRECTORY = "C:\\Users\\JHTA\\git\\jhta_group2_semi_prj\\jhta_group2_semi_prj\\WebContent\\images";
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String password1 = req.getParameter("userpassword-1");
		String password2 = req.getParameter("userpassword-2");
		if(!password1.equals(password2)) {
			resp.sendRedirect("update-myinfo.jsp?fail=1");
			return;
		}
		
		String secondPhoneNo = req.getParameter("userphone-2");
		String thirdPhoneNo = req.getParameter("userphone-3");
		if(secondPhoneNo.length() < 3 || thirdPhoneNo.length() < 4) {
			resp.sendRedirect("update-myinfo.jsp?fail=2");
			return;
		}
		String phone = req.getParameter("userphone-1") + "-"
								+ secondPhoneNo + "-" + thirdPhoneNo;
		String career = req.getParameter("career");
		
		Part part = req.getPart("userimage");
		String fileName = System.currentTimeMillis() + "_" + getFileName(part);
		
		part.write(SAVED_DIRECTORY + fileName);
		
		Lecturer lecturer = new Lecturer();
		lecturer.setPwd(password2);
		lecturer.setPhone(phone);
		lecturer.setCareer(career);
		lecturer.setPicture(fileName);
		
		try {
			MypageLecturerDao.getInstance().updateMyInfo(lecturer);
			resp.sendRedirect("update-myinfo.jsp?success");
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
