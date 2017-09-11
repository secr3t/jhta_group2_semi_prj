package pro.mypage.attach.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@SuppressWarnings("serial")
@WebServlet("/mypage/admin/course/download.jsp")
public class AttachDownloadServlet extends HttpServlet {

	private static final String ATTACH_SAVED_DIRECTORY = "C:\\Users\\JHTA\\git\\jhta_group2_semi_prj\\jhta_group2_semi_prj\\WebContent\\attaches\\"; 

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String fileName = req.getParameter("fname"); 
		
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "utf-8"));
		
		ServletOutputStream os = resp.getOutputStream();
		FileInputStream is = new FileInputStream(ATTACH_SAVED_DIRECTORY + fileName);
		
		IOUtils.copy(is, os);
	}
}
