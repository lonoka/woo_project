package poly.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import poly.dto.ActorInfoDTO;
import poly.dto.MusicalDTO;
import poly.dto.MusicalInfoDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMusicalService;

@Service("MusicalService")
public class MusicalService implements IMusicalService {

	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;

	private Logger log = Logger.getLogger(this.getClass());

	public static void main(String[] args) throws IOException {
		test();
	}

	public static void test() throws IOException {
		String url = "http://ticket.interpark.com/TPGoodsList.asp?Ca=Mus&Sort=3";

		Document img = Jsoup.connect(url).get();
		Elements info_elements = img.select("div.stit table tbody");
		Iterator<Element> eList = info_elements.select("tr").iterator();

		MusicalDTO musicalDTO = new MusicalDTO();
		while (eList.hasNext()) {
			musicalDTO = null;

			Element musicalInfo = eList.next();
			String title = musicalInfo.select("td.Rktxt span.fw_bold a").text();
			String link = musicalInfo.select("td.Rktxt span.fw_bold a").attr("href");
			String loc = musicalInfo.select("td.Rkdate a").text();
			String Mu_img = musicalInfo.select("td.RKthumb img").attr("src");

			String date = musicalInfo.select("td.Rkdate").eq(1).text();
			String naver_url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + title;

			Document naver_actor_url = Jsoup.connect(naver_url).get();

			Elements actor_list = naver_actor_url.select("div._pagecontainer div.content_area ul.staff_list li");
//			//system.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			//system.out.println("뮤지컬 제목 : " + title);
			for (Element item : actor_list) {

				String actor_info_name = item.select("div.list_thumb a img").attr("alt");
				String actor_info_img = item.select("div.list_thumb a img").attr("src");
				String actor_info_url = item.select("div.list_thumb a").attr("href");

				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");

				Document actorr_info = Jsoup.connect("https://search.naver.com/search.naver" + actor_info_url).get();
				String actor_info2 = actorr_info.select("a.btn_txt_more").attr("href");
				String actor_real_info = actorr_info.select("dd.name span").text();
				String test = actorr_info.select("dl.detail_profile dd:nth-child(3) span").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();
				Document actor2 = Jsoup.connect(actor_info2).get();

				Elements actor_musical = actor2.select("ul#listUI_77");

				System.out.println(actor_musical);

			}
//			System.out.println("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

			String url2 = "http://ticket.interpark.com" + link;
			Document doc2 = Jsoup.connect(url2).get();
			// 평점
//				String actor_score = doc2.select("dd#ddReview div span:nth-child(1)").text();

			Elements info_elements2 = doc2.select("div.TabA_Info");
			String musical_id = doc2.select("div.PlayDB_Wrap a").attr("href");
			String real_musical_id[] = musical_id.split("=");
			if (real_musical_id.length > 1) {
				String real_musical_id2[] = real_musical_id[1].split("#");
				String final_musical_id = real_musical_id2[0];
				String actor_url = "http://ticket.interpark.com/Ticket/Goods/ifrGoodsActor.asp?PlayNo="
						+ final_musical_id + "&CastingYN=Y";

				Document doc3 = Jsoup.connect(actor_url).get();
				String actor_img = doc3.select("div.DT_actorWrap dt.Pic img").attr("src");
				String actor_name = doc3.select("div.DT_actorWrap dd.inFo ul.Text li h3 a").text();
				String actor_roll = doc3.select("div.DT_actorWrap dd.inFo ul.Text li.Cast").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();
				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");
				String musical_poster = doc2.select("div.poster img").attr("src");

//				System.out.println("1.평점 : " + score);
//				System.out.println("2.제목 : " + title);
				// system.out.println("3.포스터 : " + Mu_img);
				// system.out.println("큰포스터 : " + musical_poster);
//				System.out.println("4.기간 : " + date);
//				System.out.println("5.장소 : " + loc);
//				System.out.println("6.좌석 배치도 : " + seat);
//				System.out.println("-----------------------------------------------------------------");

			}

		}

	}

