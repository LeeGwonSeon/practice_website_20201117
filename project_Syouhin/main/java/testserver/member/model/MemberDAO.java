package testserver.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberDAO { 
	private static MemberDAO instance;
	private static String dbFile = "F:\\jee-2021-03\\workspace\\testserver\\src\\main\\webapp\\test.db"; 
    //private static Map<String,String> map = new HashMap<>(); 
    
    // 싱글톤 패턴
    private MemberDAO(){
    	//map.put("test1234","1234");
    }
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }

    public int loginCheck(String id, String pw) 
    {
    	Connection con = null;  
    	int temp_num = 0;
    	try { // SQLite JDBC 체크
    		String temp_id = "";
    		String password = "";
    		
    		Class.forName("org.sqlite.JDBC"); // SQLite 데이터베이스 파일에 연결 
   	   		con = DriverManager.getConnection("jdbc:sqlite:" + dbFile); // SQL 수행 
    		Statement stat = con.createStatement(); 
    		ResultSet rs = stat.executeQuery("SELECT ID, password FROM User where ID='"+id + "'"); 
    		
    		while(rs.next()) { 
    			temp_id = rs.getString("ID"); 
    			password = rs.getString("password");
    			if (temp_id.equals(id)){
    				if(password.equals(pw)) {      		
    					temp_num = 1;
    				}
    				else {
    					temp_num = 0;
    				}
        		}else {
        			temp_num = 0;
        		}
     		}
    	}
    	catch(Exception e) { 
    		e.printStackTrace();  
    		}
    	finally { 
    		if(con != null) { 
    			try {
    				con.close();
    				try{
    	                if ( con != null ){
    	                	con.close(); 
    	                	con=null;
    	                }
    	            }catch(Exception e){
    	                throw new RuntimeException(e.getMessage());
    	            }
    			}
    			catch(Exception e) {} 
    			} 
    		}
    		return temp_num;
    	}
    
}
