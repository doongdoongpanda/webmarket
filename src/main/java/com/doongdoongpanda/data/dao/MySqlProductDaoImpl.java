package com.doongdoongpanda.data.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.doongdoongpanda2.domain.model.Product;


public class MySqlProductDaoImpl implements ProductDao {
	private final static String COLUMN_ID = "p_id";
	private final static String TABLE_NAME = "product";

	
	
    public MySqlProductDaoImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("jdbc 드라이버 로드 실패");
        }
    }
    
    @Override
    public List<Product> getAll() {
        // TODO Auto-generated method stub
    	List<Product> results = new ArrayList<>();
    	
       try (
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
    	Statement stmt = conn.createStatement();){
    	   String sql = "SELECT * FROM product";
    	   try(ResultSet rs=stmt.executeQuery(sql)){
    	
    
               while (rs.next()) {
                   String id = rs.getString(COLUMN_ID);
                   String name = rs.getString("p_name");
                   int unitPrice = rs.getInt("p_unitPrice");
                   String description = rs.getString("p_description");
                   String category = rs.getString("p_category");
                   String manufacturer = rs.getString("p_manufacturer");
                   long unitsInStock = rs.getLong("p_unitsInsStock");
                   String condition = rs.getString("p_condition");

                   Product product = new Product(id, name, unitPrice);
                   product.setDescription(description);
                   product.setCategory(category);
                   product.setManufacturer(manufacturer);
                   product.setUnitsInsStock(unitsInStock);
                   product.setCondition(condition);

                   results.add(product);
               }
       }
       } catch (SQLException e) {
           throw new IllegalStateException("db 연결 실패" + e.getMessage());
       }
       return results;
   }

    @Override
    public void insert(Product product) {
    	String sql="INSERT INTO product VALUES(?, ?,  ?, ?, ?, ?, ?, ?)";
   try (
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
		   PreparedStatement stmt = conn.prepareStatement(sql);){
	   stmt.setString(1, product.getId());
	   stmt.setString(2, product.getName());
	   stmt.setInt(3, product.getUnitPrice());
	   stmt.setString(4, product.getDescription());
	   stmt.setString(5, product.getCategory());
	   stmt.setString(6, product.getManufacturer());
	   stmt.setLong(7, product.getUnitsInsStock());
	   stmt.setString(8, product.getCondition());
	   stmt.executeUpdate();
   } catch (SQLException e) {
	   throw new IllegalStateException("insert 실패" + e.getMessage());
   }
  
    }

    @Override
    public void update(Product product) {
    	String sql="UPDATE ? SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, p_manufacturer=?, p_unitsInsStock=?, p_condition=?";
   try (
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
		   PreparedStatement stmt = conn.prepareStatement(sql);){
	   stmt.setString(1, TABLE_NAME);
	   stmt.setString(2, product.getName());
	   stmt.setInt(3, product.getUnitPrice());
	   stmt.setString(4, product.getDescription());
	   stmt.setString(5, product.getCategory());
	   stmt.setString(6, product.getManufacturer());
	   stmt.setLong(7, product.getUnitsInsStock());
	   stmt.setString(8, product.getCondition());
	   stmt.executeUpdate();
   } catch (SQLException e) {
	   throw new IllegalStateException("update 실패" + e.getMessage());
   }
        
    }

    @Override
    public void delete(Product product) {
        // TODO Auto-generated method stub
    	String sql="DELETE FROM ? WHERE p_id=?";
   try (
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
		   PreparedStatement stmt = conn.prepareStatement(sql);){
	   stmt.setString(1, TABLE_NAME);
	   stmt.setString(2, product.getId());

	   stmt.executeUpdate();
   } catch (SQLException e) {
	   throw new IllegalStateException("delete 실패" + e.getMessage());
   }
         
    }

}