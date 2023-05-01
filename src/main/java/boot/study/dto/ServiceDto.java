package boot.study.dto;


import java.sql.Date;
import java.time.LocalDateTime;


import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ServiceDto")
public class ServiceDto {
		private int num;
	    private String title;
	    private Date start;
	    private Date end;
	    private Boolean allday;
	    }


