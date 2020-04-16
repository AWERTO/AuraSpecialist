trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('vlad_mazurik@ukr.net', 'This information has been sent by trigger', 'Hello dear Vlad. This message was created and send after some reason. Right now we have contacts ' + recordCount + ' and we try to pick some values');
    }else if(Trigger.isDelete){
        //Process
    }
}