package cocoro.studygroup.service;

import java.util.List;
import java.util.Map;

import cocoro.studygroup.dao.StudyDetailDao;
import cocoro.studygroup.dao.StudyGroupDao;
import cocoro.studygroup.model.Apply;
import cocoro.studygroup.model.Applydata;
import cocoro.studygroup.model.PlanInfo;
import cocoro.studygroup.model.StudyActivity;
import cocoro.studygroup.model.StudyGroup;

public class StudyDetailService {
	
	public static StudyDetailDao dao;
	public static StudyDetailService service = new StudyDetailService();
	
	public static StudyDetailService getInstance(){
		dao = StudyDetailDao.getInstance();
		return service;
	}
	
	public int createStudyPlanService(PlanInfo pi){
		return dao.insertSchedule(pi);
	}
	public List<Applydata> applyList(int s_id){		
		
		return dao.applyListinfo(s_id);
		
	}
	
	public int deleteApply(int apply_id){
		
		return dao.deleteApply(apply_id);
	}
	
	public Apply selectApply(int apply_id){
		
		return dao.selectApply(apply_id);
	}
	public int insertActivity(Apply apply){
		
		return dao.insertActivity(apply);
	}
	
	public Object listCalendarService(int s_id){
		return dao.listCalendarService(s_id);
	}
	
	public StudyGroup selectStudy(int s_id){
		return dao.selectStudy(s_id);
	}
	
	public StudyActivity selectActivity(Apply apply){
		
		return dao.selectActivity(apply);
	}
	public void insertAbiliy(Map<String, Integer> map){
		dao.insertAbiliy(map);
	}
	
}


