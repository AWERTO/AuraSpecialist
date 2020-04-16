@isTest
private class ParkLocatorTest {
	@isTest static void testCallouts(){
        System.Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String countries = 'Germany';
        String[] result = ParkLocator.country(countries);
        System.assertEquals(new String[]{'Germany', 'India', 'Japan', 'United States'}, result);
    }
}