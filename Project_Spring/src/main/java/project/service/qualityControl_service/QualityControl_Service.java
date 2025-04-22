package project.service.qualityControl_service;

import java.util.List;

import project.dto.QualityControl_DTO;

public interface QualityControl_Service {
	
	public List pageList(QualityControl_DTO dto);
	public int pageTotalCaount();
	public List QualityList(QualityControl_DTO dto);
	public int QualityTotalCount();
	public int QualityInsert(QualityControl_DTO dto);
}
