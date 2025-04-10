package project.dao.mapper;

import java.util.List;

import project.dto.Materials_DTO;

public interface Prodplan_mapper {

	List<Materials_DTO> selectMaterialsProducts();
}