	// 가나다
	@Override
	public int getMusicalInfoFromWEB1() throws Exception {

		String url = "http://ticket.interpark.com/TPGoodsList.asp?Ca=Mus&Sort=4";

		// 뮤지컬 정보를 저장하기 위한 리스트

		List<MusicalInfoDTO> mList = new ArrayList<MusicalInfoDTO>();
		List<ActorInfoDTO> aList = new ArrayList<ActorInfoDTO>();

		// 1.배우 정보를 저장하기 위한 DTO생성
		// 2.배우 정보를 저장하기 위한 리스트 생성

		Document img = Jsoup.connect(url).get();

		Elements info_elements = img.select("div.stit table tbody");

		Iterator<Element> eList = info_elements.select("tr").iterator();

		while (eList.hasNext()) {

			// 월간
			MusicalInfoDTO pDTO = new MusicalInfoDTO();

			Element musicalInfo = eList.next();
			String title = musicalInfo.select("td.Rktxt span.fw_bold a").text();
			String link = musicalInfo.select("td.Rktxt span.fw_bold a").attr("href");
			String loc = musicalInfo.select("td.Rkdate a").text();
			String Mu_img = musicalInfo.select("td.RKthumb img").attr("src");

			String date = musicalInfo.select("td.Rkdate").eq(1).text();

			String naver_url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + title;

			Document naver_actor_url = Jsoup.connect(naver_url).get();

			String url21 = "http://ticket.interpark.com" + link;
			Document doc2 = Jsoup.connect(url21).get();
			// 평점
			String actor_score = doc2.select("dd#ddReview div span:nth-child(1)").text();

			Elements info_elements2 = doc2.select("div.TabA_Info");
			String musical_id = doc2.select("div.PlayDB_Wrap a").attr("href");
			String real_musical_id[] = musical_id.split("=");
			if (real_musical_id.length > 1) {
				String real_musical_id2[] = real_musical_id[1].split("#");
				String final_musical_id = real_musical_id2[0];
				String actor_url = "http://ticket.interpark.com/Ticket/Goods/ifrGoodsActor.asp?PlayNo="
						+ final_musical_id + "&CastingYN=Y";

				Document doc3 = Jsoup.connect(actor_url).get();
				String actor_img = doc3.select("div.DT_actorWrap dt.Pic img").attr("src");
				String actor_name = doc3.select("div.DT_actorWrap dd.inFo ul.Text li h3 a").text();
				String actor_roll = doc3.select("div.DT_actorWrap dd.inFo ul.Text li.Cast").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();
				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");
				String musical_poster = doc2.select("div.poster img").attr("src");

				// system.out.println("-----------------------------------------------------------------");
				// system.out.println("0.링크 : "+musical_id);
				// system.out.println("1.평점 : " + score);
				// system.out.println("2.제목 : " + title);
				// system.out.println("3.포스터 : " + Mu_img);
				// system.out.println("큰포스터 : " + musical_poster);
				// system.out.println("4.기간 : " + date);
				// system.out.println("5.장소 : " + loc);
				// system.out.println("6.좌석 배치도 : " + seat);
				// system.out.println("-----------------------------------------------------------------");

				// 월간
				pDTO.setLink(url21);
				pDTO.setScore(score);
				pDTO.setDate(date);
				pDTO.setLoc(loc);
				pDTO.setMusical_poster(musical_poster);
				pDTO.setSeat(seat);
				pDTO.setTitle(title);
				log.info("mList에 정보 들어감");

				mList.add(pDTO);

			}
			log.info("mList size : " + mList.size());

			Elements actor_list = naver_actor_url.select("div._pagecontainer div.content_area ul.staff_list li");

			// system.out.println("뮤지컬 제목 : " + title);

			// 배우정보 크롤링 시작
			for (Element item : actor_list) {
				ActorInfoDTO aDTO = new ActorInfoDTO();


				String actor_info_name = item.select("div.list_thumb a img").attr("alt");
				String actor_info_img = item.select("div.list_thumb a img").attr("src");
				String actor_info_url = item.select("div.list_thumb a").attr("href");

				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");

				Document actorr_info = Jsoup.connect("https://search.naver.com/search.naver" + actor_info_url).get();

				String actor_real_info = actorr_info.select("dd.name span").text();
				String test = actorr_info.select("dl.detail_profile dd:nth-child(3) span").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();

				// 3.ActorDTO 에 값 넣어주기
				// 4.뮤지컬 정보에서 썻던 링크도 같이 넣어줘야함
				String test2 = "";
				if (test.contains("년")) {
					test2 = test;
					//// system.out.println("1.생년월일 : " + test2);
				} else {
					//// system.out.println("1.생년월일 : 값이 없음");
				}

				//// system.out.println("2.직업 : " + actor_real_info);
				//// system.out.println("3.이름 : " + actor_info_name);
				//// system.out.println("4.배우 사진 : " + actor_info_img);
				//// system.out.println("--------------------------------------------------------------------------------------------");

				aDTO.setActor_img(actor_info_img);
				aDTO.setLink(url21);
				aDTO.setActor_birth(test2);
				aDTO.setActor_job(actor_real_info);
				aDTO.setActor_name(actor_info_name);
				log.info("aList에 정보 들어감");
				aList.add(aDTO);

			}
			// 배우정보 크롤링 끝
		}
		log.info("aList size : " + aList.size());

		// 컬렉션에 집어넣기
		log.info("컬렉션 집어넣기 시작");

		mongoTestMapper.createCollection("AlphaMusicalInfoCollection");
		mongoTestMapper.insertMusicalData(mList, "AlphaMusicalInfoCollection");

		mongoTestMapper.createCollection("AlphaActorInfoCollection");
		mongoTestMapper.insertActorData(aList, "AlphaActorInfoCollection");
		log.info("컬렉션 집어넣기 끝");

		// 5.actor컬랙션 생성
		// 6.생성한 actor컬랙션에 집어넣기, 배우정보를 넣는 함수 만들어주기

		return 0;
	}

