package poly.service;

import java.util.List;

import poly.dto.FaDTO;
import poly.dto.NoticeDTO;

public interface IFainfoService {

	public List<FaDTO> getFainfoList() throws Exception;
	//추천시설 목록
	public List<FaDTO> getFagd() throws Exception;
	//시설정보 상세
	public FaDTO getFainfoDetail(FaDTO fDTO) throws Exception;
	//추천시설 상세
	public FaDTO getFagdDetail(FaDTO fDTO) throws Exception;
}
