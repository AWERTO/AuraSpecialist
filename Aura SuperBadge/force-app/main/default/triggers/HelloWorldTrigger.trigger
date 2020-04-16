trigger HelloWorldTrigger on Account (before insert) {
    for(Account acc : Trigger.New)
        acc.Description = 'New Description';
}