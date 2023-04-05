public class ClientController {
	public static void recordIdCopy(Set<ID> recID)
    {
        //ID recId;
        List<Client__c> clList = [SELECT ID, External_TXT__c FROM Client__c WHERE ID IN:recId];
        for(Client__c cl:clList)
        {
            cl.External_TXT__c = cl.Id;
        }
        Update clList;
    }
}