package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.ReserveVO;

public class ReserveDAO {


	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		
		try {
			Context initctx = new InitialContext();
			DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
			
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//숙소 예약 정보 입력
	public void setReserveLod(ReserveVO rvo) throws Exception{
		
		getConnection();
		
		try {
			String sql = "insert into lodrestbl values(lodrestbl_seq.nextval, ?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rvo.getLodnum()); 
			pstmt.setString(2, rvo.getId()); 
			pstmt.setString(3, rvo.getLoddate());
			pstmt.setString(4, rvo.getLodchkin());
			pstmt.setString(5, rvo.getLodchkout());
			pstmt.setInt(6, rvo.getLodpeople());
			pstmt.setInt(7, rvo.getLodresprice());
			
			pstmt.executeUpdate();	
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//체험 예약 정보 입력
	public void setReserveAct(ReserveVO rvo) throws Exception{
		
		getConnection();
		
		try {
			String sql = "insert into actrestbl values(actrestbl_seq.nextval, ?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rvo.getActnum()); 
			pstmt.setString(2, rvo.getId()); 
			pstmt.setString(3, rvo.getActdate());
			pstmt.setString(4, rvo.getActchkin());
			pstmt.setString(5, rvo.getActchkout());
			pstmt.setInt(6, rvo.getActpeople());
			pstmt.setInt(7, rvo.getActresprice());
			
			pstmt.executeUpdate();	
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원의 숙소예약정보 내용 불러오기
	public Vector<ReserveVO> getAllReserveLod(String id) throws Exception{ //String id
		
		Vector<ReserveVO> v = new Vector<>();
					
		getConnection();
		
		try {
			String sql = "select * from lodrestbl a join lodtbl b on a.lodnum=b.lodnum where id = ?"; // where id = ?
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs	= pstmt.executeQuery();	
			
			while(rs.next()) {
				ReserveVO rvo = new ReserveVO();
				
				rvo.setLodresnum(rs.getInt(1));
				rvo.setLodnum(rs.getInt(2));
				rvo.setId(rs.getString(3));
				rvo.setLoddate(rs.getString(4));
				rvo.setLodchkin(rs.getString(5));
				rvo.setLodchkout(rs.getString(6));  
				rvo.setLodpeople(rs.getInt(7)); 
				rvo.setLodresprice(rs.getInt(8));
				rvo.setLodname(rs.getString(10));
				rvo.setLodprice(rs.getInt(11));
				rvo.setLodimg1(rs.getString(12));
				rvo.setLodaddr(rs.getString(24));
				v.add(rvo);				
			}
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
		
	//회원의 체험예약정보 내용 불러오기
	public Vector<ReserveVO> getAllReserveAct(String id) throws Exception{ //String id
		
		Vector<ReserveVO> v = new Vector<>();
					
		getConnection();
		
		try {
			String sql = "select * from actrestbl a join acttbl b on a.actnum=b.actnum where id = ?"; // where id = ?
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs	= pstmt.executeQuery();	
			
			while(rs.next()) {
				ReserveVO rvo = new ReserveVO();
				
				rvo.setActresnum(rs.getInt(1));
				rvo.setActnum(rs.getInt(2));
				rvo.setId(rs.getString(3));
				rvo.setActdate(rs.getString(4));
				rvo.setActchkin(rs.getString(5));
				rvo.setActchkout(rs.getString(6));  
				rvo.setActpeople(rs.getInt(7)); 
				rvo.setActresprice(rs.getInt(8));
				rvo.setActname(rs.getString(10));
				rvo.setActprice(rs.getInt(11));
				rvo.setActimg1(rs.getString(12));
				rvo.setActaddr(rs.getString(21));
				
				v.add(rvo);				
			}
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//회원의 선택한 숙소예약정보 내용 불러오기
	public ReserveVO getOneReserveLod(Integer lodresnum) throws Exception{ //String id
								
		getConnection();
		ReserveVO rvo = new ReserveVO();

		try {
			String sql = "select * from lodrestbl a join lodtbl b on a.lodnum=b.lodnum where lodresnum=?"; // where id = ?
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lodresnum);
			rs	= pstmt.executeQuery();	
			
			if(rs.next()) {
				
				rvo.setLodresnum(rs.getInt(1));
				rvo.setLodnum(rs.getInt(2));
				rvo.setId(rs.getString(3));
				rvo.setLoddate(rs.getString(4));
				rvo.setLodchkin(rs.getString(5));
				rvo.setLodchkout(rs.getString(6));  
				rvo.setLodpeople(rs.getInt(7)); 
				rvo.setLodresprice(rs.getInt(8));
				rvo.setLodname(rs.getString(10));
				rvo.setLodprice(rs.getInt(11));
				rvo.setLodimg1(rs.getString(12));
				rvo.setLodlat(rs.getDouble(22));
				rvo.setLodlng(rs.getDouble(23));
				rvo.setLodaddr(rs.getString(24));
			}
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rvo;
	}
	//회원의 선택한 체험예약정보 내용 불러오기
	public ReserveVO getOneReserveAct(Integer actresnum) throws Exception{ //String id
								
		getConnection();
		ReserveVO rvo = new ReserveVO();

		try {
			String sql = "select * from actrestbl a join acttbl b on a.actnum=b.actnum where actresnum=?"; // where id = ?
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, actresnum);
			rs	= pstmt.executeQuery();	
			
			if(rs.next()) {
				
				rvo.setActresnum(rs.getInt(1));
				rvo.setActnum(rs.getInt(2));
				rvo.setId(rs.getString(3));
				rvo.setActdate(rs.getString(4));
				rvo.setActchkin(rs.getString(5));
				rvo.setActchkout(rs.getString(6));  
				rvo.setActpeople(rs.getInt(7)); 
				rvo.setActresprice(rs.getInt(8));
				rvo.setActname(rs.getString(10));
				rvo.setActprice(rs.getInt(11));
				rvo.setActimg1(rs.getString(12));
				rvo.setActlat(rs.getDouble(19));
				rvo.setActlng(rs.getDouble(20));
				rvo.setActaddr(rs.getString(21));
			}
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rvo;
	}	
	//선택한 숙소 삭제
	public void setReserveDeleteLod(ReserveVO rvo) {
		try {
			 getConnection();
	
			String sql="delete from lodrestbl where lodresnum=?";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, rvo.getLodresnum());
		
			pstmt.executeUpdate();
			if(conn!=null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//선택한 체험 삭제
	public void setReserveDeleteAct(ReserveVO rvo) {
		try {
			 getConnection();
	
			String sql="delete from actrestbl where actresnum=?";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, rvo.getActresnum());
		
			pstmt.executeUpdate();
			if(conn!=null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//숙소 예약 정보 수정
	public void setReserveUpdateLod(ReserveVO rvo) throws Exception{
		
		getConnection();
		
		try {
			String sql = "update lodrestbl set loddate=?,lodchkin=?,lodchkout=?,lodpeople=?,lodresprice=? where lodresnum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rvo.getLoddate());
			pstmt.setString(2, rvo.getLodchkin());
			pstmt.setString(3, rvo.getLodchkout());
			pstmt.setInt(4, rvo.getLodpeople());
			pstmt.setInt(5, rvo.getLodresprice());
			pstmt.setInt(6, rvo.getLodresnum());
			
			pstmt.executeUpdate();	
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//체험 예약 정보 수정
	public void setReserveUpdateAct(ReserveVO rvo) throws Exception{
		
		getConnection();
		
		try {
			String sql = "update actrestbl set actdate=?,actchkin=?,actchkout=?,actpeople=?,actresprice=? where actresnum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rvo.getActdate());
			pstmt.setString(2, rvo.getActchkin());
			pstmt.setString(3, rvo.getActchkout());
			pstmt.setInt(4, rvo.getActpeople());
			pstmt.setInt(5, rvo.getActresprice());
			pstmt.setInt(6, rvo.getActresnum());
			
			pstmt.executeUpdate();	
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
