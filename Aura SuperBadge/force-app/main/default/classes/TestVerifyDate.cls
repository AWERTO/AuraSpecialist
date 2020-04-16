@isTest 
public class TestVerifyDate 
{
    @isTest static void testMethodForDays() 
    {
        Date d = VerifyDate.CheckDates(System.today(),System.today().addDays(1));
        Date d1 = VerifyDate.CheckDates(System.today(),System.today().addDays(60));
    }
}