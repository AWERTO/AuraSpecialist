public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> updatedLead = new List<Lead>();
        List<Lead> leads = [SELECT Name, LeadSource
            FROM Lead 
            WHERE LeadSource = '' 
            LIMIT 200];
        for(Lead l : leads){
            l.LeadSource = 'Dreamforce';
            updatedLead.add(l);
        }
        update updatedLead;
        }
 
}