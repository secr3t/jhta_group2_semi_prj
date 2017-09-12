package pro.lecturer.image.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import pro.lecturer.dao.LecturerDao;
import pro.lecturer.vo.Lecturer;

@SuppressWarnings("serial")
@WebServlet("/registration/registerlecturer.jsp")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

	private static final String SAVED_DIRECTORY = "C:\\Users\\JHTA\\git\\jhta_group2_semi_prj\\jhta_group2_semi_prj\\WebContent\\images\\";
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");

		String name = req.getParameter("user-name");
		String email = req.getParameter("user-email");
		String pwd = req.getParameter("user-pwd");
		String phone = req.getParameter("user-phone");
		String career = req.getParameter("user-career");
		
		Part part = req.getPart("user-picture");
		String filename = System.currentTimeMillis() + getFilename(part);
		
		part.write(SAVED_DIRECTORY + filename);
		
		
		Lecturer lecturer = new Lecturer();
		lecturer.setName(name);
		lecturer.setEmail(email);
		lecturer.setPwd(pwd);
		lecturer.setPhone(phone);
		lecturer.setCareer(career);
		lecturer.setPicture("/jhta_group2_semi_prj/images/" + filename);
		
		LecturerDao lecturerDao = LecturerDao.getInstance();
		Lecturer registeredUser;
		try {
			registeredUser = lecturerDao.getLecturerByEmail(email);
		
			if (registeredUser != null) {
				res.sendRedirect("registlecturerform.jsp?fail=1");
				return;
			}
		
			lecturerDao.addLecturer(lecturer);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		res.sendRedirect("registsuccessform.jsp");
	}
	
	private String getFilename(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		// contentDisposition -> form-data; name="f"; filename="commons-codec-1.10.zip"
		String[] items = contentDisposition.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				return item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		return null;
	}
}