	// 주간순
	@Override
	public int getMusicalInfoFromWEB2() throws Exception {
		String url = "http://ticket.interpark.com/TPGoodsList.asp?Ca=Mus&Sort=2";

		// 뮤지컬 정보를 저장하기 위한 리스트

		List<MusicalInfoDTO> mList = new ArrayList<MusicalInfoDTO>();
		List<ActorInfoDTO> aList = new ArrayList<ActorInfoDTO>();

		// 1.배우 정보를 저장하기 위한 DTO생성
		// 2.배우 정보를 저장하기 위한 리스트 생성

		Document img = Jsoup.connect(url).get();

		Elements info_elements = img.select("div.stit table tbody");

		Iterator<Element> eList = info_elements.select("tr").iterator();

		while (eList.hasNext()) {

			// 월간
			MusicalInfoDTO pDTO = new MusicalInfoDTO();

			Element musicalInfo = eList.next();
			String title = musicalInfo.select("td.Rktxt span.fw_bold a").text();
			String link = musicalInfo.select("td.Rktxt span.fw_bold a").attr("href");
			String loc = musicalInfo.select("td.Rkdate a").text();
			String Mu_img = musicalInfo.select("td.RKthumb img").attr("src");

			String date = musicalInfo.select("td.Rkdate").eq(1).text();

			String naver_url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + title;

			Document naver_actor_url = Jsoup.connect(naver_url).get();

			String url21 = "http://ticket.interpark.com" + link;
			Document doc2 = Jsoup.connect(url21).get();
			// 평점
			String actor_score = doc2.select("dd#ddReview div span:nth-child(1)").text();

			Elements info_elements2 = doc2.select("div.TabA_Info");
			String musical_id = doc2.select("div.PlayDB_Wrap a").attr("href");
			String real_musical_id[] = musical_id.split("=");
			if (real_musical_id.length > 1) {
				String real_musical_id2[] = real_musical_id[1].split("#");
				String final_musical_id = real_musical_id2[0];
				String actor_url = "http://ticket.interpark.com/Ticket/Goods/ifrGoodsActor.asp?PlayNo="
						+ final_musical_id + "&CastingYN=Y";

				Document doc3 = Jsoup.connect(actor_url).get();
				String actor_img = doc3.select("div.DT_actorWrap dt.Pic img").attr("src");
				String actor_name = doc3.select("div.DT_actorWrap dd.inFo ul.Text li h3 a").text();
				String actor_roll = doc3.select("div.DT_actorWrap dd.inFo ul.Text li.Cast").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();
				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");
				String musical_poster = doc2.select("div.poster img").attr("src");

				// system.out.println("-----------------------------------------------------------------");
				// system.out.println("0.링크 : "+musical_id);
				// system.out.println("1.평점 : " + score);
				// system.out.println("2.제목 : " + title);
				// system.out.println("3.포스터 : " + Mu_img);
				// system.out.println("큰포스터 : " + musical_poster);
				// system.out.println("4.기간 : " + date);
				// system.out.println("5.장소 : " + loc);
				// system.out.println("6.좌석 배치도 : " + seat);
				// system.out.println("-----------------------------------------------------------------");

				// 월간
				pDTO.setLink(url21);
				pDTO.setScore(score);
				pDTO.setDate(date);
				pDTO.setLoc(loc);
				pDTO.setMusical_poster(musical_poster);
				pDTO.setSeat(seat);
				pDTO.setTitle(title);
				log.info("mList에 정보 들어감");

				mList.add(pDTO);

			}
			log.info("mList size : " + mList.size());

			Elements actor_list = naver_actor_url.select("div._pagecontainer div.content_area ul.staff_list li");

			// system.out.println("뮤지컬 제목 : " + title);

			// 배우정보 크롤링 시작
			for (Element item : actor_list) {
				ActorInfoDTO aDTO = new ActorInfoDTO();

				String actor_info_name = item.select("div.list_thumb a img").attr("alt");
				String actor_info_img = item.select("div.list_thumb a img").attr("src");
				String actor_info_url = item.select("div.list_thumb a").attr("href");

				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");

				Document actorr_info = Jsoup.connect("https://search.naver.com/search.naver" + actor_info_url).get();

				String actor_real_info = actorr_info.select("dd.name span").text();
				String test = actorr_info.select("dl.detail_profile dd:nth-child(3) span").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();

				// 3.ActorDTO 에 값 넣어주기
				// 4.뮤지컬 정보에서 썻던 링크도 같이 넣어줘야함
				String test2 = "";
				if (test.contains("년")) {
					test2 = test;
					//// system.out.println("1.생년월일 : " + test2);
				} else {
					//// system.out.println("1.생년월일 : 값이 없음");
				}

				//// system.out.println("2.직업 : " + actor_real_info);
				//// system.out.println("3.이름 : " + actor_info_name);
				//// system.out.println("4.배우 사진 : " + actor_info_img);
				//// system.out.println("--------------------------------------------------------------------------------------------");

				aDTO.setActor_img(actor_info_img);
				aDTO.setLink(url21);
				aDTO.setActor_birth(test2);
				aDTO.setActor_job(actor_real_info);
				aDTO.setActor_name(actor_info_name);
				log.info("aList에 정보 들어감");
				aList.add(aDTO);

			}
			// 배우정보 크롤링 끝
		}
		log.info("aList size : " + aList.size());

		// 컬렉션에 집어넣기
		log.info("컬렉션 집어넣기 시작");

		mongoTestMapper.createCollection("WeekMusicalInfoCollection");
		mongoTestMapper.insertMusicalData(mList, "WeekMusicalInfoCollection");

		mongoTestMapper.createCollection("WeekActorInfoCollection");
		mongoTestMapper.insertActorData(aList, "WeekActorInfoCollection");
		log.info("컬렉션 집어넣기 끝");

		// 5.actor컬랙션 생성
		// 6.생성한 actor컬랙션에 집어넣기, 배우정보를 넣는 함수 만들어주기

		return 0;

	}

