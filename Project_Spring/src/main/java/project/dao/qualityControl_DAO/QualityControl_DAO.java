package project.dao.qualityControl_DAO;

import java.util.List;

import project.dto.QualityControl_DTO;

public interface QualityControl_DAO {

	public List pageList(QualityControl_DTO dto);
	public int pageTotalCaount();
}
