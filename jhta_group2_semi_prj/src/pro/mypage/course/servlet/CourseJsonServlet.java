package pro.mypage.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pro.course.vo.Course;
import pro.mypage.dao.MypageCourseDao;
import pro.utils.StringUtils;

@SuppressWarnings("serial")
@WebServlet("/mypage/course/course-info.jsp")
public class CourseJsonServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		int courseNo = StringUtils.changeIntToString(req.getParameter("cno"));
		
		
		try {
			Course course = MypageCourseDao.getInstance().getCourseByCourseNo(courseNo);
			String json = new Gson().toJson(course);
			
			pw.write(json);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
