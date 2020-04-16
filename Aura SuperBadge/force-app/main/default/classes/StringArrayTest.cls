public class StringArrayTest {
    public static List<String> generateStringArray(Integer num){
        List<String> numberOfText = new List<String>();
        for(Integer i = 0; i < num; i++){
            numberOfText.add('Test ' + i);
        }
        return numberOfText;
    }
}