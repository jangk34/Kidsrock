package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.FaDTO;

@Mapper("FainfoMapper")
public interface FainfoMapper {
 // 시설정보
	public List<FaDTO> getFainfoList() throws Exception;
	
	//상세보기
	public FaDTO getFainfoDetail(FaDTO fDTO) throws Exception;

	//추천시설
	public List<FaDTO> getFagd() throws Exception;

	public FaDTO getFagdDetail(FaDTO fDTO) throws Exception;
}
