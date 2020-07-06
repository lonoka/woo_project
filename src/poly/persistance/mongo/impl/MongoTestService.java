package poly.persistance.mongo.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MusicalInfoDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.persistance.mongo.IMongoTestService;

@Service("MongoTestService")
public class MongoTestService implements IMongoTestService{
	
	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public boolean createCollection() throws Exception {
		
		log.info(this.getClass().getName() + ".createCollection Start!");
		
		String colNm = "MyTestcollection" ;
		
		return mongoTestMapper.createCollection(colNm);
		
	}

	@Override
	public List<MusicalInfoDTO> getRank() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
