@isTest
private class AwesomeCalculatorTest {
    @isTest static void testCallouts(){
        System.Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        Double x = 1.0;
        Double y = 2.0;
        Double result = AwesomeCalculator.add(x, y);
        System.assertEquals(3.0, result);
    }
}