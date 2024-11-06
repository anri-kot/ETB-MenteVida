package com.mentevida.dao;

import com.mentevida.auth.Encryptor;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    private final Connection con;
    
    public UsuarioDAO() throws Exception {
        con = ConnectionManager.getConnection();
    }
    
    // Select
    
    public List<String[]> mostrarTodosUsuarios() throws Exception {
        List<String[]> list = new ArrayList<>();
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("select * from usuario");
            rs = st.executeQuery();
            
            String idUsuario;
            String username;
            String senha;
            String admin;
            
            while(rs.next()) {
                idUsuario = Integer.toString(rs.getInt("idUsuario"));
                username = rs.getString("username");
                senha = rs.getString("senha");
                admin = Boolean.toString(rs.getBoolean("admin"));
                String[] tempUsuario = {idUsuario, username, senha, admin};
                list.add(tempUsuario);
            }
            
            return list;
        } finally {
            if (st != null) {
                st.close();
                rs.close();
            }
        }
    }
    
    public List<String[]> mostrarIdUsuario(int id) throws Exception {
        List<String[]> list = new ArrayList<>();
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("select * from usuario where idUsuario = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            
            String idUsuario;
            String username;
            String senha;
            String admin;
            
            while(rs.next()) {
                idUsuario = Integer.toString(rs.getInt("idUsuario"));
                username = rs.getString("username");
                senha = rs.getString("senha");
                admin = Boolean.toString(rs.getBoolean("admin"));
                String[] tempUsuario = {idUsuario, username, senha, admin};
                list.add(tempUsuario);
            }
            
            return list;
        } finally {
            if (st != null) {
                st.close();
                rs.close();
            }
        }
    }
    
    public List<String[]> mostrarUsernameUsuarios(String input) throws Exception {
        List<String[]> list = new ArrayList<>();
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("select * from usuario where username like ?");
            st.setString(1, "%" + input + "%");
            rs = st.executeQuery();
            
            String idUsuario;
            String username;
            String senha;
            String admin;
            
            while(rs.next()) {
                idUsuario = Integer.toString(rs.getInt("idUsuario"));
                username = rs.getString("username");
                senha = rs.getString("senha");
                admin = Boolean.toString(rs.getBoolean("admin"));
                String[] tempUsuario = {idUsuario, username, senha, admin};
                list.add(tempUsuario);
            }
            
            return list;
        } finally {
            if (st != null) {
                st.close();
                rs.close();
            }
        }
    }
    
    // Add - Update - Remove
    
    public void cadastrarUsuario(String[] oUsuario) throws SQLException, NoSuchAlgorithmException {
        // oUsuario -> {idUsuario, username, senha, admin}
        PreparedStatement st = null;
        
        try {
            st = con.prepareStatement("insert into usuario (username, senha, admin) values (?, ?, ?)");
            st.setString(1, oUsuario[1]);
            st.setString(2, Encryptor.encrypt(oUsuario[2]));
            st.setBoolean(3, Boolean.parseBoolean(oUsuario[3]));
            
            st.executeUpdate();
        } finally {
            if (st != null) {
                st.close();
            }
        }
    }
    
    public void alterarUsuario(String[] oUsuario) throws SQLException, NoSuchAlgorithmException {
        // oUsuario -> {idUsuario, username, senha, admin}
        PreparedStatement st = null;
        
        try {
            st = con.prepareStatement("update usuario set username = ?, senha = ?, admin = ? where idUsuario = ?");
            st.setString(1, oUsuario[1]);
            st.setString(2, Encryptor.encrypt(oUsuario[2]));
            st.setBoolean(3, Boolean.parseBoolean(oUsuario[3]));
            st.setInt(4, Integer.parseInt(oUsuario[0]));
            
            st.executeUpdate();
        } finally {
            if (st != null) {
                st.close();
            }
        }
    }
    
    public void deletarUsuario(int id) throws SQLException {
        PreparedStatement st = null;
        
        try {
            st = con.prepareStatement("delete from usuario where idUsuario = ?");
            st.setInt(1, id);
            
            st.executeUpdate();
        } finally {
            if (st != null) {
                st.close();
            }
        }
    }
    
    public static void main(String[] args) throws Exception {
        UsuarioDAO dao = new UsuarioDAO();
        String[] usuario = {"3", "user", "user", "false"};
        dao.alterarUsuario(usuario);
        List<String[]> list = dao.mostrarTodosUsuarios();
        for (int i = 0; i < list.size(); i++) {
            String[] result = list.get(i);
            System.out.println(result.toString());
        }
    }
}
