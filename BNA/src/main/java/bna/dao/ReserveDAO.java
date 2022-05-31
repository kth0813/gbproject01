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
			pstmt.setInt(7, rvo.getLodprice());
			
			pstmt.executeUpdate();	
			
			if(conn != null) {
				conn.close();
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//회원의 예약정보 내용 불러오기
		public Vector<ReserveVO> getAllReserveLod() throws Exception{ //String id
			
			Vector<ReserveVO> v = new Vector<>();
						
			getConnection();
			
			try {
				String sql = "select * from lodrestbl a join lodtbl b on a.lodnum=b.lodnum "; // where id = ?
						
				pstmt = conn.prepareStatement(sql);
				//pstmt.setString(1, id);
				
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
		
		
		//회원의 예약정보 내용 불러오기
		public Vector<ReserveVO> getAllReserveAct() throws Exception{ //String id
			
			Vector<ReserveVO> v = new Vector<>();
						
			getConnection();
			
			try {
				String sql = "select * from actrestbl a join acttbl b on a.actnum=b.actnum"; // where id = ?
						
				pstmt = conn.prepareStatement(sql);
				//pstmt.setString(1, id);
				
				rs	= pstmt.executeQuery();	
				
				while(rs.next()) {
					ReserveVO rvo = new ReserveVO();
					
					rvo.setActresnum(rs.getInt(1));
					rvo.setActnum(rs.getInt(2));
					rvo.setActpeople(rs.getInt(7)); 
					rvo.setActprice(rs.getInt(8)); 
					rvo.setActdate(rs.getString(4));
					rvo.setActchkin(rs.getString(5));
					rvo.setActchkout(rs.getString(6));  
					rvo.setActname(rs.getString(10));
					rvo.setActaddr(rs.getString(24));
					rvo.setActimg1(rs.getString(12));
					
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
}
