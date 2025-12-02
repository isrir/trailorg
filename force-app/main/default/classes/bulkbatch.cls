@isTest
public class bulkbatch {
    @isTest static void test(){
        List<Case> c = new List<Case>();
        for(Integer i=0;i<100;i++){
            Case cl = new Case();
            cl.Status ='New';
            cl.Origin ='Web';
            c.add(cl);
        }
        insert c;
        dr_AcademicInterestBatch thisBatch = new dr_AcademicInterestBatch();
        DataBase.executeBatch(thisBatch);
        
    }
}