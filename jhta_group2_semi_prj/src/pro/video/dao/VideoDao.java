package pro.video.dao;

import java.sql.SQLException;
import java.util.List;

import pro.utils.IbatisUtils;
import pro.video.vo.Video;

public class VideoDao {

	private static VideoDao instance = new VideoDao();
	public static VideoDao getInstance() {
		return instance;
	}
	
	public void addVideo(Video video) throws SQLException {
		IbatisUtils.getSqlMap().insert("video.addVideo", video);
	}
	
	public Video getVideoByNo(int no) throws SQLException{
		return (Video) IbatisUtils.getSqlMap().queryForObject("video.getVideoByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Video> getVideosByCourseNo(int no) throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("video.getVideosByCourseNo", no);
	}
}
