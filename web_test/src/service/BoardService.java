package service;

import java.util.HashMap;
import java.util.List;

public interface BoardService {

	List<HashMap> selectBoard();
	int insertBoard();
	int updateBoard();
	int deleteBoard();
}
