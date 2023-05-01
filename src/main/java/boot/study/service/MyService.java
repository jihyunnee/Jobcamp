package boot.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.study.dto.ServiceDto;
import boot.study.mapper.ServiceMapper;

@Service
public class MyService implements ServiceInter {
	@Autowired
	private ServiceMapper serviceMapper;
	@Override
	public void insertt(ServiceDto dto) {
		// TODO Auto-generated method stub
		serviceMapper.insertt(dto);
	}

}
