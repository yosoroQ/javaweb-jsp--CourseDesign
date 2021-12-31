package save.data;
public class Record_Bean{
   String []columnName ;           //存放列名。
   String [][] tableRecord=null;   //存放查询到的记录。
   int pageSize=6;                 //每页显示的记录数。
   int totalPages=1;               //分页后的总页数。
   int currentPage =1   ;          //当前显示页 。
   int totalRecords ;             //全部记录。
   public void setTableRecord(String [][] s){
      tableRecord=s;
   }
   public String [][] getTableRecord(){
      return tableRecord;
   }
   public void setColumnName(String [] s) {
      columnName = s;
   }
   public String [] getColumnName() {
      return columnName;
   }
   public void setPageSize(int size){
      pageSize=size;
   }
   public int getPageSize(){
      return pageSize;
   } 
   public int getTotalPages(){
      return totalPages;
   } 
   public void setTotalPages(int n){
      totalPages=n; 
   }
   public void setCurrentPage(int n){
      currentPage =n;
   }
   public int getCurrentPage(){
      return currentPage ;
   }
    public int getTotalRecords(){
      totalRecords = tableRecord.length;
      return totalRecords ;
   }
}
