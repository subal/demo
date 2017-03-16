public class ParkLocator {
    public static List<String> country(String countryName){
        ParkService.ParksImplPort parkservice = new ParkService.ParksImplport();
        System.debug(parkservice.byCountry(countryName));
        return  parkservice.byCountry(countryName);
    }
}