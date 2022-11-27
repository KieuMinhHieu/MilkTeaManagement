/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import sample.tea.Cart;
import sample.tea.TeaDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class OrderDAO {

    private static final String INSERT_ORDER = " INSERT INTO tblOrders (userID,date,total) VALUES (?,?,?)";
    private static final String INSERT_ORDERDETAIL="  INSERT INTO tblOrderDetail (orderID,productID,price,quantity) VALUES (?,?,?,?)";
    private static final String  GET_ORDERID="SELECT TOP 1 orderID FROM tblOrders ORDER BY orderID DESC";
    
    public boolean addOrder(String userID, Cart cart) throws SQLException{
        boolean check=false;
        check=insertTblOder(userID, cart.getTotal());
        if(check){
            check=insertTblOrderDetail(cart);
        }
        return check;
    }
    
    public String getMaxOderID() throws SQLException{
        String orderID="";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                ptm=conn.prepareStatement(GET_ORDERID);
                rs=ptm.executeQuery();
                if(rs.next()){
                    orderID=rs.getString("orderID");
                }
            }
        } catch (Exception e) {
        }
        finally{
            if(rs!=null)rs.close();
            if(ptm!=null)ptm.close();
            if(conn!=null)conn.close();
        }
        return orderID;
    }
    
    public boolean insertTblOder(String userID, double total) throws SQLException{
        boolean check=false;
        LocalDate curDate=LocalDate.now();
        String date=curDate.toString();
        Connection conn=null;
        PreparedStatement ptm=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                ptm=conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, userID);
                ptm.setString(2, date);
                ptm.setDouble(3, total);
                check=ptm.executeUpdate() > 0 ? true:false;
            }
        } catch (Exception e) {
        }
        finally{
            if(ptm!=null)ptm.close();
            if(conn!=null)conn.close();
        }
        return check;
    } 
    
    public boolean insertTblOrderDetail(Cart cart){
        boolean check=false;
        Connection conn=null;
        PreparedStatement ptm=null;
        String orderID="";
        try {
            orderID=getMaxOderID();
            conn=DBUtils.getConnection();
            if(conn!=null){
                ptm=conn.prepareStatement(INSERT_ORDERDETAIL);
                for (TeaDTO tea : cart.getCart().values()) {
                    ptm.setString(1, orderID);
                    ptm.setString(2, tea.getProductID());
                    ptm.setDouble(3, tea.getPrice());
                    ptm.setInt(4, tea.getQuantity());
                    check=ptm.executeUpdate() > 0?true:false;
                    if(check==false){
                        check=false;
                        break;
                    }
                }
            }
        } catch (Exception e) {
        }
        
        return check;
    }
    
    
}
