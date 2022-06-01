package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.CustomerVO;

public class CustomerDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConnection() {
		try {
			Context initctx= new InitialContext(); 
			DataSource ds = (DataSource)initctx.lookup("java:comp/env/jdbc/OracleDB");
			
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<CustomerVO> selectAll() {
		
		getConnection();
		
		ArrayList<CustomerVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from signtbl";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				CustomerVO cvo = new CustomerVO();
				cvo.setId(rs.getString(1));
				cvo.setName(rs.getString(2));
				cvo.setPasswd1(rs.getString(3));
				cvo.setPasswd2(rs.getString(4));
				cvo.setMail(rs.getString(5));
				cvo.setTele(rs.getString(6));
				cvo.setAddress(rs.getString(7));
				cvo.setAge(rs.getInt(8));
				
				arrlist.add(cvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return arrlist;
	}
	
	public void deleteCustomer(String id) {
		
		getConnection();
		try {
			String sql = "delete from signtbl where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally{
			if(pstmt!=null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn!=null){try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
	}
}
