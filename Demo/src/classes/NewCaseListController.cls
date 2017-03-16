public class NewCaseListController {
    
    public List<case> getNewCases(){
        List<case> results =[SELECT Id,casenumber FROM Case where status='New'];
        return results;
    }
}