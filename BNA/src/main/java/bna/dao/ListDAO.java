package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			System.out.print("회원정보 조회 실패");
		}
		return lvo;
	}
}
