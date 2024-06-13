package xyz.calebwarner.personal_website;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class PersonalWebsiteApplication {

	@GetMapping("/welcome")
	public String welcome() {
		return "Welcome to Caleb's website!";
	}

	private int counter;

	@GetMapping("/api")
	public String getApi() {
		counter++;
        return "You have accessed the api! You've accessed this api " + counter + " times!";
	}

	public static void main(String[] args) {
		SpringApplication.run(PersonalWebsiteApplication.class, args);
	}

}
