package ssu.databases.agency;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

/**
 * Spring Boot application launcher
 *
 * @author Swop4a
 * @version 1.0
 */

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        ApplicationContext run = SpringApplication.run(Application.class, args);

//        String[] beans = run.getBeanDefinitionNames();
//        for (String name : beans) {
//            System.out.println(name);
//        }
    }
}
