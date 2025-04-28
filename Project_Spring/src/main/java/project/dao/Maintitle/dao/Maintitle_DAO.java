package project.dao.Maintitle.dao;

import java.util.List;

import project.dto.maintitle_DTO;

public interface Maintitle_DAO {
	

//사용
	public List<maintitle_DTO> titleAnnouncement();
	public List<maintitle_DTO> titleGeneralBulletinBoard();
	public List<maintitle_DTO> titleFinishedProduct();
	public List<maintitle_DTO> titleQualityControl();
	

//사용
}
