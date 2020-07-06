package poly.persistance.mongo;

import java.util.List;

import poly.dto.ActorInfoDTO;
import poly.dto.MusicalInfoDTO;


public interface IMongoTestMapper {
	public boolean createCollection(String colNm) throws Exception;
	public int insertMusicalData(List<MusicalInfoDTO> pList, String colNm) throws Exception;
	public int insertActorData(List<ActorInfoDTO> pList, String colNm) throws Exception;
	
	//뮤지컬 모든 정보
	public List<MusicalInfoDTO> getRank(String colNm) throws Exception;
	
	//뮤지컬 배우 정보
	public List<ActorInfoDTO> getActorInfo(String pk, String str) throws Exception;
	
	
	//뮤지컬 상세 정보
	public MusicalInfoDTO getDetailInfo(String pk, String str) throws Exception;

}
