package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.DBObject;

import poly.dto.ActorInfoDTO;
import poly.dto.MusicalInfoDTO;
import poly.service.IMusicalService;
import poly.service.impl.MusicalService;
import poly.util.CmmUtil;

@Controller
public class MuscialController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MusicalService")
	private IMusicalService musicalService;

	@RequestMapping(value = "index")
	public String index() throws Exception {
		log.info(this.getClass());
		return "/index";
	}

	// 크롤링 하는 컨트롤러
	@RequestMapping(value = "Musical_list")
	public String Musical_list() throws Exception {
		log.info(this.getClass());
		musicalService.getMusicalInfoFromWEB1();
		musicalService.getMusicalInfoFromWEB2();
		musicalService.getMusicalInfoFromWEB3();
		return "/Musical_list";
	}

	@RequestMapping(value = "Musical_select")
	public String getRank(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		String userId = CmmUtil.nvl((String)session.getAttribute("userId"));
		
		if(userId.equals("")) {
			model.addAttribute("msg","로그인이 필요한 서비스 입니다.");
			model.addAttribute("url","/login.do");
			return "/redirect";
		}
		
		String str = CmmUtil.nvl(request.getParameter("sort"));
		if (str == null) {
			str = "Month";
		}
		if (!str.equals("Month") && !str.equals("Week") && !str.equals("Alpha")) {
			str = "Month";
		}
		List<MusicalInfoDTO> rList = musicalService.getRank(str);

		if (rList == null) {
			rList = new ArrayList<MusicalInfoDTO>();
		}

		log.info(rList.size() + "-------------------------");

		model.addAttribute("rList", rList);
		model.addAttribute("str", str);

		return "/musical_list1";
	}

	@RequestMapping(value = "musical/detail/{id}")
	public String musicalDetail(@PathVariable("id") String id, HttpServletRequest request, Model model)
			throws Exception {

		log.info(this.getClass().getName() + "musicalDetail start");
		String str = CmmUtil.nvl(request.getParameter("sort"));
		if (str == null) {
			str = "Month";
		}
		if (!str.equals("Month") && !str.equals("Week") && !str.equals("Alpha")) {
			str = "Month";
		}
		MusicalInfoDTO musicalInfo = musicalService.getDetailInfo(id, str);
		List<ActorInfoDTO> aList = musicalService.getActorInfo(id, str);
		if (aList == null) {
			aList = new ArrayList<ActorInfoDTO>();
		}

		log.info("aList : " + aList.size());

//		log.info("************************");
//		log.info(musicalInfo.get(id));
//		log.info("************************");
		// pk에 해당하는 뮤지컬이 없어? 그러면 오류를 처리해줘야되니까 그걸 mapper는 sql만 처리해주는 쪽이기 때문에 보통 그런 로직들은
		// service에서 처리해줌
		// service -> mapper -> sql문으로 pk에 해당하는 뮤지컬정보를 dto로 가져오기
		// model에 위에서 가져온 dto 값 넣기

		model.addAttribute("musicalDto", musicalInfo);
		model.addAttribute("aList", aList);

		log.info(musicalInfo + "------------------------------------------------------------");

		log.info(this.getClass().getName() + "musicalDetail end");
		return "/musical_info";
	}
}
