package cocoro.mapper;

public interface SearchMapper {
	
	public int insertSearchInfo();
	public int updateSearchInfo();
	
	public Integer recommendSelectS_id(int u_id);
}