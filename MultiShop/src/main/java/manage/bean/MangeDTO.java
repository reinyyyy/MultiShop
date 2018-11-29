package manage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MangeDTO {
	private String id;
	private String pwd;
	private String goods;
}
