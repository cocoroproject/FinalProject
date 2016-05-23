package cocoro.mapper;


import java.util.HashMap;
import java.util.List;

import cocoro.search.model.Search;
import cocoro.user.model.Comment;
import cocoro.user.model.Follow;
import cocoro.user.model.Likes;
import cocoro.user.model.Mento;
import cocoro.user.model.Message;
import cocoro.user.model.Users;
import cocoro.user.model.UsersAccount;

public interface UsersMapper {
	public List<Users> searchPeople(Search search);
	int insertUsers(Users user);					 	//회원가입
	Users usersLogin(HashMap<String,String> login); 	//로그인
	int usersLoginTime(int u_id);						//로그인 할때마다 최신 시간 업데이트
	Users usersInfo(int u_id);          				//회원정보 가져오기
	List<Users> usersList();					     	//모든 회원 리스트
	List<Users> usersFollowList(int u_id);				 //회원이 팔로우하고있는 리스트 
	int usersMento(Mento Mento);						 //멘토등록
	Mento usersMentoCheck(int u_id);                     //멘토 여부
	int usersMentoUpdate(Mento mento);					 //멘토 업데이트
	int usersMentoDelete(int u_id);						 //멘토삭제
	int usersFollow(HashMap<String, Integer> follow);	 //팔로우 걸기 
	int usersUnFollow(HashMap<String,Integer> unFollow);//팔로우 해제
	Follow usersFollowCheck(HashMap<String, Integer> usersUnFollow);//팔로우 체크
	int usersModify(Users users);						 //회원수정
	int usersAccount(UsersAccount usersAccount); 	 	//계좌번호등록
	UsersAccount usersAccountInfo(int u_id); 		 	//회원계좌정보
	List<UsersAccount> usersAccountNumber();			 //회원들 계좌번호 뽑아오기(중복값 체크)
	int usersAccountPlus(UsersAccount usersAccount); 	//계좌 입금 
	int usersAccountMinus(UsersAccount usersAccount);	//계좌 출금
	int usersAfter(Comment commnet);					//후기남기기
	List<Comment> usersAfterInfo(int u_id);				//후기 불러오기
	List<Users> usersAfterUsersInfo(int u_id);          //후기남긴 애들 정보 불러오기
	int usersLike(HashMap<String, Integer> usersLike);  //좋아요 누르기
	List<Likes> usersLikeNum(int u_id);					//회원을 좋아요 누른 상대들 
	int usersLikeUpdate(int u_id);						 //좋아요 누를 때 마다 업데이트
	int usersLikeMinusUpdate(int u_id);					 //좋아요 누를때마다 - 업데이트
	Likes usersLikeCheck(HashMap<String, Integer> usersLikeCheck); //회원이랑 친구랑 좋아요관계인가 체크
	List<Mento> usersMentoList();						//멘토리스트 뽑아오기
	int usersUnLike(HashMap<String, Integer> usersUnLike);//좋아요 취소
	List<Users> autoSearch(String searchKey);			//자동완성 
	Users joinSearch(String searchKey);				//중복체크
	int sendMessage(Message message);					//메세지 보내기
	List<Message> receiveMessage(int message_o_id);     //받은 메세지 검색
	List<Users> receiveInfo(int message_o_id);			//받은 메세지를 보낸사람의 정보
	List<Message> postMessage(int message_u_id);     //받은 메세지 검색
	List<Users> postInfo(int message_u_id);			//받은 메세지를 보낸사람의 정보
	int delMessage(int message_id);					//메세지 삭제

}
