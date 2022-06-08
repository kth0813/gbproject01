package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.ListVO;

public class ListDAO {
	
	//데이터 접속
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		public void getConnection() {
			try {			
				Context initctx = new  InitialContext();
				DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
				conn = ds.getConnection();
			}catch(Exception e) {
				e.printStackTrace();
			}		
		}
		
	//숙소 상세
	public ListVO getOneLod(int lodnum){
		getConnection();
		ListVO lvo = new ListVO();
		try{
			String sql = "select * from lodtbl where lodnum = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, lodnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lvo.setLodnum(rs.getInt(1));
				lvo.setLodname(rs.getString(2));
				lvo.setLodprice(rs.getInt(3));
				lvo.setLodimg1(rs.getString(4));
				lvo.setLodimg2(rs.getString(5));
				lvo.setLodimg3(rs.getString(6));
				lvo.setLodimg4(rs.getString(7));
				lvo.setLodimg5(rs.getString(8));
				lvo.setLodinfo(rs.getString(9));
				lvo.setLodinfodet(rs.getString(10));
				lvo.setLodrule(rs.getString(11));
				lvo.setLodfac(rs.getString(12));
				lvo.setLodopt(rs.getString(13));
				lvo.setLodlat(rs.getDouble(14));
				lvo.setLodlng(rs.getDouble(15));
				lvo.setLodaddr(rs.getString(16));
			}
			if(conn !=null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print("숙소정보 조회 실패");
		}
		return lvo;
	}
//숙소전체리스트 반환
	public Vector<ListVO> getLodList(String q) {
		
		getConnection();
		
		Vector<ListVO> v =  new Vector<ListVO>();
		
		try {
			String sql = "select * from LODTBL where lodaddr like ? ";//숙소정보 모두 반환
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+q+"%");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ListVO lvo = new ListVO();
				
				lvo.setLodnum(rs.getInt(1)); 
				lvo.setLodname(rs.getString(2)); 
				lvo.setLodprice(rs.getInt(3));
				lvo.setLodimg1(rs.getString(4));
				lvo.setLodinfo(rs.getString(9));
				lvo.setLodrule(rs.getString(11));
				lvo.setLodfac(rs.getString(12));
				lvo.setLodopt(rs.getString(13));
				lvo.setLodaddr(rs.getString(16));
				
				v.add(lvo);
			}
			
				if(conn != null) {
					conn.close();
				}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	//체험 상세
		public ListVO getOneAct(int actnum){
			getConnection();
			ListVO lvo = new ListVO();
			try{
				String sql = "select * from acttbl where actnum = ?";
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, actnum);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					lvo.setActnum(rs.getInt(1));
					lvo.setActname(rs.getString(2));
					lvo.setActprice(rs.getInt(3));
					lvo.setActimg1(rs.getString(4));
					lvo.setActimg2(rs.getString(5));
					lvo.setActimg3(rs.getString(6));
					lvo.setActimg4(rs.getString(7));
					lvo.setActimg5(rs.getString(8));
					lvo.setActinfo(rs.getString(9));
					lvo.setActinfodet(rs.getString(10));
					lvo.setActlat(rs.getDouble(11));
					lvo.setActlng(rs.getDouble(12));
					lvo.setActaddr(rs.getString(13));
				}
				if(conn !=null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.print("체험정보 조회 실패");
			}
			return lvo;
		}
//체험전체리스트 반환
	public Vector<ListVO> getActList(String q) {
			
		getConnection();
			
		Vector<ListVO> v =  new Vector<ListVO>();
			
		try {
			String sql = "select * from ACTTBL where actaddr like ? ";//체험정보 모두 반환
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+q+"%");
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				ListVO avo = new ListVO();
					
				avo.setActnum(rs.getInt(1)); 
				avo.setActname(rs.getString(2)); 
				avo.setActprice(rs.getInt(3));
				avo.setActimg1(rs.getString(4));
				avo.setActinfo(rs.getString(9));
				avo.setActaddr(rs.getString(13));
					
				v.add(avo);
			}
				
				if(conn != null) {
					conn.close();
					}			
		}catch(Exception e) {
				e.printStackTrace();
		}
		return v;
	}	
	
	//숙소리뷰
	public Vector<ListVO> getLodReview(int lodnum) {
			
		getConnection();
			
		Vector<ListVO> v =  new Vector<ListVO>();
			
		try {
			String sql = "select * from lodrevtbl  where lodnum = ?";
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lodnum);			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				ListVO lvo = new ListVO();
					
				lvo.setLodrevnum(rs.getInt(1)); 
				lvo.setLodnum(rs.getInt(2)); 
				lvo.setLodrevname(rs.getString(3));
				lvo.setLodrevcont(rs.getString(4));
					
				v.add(lvo);
			}
				
				if(conn != null) {
					conn.close();
					}			
		}catch(Exception e) {
				e.printStackTrace();
		}
		return v;
	}
	//체험리뷰
	public Vector<ListVO> getActReview(int actnum) {
			
		getConnection();
			
		Vector<ListVO> v =  new Vector<ListVO>();
			
		try {
			String sql = "select * from actrevtbl where actnum = ?";
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, actnum);					
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				ListVO lvo = new ListVO();
					
				lvo.setActrevnum(rs.getInt(1)); 
				lvo.setActnum(rs.getInt(2)); 
				lvo.setActrevname(rs.getString(3));
				lvo.setActrevcont(rs.getString(4));
					
				v.add(lvo);
			}
				
				if(conn != null) {
					conn.close();
					}			
		}catch(Exception e) {
				e.printStackTrace();
		}
		return v;
	}
}
