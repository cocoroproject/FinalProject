package cocoro.studygroup.service;

import java.util.HashMap;
import java.util.List;

import cocoro.studygroup.dao.StudyGroupDao;
import cocoro.studygroup.model.StudyActivity;
import cocoro.studygroup.model.StudyGroup;
import cocoro.user.model.Users;

public class StudyCRUDService {
	public static StudyGroupDao dao;
	public static StudyCRUDService service = new StudyCRUDService();
	
	public static StudyCRUDService getInstance(){
		dao = StudyGroupDao.getInstance();
		return service;
	}
	public int createStudyGruopService(StudyGroup studygroup){
		studygroup.setS_id(dao.selectS_id()+1);
		System.out.println(studygroup.getS_id());
		return dao.createStudy(studygroup);
	}
	
	public List<StudyGroup> listStudyGroupService(StudyGroup studygroup){
		List<StudyGroup> list = dao.listStudyGroup(studygroup);
		return list;
	}
	public StudyGroup selectStudyService(int s_id){
		return dao.selectStudy(s_id);
	}
	
	public List<Users> selectStduyMember(int s_id){
		return dao.selectStudyMember(s_id);
	}
	
	public int updateHit(StudyGroup studygroup){
		return dao.updateHit(studygroup);
	}
	
	public int applyService(int u_id, int s_id, int rank_for_apply){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("u_id", u_id);
		map.put("s_id", s_id);
		map.put("rank_for_apply", rank_for_apply);
		return dao.applyStudy(map);
	}
	
//	public int updateHitcount(StudyGroup studygroup){
//		return dao.updateHitcount(studygroup);
//	}
	
	public Users selectUsers(int s_id, int s_leader_id){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("s_id",s_id);
		map.put("s_leader_id", s_leader_id);
		return dao.selectUsers(map);
	}

	
	
}
