/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class TeaDAO {

    private static final String LIST_TEA = "SELECT productID,name,price,quantity,categoryID,productIMG,detail FROM tblProducts";
    private static final String LIST_CATEGORY = "SELECT categoryID,name FROM tblCategory";
    private static final String LIST_LAST_PRODUCT = "SELECT TOP 4  productID,name,price,quantity,categoryID,productIMG,detail FROM tblProducts ORDER BY productID DESC";
    private static final String LIST_BEST_SELLERS = "SELECT TOP 4 productID,name,price,quantity,categoryID,productIMG,detail FROM tblProducts ORDER BY quantity ASC";
    private static final String LIST_CLASSIFY = "SELECT productID,name,price,quantity,categoryID,productIMG,detail FROM tblProducts WHERE categoryID= ?";
    private static final String LIST_GET = "SELECT productID,name,price,quantity,categoryID,productIMG,detail FROM tblProducts WHERE name LIKE ?";
    private static final String GET_TEA = "SELECT productID,name,price,quantity,categoryID,productIMG,detail FROM tblProducts WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProducts SET name= ?,price=?,quantity=?,categoryID=?,productIMG=?,detail= ? WHERE productID=?";
    private static final String DELETE = "DELETE FROM tblProducts WHERE productID=?";
    private static final String ADD = "INSERT INTO tblProducts(name,price,quantity,categoryID,productIMG,detail) VALUES (?,?,?,?,?,?)";
    private static final String GET_PRODUCT_QUANTITY = "SELECT quantity FROM tblProducts WHERE productID=?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity=? WHERE productID=?";
    private static final String CHECK_DUPLICATE = "SELECT productID FROM tblProducts WHERE name = ? OR productIMG= ?";

    public List<TeaDTO> getAllTea() throws SQLException {
        List<TeaDTO> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_TEA);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String quantity = rs.getString("quantity");
                    String categoryID = rs.getString("categoryID");
                    String productIMG = rs.getString("productIMG");
                    String detail = rs.getString("detail");
                    listTea.add(new TeaDTO(productID, name, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> listCate = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    String name = rs.getString("name");

                    listCate.add(new CategoryDTO(categoryID, name));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listCate;
    }

    public List<TeaDTO> getListLast() throws SQLException {
        List<TeaDTO> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_LAST_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String quantity = rs.getString("quantity");
                    String categoryID = rs.getString("categoryID");
                    String productIMG = rs.getString("productIMG");
                    String detail = rs.getString("detail");
                    listTea.add(new TeaDTO(productID, name, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public List<TeaDTO> getListBestSellers() throws SQLException {
        List<TeaDTO> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_BEST_SELLERS);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String quantity = rs.getString("quantity");
                    String categoryID = rs.getString("categoryID");
                    String productIMG = rs.getString("productIMG");
                    String detail = rs.getString("detail");
                    listTea.add(new TeaDTO(productID, name, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public List<TeaDTO> getListClassify(String categoryID) throws SQLException {
        List<TeaDTO> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_CLASSIFY);
                ptm.setInt(1, Integer.parseInt(categoryID));
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String quantity = rs.getString("quantity");
                    String productIMG = rs.getString("productIMG");
                    String detail = rs.getString("detail");
                    listTea.add(new TeaDTO(productID, name, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public List<TeaDTO> getListTea(String get) throws SQLException {
        List<TeaDTO> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_GET);
                ptm.setString(1, "%" + get + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String quantity = rs.getString("quantity");
                    String categoryID = rs.getString("categoryID");
                    String productIMG = rs.getString("productIMG");
                    String detail = rs.getString("detail");
                    listTea.add(new TeaDTO(productID, name, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public TeaDTO getTea(String productID) throws SQLException {
        TeaDTO tea = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TEA);
                ptm.setInt(1, Integer.parseInt(productID));
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String quantity = rs.getString("quantity");
                    String categoryID = rs.getString("categoryID");
                    String productIMG = rs.getString("productIMG");
                    String detail = rs.getString("detail");
                    tea = new TeaDTO(productID, name, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return tea;
    }

    public boolean update(TeaDTO tea) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, tea.getName());
                ptm.setDouble(2, tea.getPrice());
                ptm.setInt(3, tea.getQuantity());
                ptm.setInt(4, Integer.parseInt(tea.getCategoryID()));
                ptm.setString(5, tea.getProductIMG());
                ptm.setString(6, tea.getDetail());
                ptm.setInt(7, Integer.parseInt(tea.getProductID()));
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(int productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean addProduct(TeaDTO tea) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setString(1, tea.getName());
                ptm.setDouble(2, tea.getPrice());
                ptm.setInt(3, tea.getQuantity());
                ptm.setInt(4, Integer.parseInt(tea.getCategoryID()));
                ptm.setString(5, tea.getProductIMG());
                ptm.setString(6, tea.getDetail());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<TeaDTO> checkQuantity(Cart cart) throws SQLException {
        List<TeaDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                for (TeaDTO tea : cart.getCart().values()) {
                    ptm.setString(1, tea.getProductID());
                    rs = ptm.executeQuery();
                    if (rs.next()) {
                        if (Integer.parseInt(rs.getString("quantity")) < tea.getQuantity()) {
                            //tea.setQuantity(Integer.parseInt(rs.getString("quantity")));
                            list.add(getTea(tea.getProductID()));
                        }
                    }
                }

            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getQuantity(String productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public boolean updateQuantity(Cart cart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        int quantity = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                for (TeaDTO tea : cart.getCart().values()) {
                    quantity = getQuantity(tea.getProductID()) - tea.getQuantity();
                    ptm.setInt(1, quantity);
                    ptm.setString(2, tea.getProductID());
                    check = ptm.executeUpdate() > 0 ? true : false;
                    if (check == false) {
                        check = false;
                        break;
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public String checkDuplicate(String productName,String productIMG) throws SQLException {
        String productID = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productName);
                ptm.setString(2, productIMG);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    productID=rs.getString("productID");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productID;
    }
}
