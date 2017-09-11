package pro.mypage.attach.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import pro.course.vo.Course;
import pro.lecturer.vo.Lecturer;
import pro.mypage.dao.MypageLecturerDao;
import pro.utils.StringUtils;
import pro.video.vo.Video;

@SuppressWarnings("serial")
@WebServlet("/mypage/lecturer/mycourse/update.jsp")
@MultipartConfig()
public class AttachUploadServlet extends HttpServlet {
	
	private static final String ATTACH_SAVED_DIRECTORY = "C:\\Users\\JHTA\\git\\jhta_group2_semi_prj\\jhta_group2_semi_prj\\WebContent\\attaches\\";
	
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
		
		int courseNo = StringUtils.changeIntToString(req.getParameter("cno"));
		int order = StringUtils.changeIntToString(req.getParameter("lectureorder"));
		String title = req.getParameter("lecturename");
		String url = req.getParameter("lectureurl");
		String info = req.getParameter("lectureinfo");
		
		Part part = req.getPart("attachedfile");
		String fileName = System.currentTimeMillis() + "_" + getFileName(part);
		
		Course course = new Course();
		course.setNo(courseNo);
		
		Video video = new Video();
		video.setCourse(course);
		video.setOrder(order);
		video.setTitle(title);
		video.setLink(url);
		video.setAttached(fileName);
		video.setDescription(info);
		
		part.write(ATTACH_SAVED_DIRECTORY + fileName);
		try {
			MypageLecturerDao.getInstance().addCourseVideo(video);
			resp.sendRedirect("/jhta_group2_semi_prj/mypage/lecturer/mycourse/upload-lectureform.jsp?success");
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