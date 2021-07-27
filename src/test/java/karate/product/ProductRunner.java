package karate.product;

import com.intuit.karate.junit5.Karate;

public class ProductRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
