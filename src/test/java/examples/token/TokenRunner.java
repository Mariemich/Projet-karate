package examples.token;

import com.intuit.karate.junit5.Karate;

public class TokenRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("token").relativeTo(getClass());
    }  
}
