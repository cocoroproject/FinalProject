package cocoro.studygroup.dao;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cocoro.mapper.StudyGroupMapper;
import cocoro.studygroup.model.StudyGroup;
import cocoro.user.model.Users;

public class StudyGroupDao {
	public static StudyGroupDao dao = new StudyGroupDao();

	public static StudyGroupDao getInstance() {
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
	
	
	public int createStudy(StudyGroup studygroup) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).createStudy(studygroup);
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
	
	public int selectS_id(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		if(sqlSession.getMapper(StudyGroupMapper.class).selectS_id() == null)
		{
			return 0;
		}
		else
		{
			return sqlSession.getMapper(StudyGroupMapper.class).selectS_id();
		}
	}

	public List<StudyGroup> listStudyGroup(StudyGroup studygroup) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(StudyGroupMapper.class).listStudyGroup(studygroup);
	}

	public StudyGroup selectStudy(int s_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(StudyGroupMapper.class).selectStudy(s_id);
	}

	public int updateHit(StudyGroup studygroup) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).updateHit(studygroup);
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

	

	public int applyStudy(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try 
		{
			re = sqlSession.getMapper(StudyGroupMapper.class).applyStudy(map);
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
//	public int updateHitcount(StudyGroup studygroup) {
//		SqlSession sqlSession = getSqlSessionFactory().openSession();
//		int re = -1;
//		try 
//		{
//			re = sqlSession.getMapper(StudyGroupMapper.class).updateHitcount(studygroup);
//			if(re > 0)
//			{
//				sqlSession.commit();
//			}
//			else
//			{
//				sqlSession.rollback();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally{
//			sqlSession.close();
//		}
//		return re;
//	}
//	
	
	public Users selectUsers(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(StudyGroupMapper.class).selectUsers(map);
	}
	

}
	
