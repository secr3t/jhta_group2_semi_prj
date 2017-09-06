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
	
	public void addVideo(Video video) throws Exception {
		List<Video> lists = getVideosByCourseNo(video.getCourse().getNo());
		for(Video v : lists) {
			if(video.getOrder() == v.getOrder()) {
				throw new Exception("순서 정보가 중복되었습니다. 순서를 확인해주세요");
			}
		}
		IbatisUtils.getSqlMap().insert("video.addVideo", video);
	}
	
	public Video getVideoByVideoNo(int videoNo) throws SQLException{
		return (Video) IbatisUtils.getSqlMap().queryForObject("video.getVideoByVideoNo",videoNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Video> getVideosByCourseNo(int courseNo) throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("video.getVideosByCourseNo", courseNo);
	}
}
