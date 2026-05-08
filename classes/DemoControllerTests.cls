@isTest
private class DemoControllerTests {

    @isTest 
    static void testConstructor() {

        Contact contact = new Contact(
            LastName = 'Smith',
            External_TXT__c = 'EXT-454'
        );
        insert contact;

        Test.setCurrentPage(Page.DemoPage);   	
        ApexPages.currentPage().getParameters().put('lastName', 'Smith');

        DemoController demo = new DemoController(
            new ApexPages.StandardController(contact)
        );

        System.assertEquals(
            contact.Id,
            ApexPages.currentPage().getParameters().get('id')
        );
    }

    @isTest 
    static void testGetAppVersion() {
        DemoController demo = new DemoController();
        System.assertEquals('1.0.0', demo.getAppVersion());
    }
}