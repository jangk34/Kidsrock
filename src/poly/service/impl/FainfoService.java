package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.FaDTO;
import poly.persistance.mapper.FainfoMapper;
import poly.service.IFainfoService;

	@Service("FainfoService")
	public class FainfoService implements IFainfoService {
		
		@Resource(name="FainfoMapper")
		private FainfoMapper fainfoMapper;

		@Override
		public List<FaDTO> getFainfoList() throws Exception {
			//System.out.println("service :"+noticeMapper.getNoticeList());
			return fainfoMapper.getFainfoList();
		}
		//추천시설
		@Override
		public List<FaDTO> getFagd() throws Exception {
			//System.out.println("service :"+noticeMapper.getNoticeList());
			return fainfoMapper.getFagd();
		}
		//시설정보 상세
		@Override
		public FaDTO getFainfoDetail(FaDTO fDTO) throws Exception {
			/*
			 * noticeMapper.updateNoticeCount(map); System.out.println();map.get("ntNo");
			 */
			return fainfoMapper.getFainfoDetail(fDTO);
		}
		//추천시설 상세
		@Override
		public FaDTO getFagdDetail(FaDTO fDTO) throws Exception {
			// TODO Auto-generated method stub
			return fainfoMapper.getFagdDetail(fDTO);
		}
		
			
		// 시설 등록
		/*@Override
		public int insertFa(FaDTO fDTO) throws Exception {
			// TODO Auto-generated method stub
			return faMapper.insertFa(fDTO);
		}*/
}