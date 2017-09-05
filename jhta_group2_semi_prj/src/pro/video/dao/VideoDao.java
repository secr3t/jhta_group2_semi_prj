package pro.video.dao;

import java.sql.SQLException;

import pro.utils.IbatisUtils;
import pro.video.vo.Video;

public class VideoDao {

	
	public void addVideo(Video video) throws SQLException {
		IbatisUtils.getSqlMap().insert("video.addVideo", video);
	}
}
