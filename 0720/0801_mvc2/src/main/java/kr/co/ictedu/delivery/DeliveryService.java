package kr.co.ictedu.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.DeliveryDTO;

@Service
public class DeliveryService {
	
	
	@Autowired
	private DeliveryDAO dao;

	public List<DeliveryDTO> list(String m_no) {
		List<DeliveryDTO> list = null;
		list = dao.list( m_no );
		return list;
	}//list

	public int write(DeliveryDTO dto) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}//write

	public int delete(DeliveryDTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete



}//class
