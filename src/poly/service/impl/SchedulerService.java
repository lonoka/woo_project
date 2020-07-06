package poly.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import poly.service.IMusicalService;
import poly.service.ISchedulerService;

@Component
@Service("SchedulerService")
public class SchedulerService implements ISchedulerService {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MusicalService")
	private IMusicalService musicalService;

	@Scheduled(cron = "0 0 0 * * ?")
	@Override
	public void alphaCrewlling() throws Exception {
		musicalService.getMusicalInfoFromWEB1();
	}
	
	@Scheduled(cron = "0 0 0 * * ?")
	@Override
	public void weekCrewlling() throws Exception {
		musicalService.getMusicalInfoFromWEB2();
	}

	@Scheduled(cron = "0 0 0 * * ?")
	@Override
	public void monthCrewlling() throws Exception {
		musicalService.getMusicalInfoFromWEB3();
	}

}
