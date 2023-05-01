package boot.study.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import boot.study.dto.ServiceDto;
import boot.study.service.MyService;
import naver.cloud.NcpObjectStorageService;

@Controller
public class HomeController {
	@Autowired
	private MyService myservice;

	@Autowired
	private NcpObjectStorageService storageService;
	//버켓이름지정
	private String bucketName="bit701-bucket-97";//각자 자기 버켓 이름	
	@GetMapping({"/","/home1"})
	public String home1()
	{
		return "/main";//tiles.xml에 이 이름으로 정의된 definition이 적용됨
	}
	@PostMapping("/insert")
	@ResponseBody void insertt(@RequestBody String jsondata) {
	    System.out.println("jsondata="+jsondata);
	    ObjectMapper mapper = new ObjectMapper();
	    try {
	        ServiceDto[] dtos = mapper.readValue(jsondata, ServiceDto[].class);
	        for (ServiceDto dto : dtos) {
	            myservice.insertt(dto);
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
}