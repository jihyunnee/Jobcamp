package boot.study.mapper;

import org.apache.ibatis.annotations.Mapper;

import boot.study.dto.ServiceDto;

@Mapper
public interface ServiceMapper {
	public void insertt(ServiceDto dto);
}
