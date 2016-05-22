package cocoro.studygroup.dao;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.parser.JSONParser;

import cocoro.mapper.StudyGroupMapper;
import cocoro.studygroup.model.Apply;
import cocoro.studygroup.model.Applydata;
import cocoro.studygroup.model.PlanInfo;
import cocoro.studygroup.model.StudyActivity;
import cocoro.studygroup.model.StudyGroup;
import net.sf.json.JSONArray;

public class StudyDetailDao {

	public static StudyDetailDao dao = new StudyDetailDao();

	public static StudyDetailDao getInstance() {
		return dao;
	}

	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "cocoro/mybatis-config.xml";
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(input);
	}
	
	
	public int insertSchedule(PlanInfo pi ) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).insertSchedule(pi);
			if(re > 0)
			{
				sqlSession.commit();
			}
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}

	public List<Applydata> applyListinfo(int s_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(StudyGroupMapper.class).applyListinfo(s_id);
	}

	public int deleteApply(int apply_id) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).deleteApply(apply_id);
			if(re > 0)
			{
				sqlSession.commit();
			}
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}

	public Apply selectApply(int apply_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(StudyGroupMapper.class).selectApply(apply_id);
	}

	public int insertActivity(Apply apply) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).insertActivity(apply);
			if(re > 0)
			{
				sqlSession.commit();
			}
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}

	public Object listCalendarService(int s_id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		
		List callist=sqlSession.getMapper(StudyGroupMapper.class).listCalendarService(s_id);
		 //System.out.println(callist.toString());
		sqlSession.close();
		
		for (int i = 0; i < callist.size(); i++) {
			String date = ((PlanInfo)callist.get(i)).getPlan_date();
			String cut = date.substring(0, 10);
			((PlanInfo)callist.get(i)).setPlan_date(cut);
		}
		
		//JSONObject caljmain=new JSONObject();
		JSONArray caljArray=new JSONArray();
		
		String cal=caljArray.fromObject(callist).toString();
		JSONParser calparser=new JSONParser();
		
		try {
			Object re=calparser.parse(cal);
			return re;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public StudyGroup selectStudy(int s_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		System.out.println("dao"+s_id);
		return sqlSession.getMapper(StudyGroupMapper.class).choseStudy(s_id);
	}

	public StudyActivity selectActivity(Apply apply) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(StudyGroupMapper.class).selectActivity(apply);
	}

	public int insertAbiliy(Map<String, Integer> map) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).insertAbiliy(map);
			if(re > 0)
			{
				sqlSession.commit();
			}
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}
	
}
