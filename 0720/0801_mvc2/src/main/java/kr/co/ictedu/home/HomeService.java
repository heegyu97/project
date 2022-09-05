package kr.co.ictedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.ProductDTO;

@Service
public class HomeService {

		@Autowired
		private HomeDAO dao;	
		

		public List<ProductDTO> ldislist() {
			List<ProductDTO> ldislist = null;
			ldislist = dao.ldislist();
			return ldislist;
		}
		public List<ProductDTO> hdislist() {
			List<ProductDTO> hdislist = null;
			hdislist = dao.hdislist();
			return hdislist;
		}
		public List<ProductDTO> lpricelist() {
			List<ProductDTO> lpricelist = null;
			lpricelist = dao.lpricelist();
			return lpricelist;
		}
		public List<ProductDTO> hpricelist() {
			List<ProductDTO> hpricelist = null;
			hpricelist = dao.hpricelist();
			return hpricelist;
		}
		public List<ProductDTO> looklist() {
			List<ProductDTO> looklist = null;
			looklist = dao.looklist();
			return looklist;
		}

		public List<ProductDTO> recencylist() {
			List<ProductDTO> recencylist = null;
			recencylist = dao.recencylist();
			return recencylist;
		}
		
		
	
}
