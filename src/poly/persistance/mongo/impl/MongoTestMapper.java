package poly.persistance.mongo.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;
import com.mongodb.Cursor;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import poly.dto.ActorInfoDTO;
import poly.dto.MusicalInfoDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.util.CmmUtil;

@Component("MongoTestMapper")
public class MongoTestMapper implements IMongoTestMapper {

	@Autowired
	private MongoTemplate mongodb;

	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public boolean createCollection(String colNm) throws Exception {
		log.info(this.getClass().getName() + ".createCollection Start!");

		boolean res = false;

		if (mongodb.collectionExists(colNm)) {
			mongodb.dropCollection(colNm);
		}

		mongodb.createCollection(colNm).createIndex(new BasicDBObject("user_id", 1), "testIdx");

		res = true;

		log.info(this.getClass().getName() + ".createCollection End!!");

		return res;
	}

	@Override
	public int insertMusicalData(List<MusicalInfoDTO> pList, String colNm) throws Exception {
		log.info(this.getClass().getName() + " insertData Start!");

		int res = 0;

		if (pList == null) {
			pList = new ArrayList<MusicalInfoDTO>();
		}

		Iterator<MusicalInfoDTO> it = pList.iterator();

		while (it.hasNext()) {
			MusicalInfoDTO pDTO = (MusicalInfoDTO) it.next();

			if (pDTO == null) {
				pDTO = new MusicalInfoDTO();
			}

			mongodb.insert(pDTO, colNm);

		}

		res = 1;

		log.info(this.getClass().getName() + " insertData end!");

		return res;
	}

	@Override
	public int insertActorData(List<ActorInfoDTO> aList, String colNm) throws Exception {
		log.info(this.getClass().getName() + " insertData Start!");

		int res = 0;

		if (aList == null) {
			aList = new ArrayList<ActorInfoDTO>();
		}

		Iterator<ActorInfoDTO> it = aList.iterator();

		while (it.hasNext()) {
			ActorInfoDTO aDTO = (ActorInfoDTO) it.next();

			if (aDTO == null) {
				aDTO = new ActorInfoDTO();
			}

			mongodb.insert(aDTO, colNm);

		}

		res = 1;

		log.info(this.getClass().getName() + " insertData end!");

		return res;
	}

	@Override
	public List<MusicalInfoDTO> getRank(String colNm) throws Exception {

		DBCollection rCol = mongodb.getCollection(colNm);

		Iterator<DBObject> cursor = rCol.find();

		List<MusicalInfoDTO> rList = new ArrayList<MusicalInfoDTO>();

		MusicalInfoDTO rDTO = null;
		log.info("커서시작");
		while (cursor.hasNext()) {

			rDTO = new MusicalInfoDTO();

			final DBObject current = cursor.next();

			String link = CmmUtil.nvl((String) current.get("link"));
			String idSplit[] = link.split("=");
			String id = idSplit[1];
			String title = CmmUtil.nvl((String) current.get("title"));
			String musical_poster = CmmUtil.nvl((String) current.get("musical_poster"));
			String date = CmmUtil.nvl((String) current.get("date"));
			String loc = CmmUtil.nvl((String) current.get("loc"));
			String score = CmmUtil.nvl((String) current.get("score"));
			String seat = CmmUtil.nvl((String) current.get("seat"));
			log.info("while문 안입니다.");
			rDTO.setId(id);
			rDTO.setLink(link);
			rDTO.setTitle(title);
			rDTO.setMusical_poster(musical_poster);
			rDTO.setDate(date);
			rDTO.setLoc(loc);
			rDTO.setScore(score);
			rDTO.setSeat(seat);

			log.info("title : " + title);

			rList.add(rDTO);
			rDTO = null;

		}
		return rList;
	}

	@Override
	public MusicalInfoDTO getDetailInfo(String pk,String str) throws Exception {
		String ColNm = "MusicalInfoCollection";
		switch (str) {
		case "Month":
			ColNm = str + ColNm;
			break;
		case "Week":
			ColNm = str + ColNm;
			break;
		case "Alpha":
			ColNm = str + ColNm;
			break;
		default:
			break;
		}
		DBCollection dCol = mongodb.getCollection(ColNm);

		// pk(url)에 해당하는 뮤지컬 하나 가져오기
		BasicDBObject query = new BasicDBObject();
		query.put("link", "http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GroupCode=" + pk);

		Cursor cursor = dCol.find(query);
		MusicalInfoDTO musicalInfo = new MusicalInfoDTO();
		log.info("상세 while문 바로 위입니다.");
		while (cursor.hasNext()) {

			final DBObject current = cursor.next();

			String link = CmmUtil.nvl((String) current.get("link"));
			String idSplit[] = link.split("=");
			String id = idSplit[1];
			String title = CmmUtil.nvl((String) current.get("title"));
			String musical_poster = CmmUtil.nvl((String) current.get("musical_poster"));
			String date = CmmUtil.nvl((String) current.get("date"));
			String loc = CmmUtil.nvl((String) current.get("loc"));
			String score = CmmUtil.nvl((String) current.get("score"));
			String seat = CmmUtil.nvl((String) current.get("seat"));
			log.info("상세 while문 내부 입니다.");
			musicalInfo.setId(id);
			musicalInfo.setLink(link);
			musicalInfo.setTitle(title);
			musicalInfo.setMusical_poster(musical_poster);
			musicalInfo.setDate(date);
			musicalInfo.setLoc(loc);
			musicalInfo.setScore(score);
			musicalInfo.setSeat(seat);

		}

		log.info(this.getClass().getName() + "getDetailInfo end");

		return musicalInfo;

	}

	@Override
	public List<ActorInfoDTO> getActorInfo(String pk,String str) throws Exception {
		String ColNm = "ActorInfoCollection";
		switch (str) {
		case "Month":
			ColNm = str + ColNm;
			break;
		case "Week":
			ColNm = str + ColNm;
			break;
		case "Alpha":
			ColNm = str + ColNm;
			break;
		default:
			break;
		}
		DBCollection dCol = mongodb.getCollection(ColNm);

		BasicDBObject query = new BasicDBObject();
		query.put("link", "http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GroupCode=" + pk);

		Cursor cursor = dCol.find(query);
		
		List<ActorInfoDTO> aList = new ArrayList<ActorInfoDTO>();
		
		log.info("상세 while문 바로 위입니다.");
		while (cursor.hasNext()) {
			ActorInfoDTO aDTO = new ActorInfoDTO();

			final DBObject current = cursor.next();

			String link = CmmUtil.nvl((String) current.get("link"));
			String actor_name = CmmUtil.nvl((String) current.get("actor_name"));
			String actor_birth = CmmUtil.nvl((String) current.get("actor_birth"));
			String actor_job = CmmUtil.nvl((String) current.get("actor_job"));
			String actor_img = CmmUtil.nvl((String) current.get("actor_img"));
			log.info("상세 while문 내부 입니다.");
			aDTO.setActor_birth(actor_birth);
			aDTO.setActor_job(actor_job);
			aDTO.setActor_name(actor_name);
			aDTO.setLink(link);
			aDTO.setActor_img(actor_img);
			aList.add(aDTO);
			aDTO = null;

		}

		log.info(this.getClass().getName() + "getDetailInfo end");

		return aList;
	}

}