	// 월간순
	@Override
	public int getMusicalInfoFromWEB3() throws Exception {

		String url = "http://ticket.interpark.com/TPGoodsList.asp?Ca=Mus&Sort=3";

		// 뮤지컬 정보를 저장하기 위한 리스트

		List<MusicalInfoDTO> mList = new ArrayList<MusicalInfoDTO>();
		List<ActorInfoDTO> aList = new ArrayList<ActorInfoDTO>();

		// 1.배우 정보를 저장하기 위한 DTO생성
		// 2.배우 정보를 저장하기 위한 리스트 생성

		Document img = Jsoup.connect(url).get();

		Elements info_elements = img.select("div.stit table tbody");

		Iterator<Element> eList = info_elements.select("tr").iterator();

		while (eList.hasNext()) {

			// 월간
			MusicalInfoDTO pDTO = new MusicalInfoDTO();

			Element musicalInfo = eList.next();
			String title = musicalInfo.select("td.Rktxt span.fw_bold a").text();
			String link = musicalInfo.select("td.Rktxt span.fw_bold a").attr("href");
			String loc = musicalInfo.select("td.Rkdate a").text();
			String Mu_img = musicalInfo.select("td.RKthumb img").attr("src");

			String date = musicalInfo.select("td.Rkdate").eq(1).text();

			String naver_url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + title;

			Document naver_actor_url = Jsoup.connect(naver_url).get();

			String url21 = "http://ticket.interpark.com" + link;
			Document doc2 = Jsoup.connect(url21).get();
			// 평점
			String actor_score = doc2.select("dd#ddReview div span:nth-child(1)").text();

			Elements info_elements2 = doc2.select("div.TabA_Info");
			String musical_id = doc2.select("div.PlayDB_Wrap a").attr("href");
			String real_musical_id[] = musical_id.split("=");
			if (real_musical_id.length > 1) {
				String real_musical_id2[] = real_musical_id[1].split("#");
				String final_musical_id = real_musical_id2[0];
				String actor_url = "http://ticket.interpark.com/Ticket/Goods/ifrGoodsActor.asp?PlayNo="
						+ final_musical_id + "&CastingYN=Y";

				Document doc3 = Jsoup.connect(actor_url).get();
				String actor_img = doc3.select("div.DT_actorWrap dt.Pic img").attr("src");
				String actor_name = doc3.select("div.DT_actorWrap dd.inFo ul.Text li h3 a").text();
				String actor_roll = doc3.select("div.DT_actorWrap dd.inFo ul.Text li.Cast").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();
				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");
				String musical_poster = doc2.select("div.poster img").attr("src");

				// system.out.println("-----------------------------------------------------------------");
				// system.out.println("0.링크 : "+musical_id);
				// system.out.println("1.평점 : " + score);
				// system.out.println("2.제목 : " + title);
				// system.out.println("3.포스터 : " + Mu_img);
				// system.out.println("큰포스터 : " + musical_poster);
				// system.out.println("4.기간 : " + date);
				// system.out.println("5.장소 : " + loc);
				// system.out.println("6.좌석 배치도 : " + seat);
				// system.out.println("-----------------------------------------------------------------");

				// 월간
				pDTO.setLink(url21);
				pDTO.setScore(score);
				pDTO.setDate(date);
				pDTO.setLoc(loc);
				pDTO.setMusical_poster(musical_poster);
				pDTO.setSeat(seat);
				pDTO.setTitle(title);
				log.info("mList에 정보 들어감");

				mList.add(pDTO);

			}
			log.info("mList size : " + mList.size());

			Elements actor_list = naver_actor_url.select("div._pagecontainer div.content_area ul.staff_list li");

			// system.out.println("뮤지컬 제목 : " + title);

			// 배우정보 크롤링 시작
			for (Element item : actor_list) {
				ActorInfoDTO aDTO = new ActorInfoDTO();


				String actor_info_name = item.select("div.list_thumb a img").attr("alt");
				String actor_info_img = item.select("div.list_thumb a img").attr("src");
				String actor_info_url = item.select("div.list_thumb a").attr("href");

				String seat = naver_actor_url.select("a.move_link:nth-child(2)").attr("href");

				Document actorr_info = Jsoup.connect("https://search.naver.com/search.naver" + actor_info_url).get();

				String actor_real_info = actorr_info.select("dd.name span").text();
				String test = actorr_info.select("dl.detail_profile dd:nth-child(3) span").text();
				String score = naver_actor_url.select("dd:eq(1) a._tabOpener:eq(1) em").text();

				// 3.ActorDTO 에 값 넣어주기
				// 4.뮤지컬 정보에서 썻던 링크도 같이 넣어줘야함
				String test2 = "";
				if (test.contains("년")) {
					test2 = test;
					//// system.out.println("1.생년월일 : " + test2);
				} else {
					//// system.out.println("1.생년월일 : 값이 없음");
				}

				//// system.out.println("2.직업 : " + actor_real_info);
				//// system.out.println("3.이름 : " + actor_info_name);
				//// system.out.println("4.배우 사진 : " + actor_info_img);
				//// system.out.println("--------------------------------------------------------------------------------------------");

				aDTO.setActor_img(actor_info_img);
				aDTO.setLink(url21);
				aDTO.setActor_birth(test2);
				aDTO.setActor_job(actor_real_info);
				aDTO.setActor_name(actor_info_name);
				log.info("aList에 정보 들어감");
				aList.add(aDTO);

			}
			// 배우정보 크롤링 끝
		}
		log.info("aList size : " + aList.size());

		// 컬렉션에 집어넣기
		log.info("컬렉션 집어넣기 시작");

		mongoTestMapper.createCollection("MonthMusicalInfoCollection");
		mongoTestMapper.insertMusicalData(mList, "MonthMusicalInfoCollection");

		mongoTestMapper.createCollection("MonthActorInfoCollection");
		mongoTestMapper.insertActorData(aList, "MonthActorInfoCollection");
		log.info("컬렉션 집어넣기 끝");

		// 5.actor컬랙션 생성
		// 6.생성한 actor컬랙션에 집어넣기, 배우정보를 넣는 함수 만들어주기

		return 0;
	}

	// 주간
	// 0--------------------------------------------------------------------------------------------------------------
	// 주간
	// 0--------------------------------------------------------------------------------------------------------------
	// 주간
	// 0--------------------------------------------------------------------------------------------------------------

	@Override
	public List<MusicalInfoDTO> getRank(String str) throws Exception {
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

		List<MusicalInfoDTO> rList = mongoTestMapper.getRank(ColNm);

		if (rList == null) {
			rList = new ArrayList<MusicalInfoDTO>();
		}

		log.info(rList.size() + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
		return rList;
	}

	@Override
	public MusicalInfoDTO getDetailInfo(String pk, String str) throws Exception {
		log.info(this.getClass().getName() + ".getDetailInfo start and end");
		log.info(pk);
		return mongoTestMapper.getDetailInfo(pk,str);
	}

	@Override
	public List<ActorInfoDTO> getActorInfo(String pk, String str) throws Exception {
		log.info(this.getClass().getName() + ".getActorInfo start and end");
		log.info(pk);
		return mongoTestMapper.getActorInfo(pk,str);
	}

}
