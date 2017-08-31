package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBCon;

public class BoardServiceImpl implements BoardService {
/*
	@Override
	public List<HashMap> selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public int insertBoard() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard() {
		// TODO Auto-generated method stub
		return 0;
		
	}

	@Override
	public List<Map<String,String>> selectBoardList() {
		Connection con;
		List<Map<String, String>> boardList = new ArrayList<Map<String, String>>();
		try {
			DBCon db = new DBCon();
			con = db.getCon();
			String sql = "select * from board where 1=1";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Map<String, String> rHm = new HashMap<String, String>();
				rHm.put("b_num", rs.getString("b_num"));
				rHm.put("title", rs.getString("title"));
				rHm.put("content", rs.getString("content"));
				rHm.put("reg_date", rs.getString("reg_date"));
				rHm.put("writer", rs.getString("writer"));
				boardList.add(rHm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public HashMap selectBoard() {
		
		// TODO Auto-generated method stub
		return null;
	}

}
