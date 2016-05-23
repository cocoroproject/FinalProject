package cocoro.search.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import cocoro.mahout.ItemRecommend;
import cocoro.mahout.TestDBOracle;
import cocoro.search.dao.SearchDao;
import cocoro.search.model.ListComparator;
import cocoro.search.model.Norm;
import cocoro.search.model.Search;
import cocoro.search.model.s_numComparator;
import cocoro.search.model.tagSearch;
import cocoro.search.model.tagSuggestion;
import cocoro.studygroup.model.StudyGroup;
import cocoro.user.model.Users;

public class SearchService {

	private static SearchService dao = new SearchService();
	private static SearchDao searchDao = null;
	private String fileName = "C:/Users/OHYEONJU/CocoPro/Cocoro/data/recommend.csv";

	public static SearchService getInstance() {
		//check 
		searchDao = SearchDao.getInstance();
		return dao;
	}

	public List<StudyGroup> searchStudy(Search search) {
		System.out.println(search.toString());

		List<StudyGroup> list = searchDao.searchResult(search);

		if (list != null
				&& list.size() != 0
				&& (search.getLevelCheck() != null || search.getLocCheck() != null)) {
			Norm norm = new Norm(search.getLat(), search.getLng(),
					search.getLevel(), list);
			Collections.sort(list, new ListComparator(norm, search));
		}

		return list;

	}

	public List<Users> searchPeople(Search search) {
		return searchDao.searchPeople(search);

	}

	public List<tagSuggestion> tagSuggest(String tag) {
		// #�넗�씡#湲고�
		String tag_2 = tag.substring(1, tag.length());
		String[] interest = tag_2.split("#");
		int tag_nums = interest.length;
		List<Integer> seq = randomMaker(tag_nums);
		List<tagSuggestion> list = new ArrayList<tagSuggestion>();
        Collections.sort(seq, new s_numComparator(interest));
		
		int flag = 1;
		for (int i = 0; i < 4; i++) {
			/*
			 * if(i!=0&&seq[i-1]==seq[i]){ flag++;
			 * list.add(searchDao.tagSuggest(new tagSearch("�뒪�꽣�뵒",
			 * interst[seq[i]], flag,flag+1))); }else{ flag=0;
			 * list.add(searchDao.tagSuggest(new tagSearch("�뒪�꽣�뵒",
			 * interst[seq[i]], flag,flag+1)));
			 * 
			 * }
			 */
			// 3331 諛곗뿴�� 留롮� �닚�쑝濡� �븯�뒗 寃껋씠 醫뗪쿋吏� 鍮덈룄�닔 怨좊젮 �븞�븯怨� �씠寃쎌슦�뿉�뒗 
			if (i != 3&&seq.get(i) == seq.get(i+1)){
				flag++;
			} else {
				List<tagSuggestion> tmp = (searchDao.tagSuggest(new tagSearch("�뒪�꽣�뵒",
						interest[seq.get(i)], 1, flag)));
				if(tmp.size()<flag&&i!=3){
					int tp_next = seq.get(i+1);
					i = i-(flag-tmp.size());
					for(int j=i+1;j<flag;j++){
					
					seq.set(j, tp_next);
				}
					}
				
				addList(list,tmp);
				flag = 1;

			}

		}

		return list;

	}

	public void addList(List<tagSuggestion> list, List<tagSuggestion> newList){
		for (int j = 0; j < newList.size(); j++) {
			list.add(newList.get(j));
		}

	}

	public List<Integer> randomMaker(int tag_nums) {
		List<Integer>seq = new ArrayList<Integer>();
		for (int i = 0; i < 4; i++) {
			seq.add(randomRange(0, tag_nums - 1));
			System.out.println("seqNum" + seq.get(i));
		}
		
		return seq;

	}

	public int randomRange(int n1, int n2) {
		return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	}

	   public List<StudyGroup> item_recommend (int u_id) throws IOException{
		   
		   if(searchDao.recommendSelectS_id(u_id) != 0 ){
		      TestDBOracle ts = new TestDBOracle();
		      ts.generateCsvFile(fileName);
		      ItemRecommend ir = new ItemRecommend();
		      List<StudyGroup> listS = null;
		      
		      
		      if(ir.recommend(searchDao.recommendSelectS_id(u_id))==null){
		    	System.out.println("I have nothing");  
		      }
		      //List<Integer> listInt=ir.recommend(searchDao.recommendSelectS_id(u_id)); 
		      //listS = searchDao.recommendStudy(listInt); 
		      
		      return listS;
		   }else{
			System.out.println("I haave nothing");
			return null;
		   }
		   
		   
		   
		   }

}
