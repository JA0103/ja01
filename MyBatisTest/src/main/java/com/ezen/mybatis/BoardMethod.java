package com.ezen.mybatis;

import java.util.List;

public interface BoardMethod {
	public BoardVO selectOne(int id);
	public List<BoardVO> selectAllMember();
}
