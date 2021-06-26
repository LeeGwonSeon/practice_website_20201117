package testserver.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SyouhinDAO {
	private static SyouhinDAO instance = new SyouhinDAO();
	private static String[] syouhin_img = new String[24];
	private static int leftCount = 0;
	private static String temp_syouhinmei = "";
	private String ts = "";
	private int tn = 0;
	private int ts_count = 0;
	private static String dbFile = "F:\\jee-2021-03\\workspace\\testserver\\src\\main\\webapp\\test.db";
	
	public static SyouhinDAO getinstance() {
		if(instance==null)
            instance=new SyouhinDAO();
        return instance;
	}
	
	public static String[] getImg() {
		return syouhin_img;
	}
	
	public static String getsyouhinmei() {
		return temp_syouhinmei;
	}
	
	public static int selectCount() {	
		return leftCount;
	}
	
	public static void setCount(int pg) {
		leftCount = leftCount - pg;
	}
	
	public static SyouhinDAO getInstance() {
		return instance;
	}
	
	private void setSyouhinmei(String string) {
		// TODO Auto-generated method stub
		temp_syouhinmei = string;
	}
	
	private String getSyouhinmei() {
		// TODO Auto-generated method stub
		return temp_syouhinmei;
	}
	
	private void setts(String string) {
		// TODO Auto-generated method stub
		ts = string;
	}
	
	public String getts() {
		// TODO Auto-generated method stub
		return ts;
	}
	
	private void settn(int inp) {
		// TODO Auto-generated method stub
		tn = inp;
	}
	
	public int gettn() {
		// TODO Auto-generated method stub
		return tn;
	}
	
	private void setts_count(int inp) {
		// TODO Auto-generated method stub
		ts_count = inp;
	}
	
	public int getts_count() {
		// TODO Auto-generated method stub
		return ts_count;
	}
	
	public List<SyouhinDAO> getlist(int start_row, int end_row){
    	
    	List<SyouhinDAO> list = null;
    	Connection con = null; 
    	String sql = "SELECT * FROM syouhin";
    	try {
    		con = DriverManager.getConnection("jdbc:sqlite:" + dbFile); 
    		PreparedStatement stat = con.prepareStatement(sql);
			ResultSet rs = stat.executeQuery(); 
			if (rs.next()) { 
				list = new ArrayList<>(); 
				do {
					SyouhinDAO board = new SyouhinDAO();
					String dump = rs.getString("syouhinmei");
					int nedan_dump = rs.getInt("nedan");
					int kosu_dump = rs.getInt("kosu");
					board.setts(dump);	
					board.settn(nedan_dump);	
					board.setts_count(kosu_dump);	
					list.add(board); 
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return list; 
    }

	public int getCount(){
		int count = 0;
		String sql = "select count(*) from syouhin";
		Connection con = null; 
		try {
			con = DriverManager.getConnection("jdbc:sqlite:" + dbFile); 
			PreparedStatement stat = con.prepareStatement(sql);
			ResultSet rs = stat.executeQuery(); 
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return count;
	}
	
	public SyouhinDAO getsyouhin(String syouhinmei) {
		int count = 0;
		String sql = "select * from syouhin where syouhinmei like '" + syouhinmei + "'";
		Connection con = null; 
		SyouhinDAO board = new SyouhinDAO();
		try {
			con = DriverManager.getConnection("jdbc:sqlite:" + dbFile); 
			PreparedStatement stat = con.prepareStatement(sql);
			ResultSet rs = stat.executeQuery(); 
			if(rs.next()){
				String dump = rs.getString("syouhinmei");
				int nedan_dump = rs.getInt("nedan");
				int kosu_dump = rs.getInt("kosu");
				board.setts(dump);	
				board.settn(nedan_dump);	
				board.setts_count(kosu_dump);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return board;
	}
	
	public int updateSyouhin(int quantity, String syouhinmei) {
		int count = 0;
		String sql = "update syouhin set kosu = (kosu - " + quantity + ") where syouhinmei like '" + syouhinmei + "'";
		System.out.println(sql);
		Connection con = null; 
		SyouhinDAO board = new SyouhinDAO();
		try {
			con = DriverManager.getConnection("jdbc:sqlite:" + dbFile); 
			PreparedStatement stat = con.prepareStatement(sql);
			count = stat.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return count;
	}
}
