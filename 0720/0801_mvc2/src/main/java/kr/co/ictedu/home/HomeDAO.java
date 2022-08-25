package kr.co.ictedu.home;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.ProductDTO;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	

	public List<ProductDTO> ldislist() {
		List<ProductDTO> ldislist = null;
		ldislist = sqlSession.selectList("HomeMapper.ldislist");
		return ldislist;
	}
	public List<ProductDTO> hdislist() {
		List<ProductDTO> hdislist = null;
		hdislist = sqlSession.selectList("HomeMapper.hdislist");
		return hdislist;
	}
	public List<ProductDTO> lpricelist() {
		List<ProductDTO> lpricelist = null;
		lpricelist = sqlSession.selectList("HomeMapper.lpricelist");
		return lpricelist;
	}
	public List<ProductDTO> hpricelist() {
		List<ProductDTO> hpricelist = null;
		hpricelist = sqlSession.selectList("HomeMapper.hpricelist");
		return hpricelist;
	}
	public List<ProductDTO> looklist() {
		List<ProductDTO> looklist = null;
		looklist = sqlSession.selectList("HomeMapper.looklist");
		return looklist;
	}
	
	public List<ProductDTO> recencylist() {
		List<ProductDTO> recencylist = null;
		recencylist = sqlSession.selectList("HomeMapper.recencylist");
		return recencylist;
	}

}
