package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO vo) {
		log.info("register-------------------");
		mapper.insertSelectKey(vo);
		
	}

	@Override
	public void modify(BoardVO vo) {
		log.info("register-------------------");
		mapper.update(vo);
	}

	@Override
	public void remove(Long bno) {
		log.info("register-------------------");
		mapper.delete(bno);		
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("register-------------------");
		
		return mapper.read(bno);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("register-------------------");
		return mapper.getList();
	}

}
