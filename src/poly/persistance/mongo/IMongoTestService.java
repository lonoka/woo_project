package poly.persistance.mongo;

import java.util.List;

import poly.dto.MusicalInfoDTO;

public interface IMongoTestService {
	
	public boolean createCollection() throws Exception;
	
	public List<MusicalInfoDTO> getRank() throws Exception;

}
