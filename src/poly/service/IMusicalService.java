package poly.service;

import java.util.List;

import poly.dto.ActorInfoDTO;
import poly.dto.MusicalInfoDTO;

public interface IMusicalService {

	// 가나다
	int getMusicalInfoFromWEB1() throws Exception;

	// 주간
	int getMusicalInfoFromWEB2() throws Exception;
	
	// 월간
	int getMusicalInfoFromWEB3() throws Exception;
	
	List<MusicalInfoDTO> getRank(String str) throws Exception;

	MusicalInfoDTO getDetailInfo(String pk, String str) throws Exception;

	List<ActorInfoDTO> getActorInfo(String pk, String str) throws Exception;



}
