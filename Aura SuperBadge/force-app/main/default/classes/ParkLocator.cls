public class ParkLocator {
    public static String[] country(String names){
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(names);
    }
}