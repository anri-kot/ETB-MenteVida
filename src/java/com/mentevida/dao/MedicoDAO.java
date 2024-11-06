package com.mentevida.dao;

import com.mentevida.auth.Encryptor;
import com.mentevida.nucleo.Medico;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MedicoDAO {
    private final Connection con;
    private UsuarioDAO usu;
    
    public MedicoDAO() throws Exception {
        con = ConnectionManager.getConnection();
        usu = new UsuarioDAO();
    }
    
    /* -- SQL Operations -- */
    
    // Select
    
    public List<Medico> mostrarTodosMedicos() throws Exception {
        List<Medico> list = new ArrayList<>();
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("select * from medico");
            rs = st.executeQuery();
            
            // loop adiciona o objeto Medico numa lista
            while (rs.next()) {
                Medico tempMedico = rowToMedico(rs);
                list.add(tempMedico);
            }
            return list;
            
        } finally {
            close(st, rs);
        }
    }
    
    public List<Medico> mostrarIdMedicos(int id) throws Exception {
        List<Medico> list = new ArrayList<>();
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("select * from medico where id_medico = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            
            // loop adiciona o objeto Medico numa lista
            while (rs.next()) {
                Medico tempMedico = rowToMedico(rs);
                list.add(tempMedico);
            }
            return list;
            
        } finally {
            close(st, rs);
        }
    }
    
    public List<Medico> mostrarNomeMedicos(String nome) throws Exception {
        List<Medico> list = new ArrayList<>();
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("select * from medico where nome like ?");
            st.setString(1, "%" + nome + "%");
            rs = st.executeQuery();
            
            // loop adiciona o objeto Medico numa lista
            while (rs.next()) {
                Medico tempMedico = rowToMedico(rs);
                list.add(tempMedico);
            }
            return list;
            
        } finally {
            close(st, rs);
        }
    }
    
    // Add - Update - Remove
    
    public void cadastrarMedico(Medico oMedico) throws Exception, NoSuchAlgorithmException {
        PreparedStatement st = null;
        try {
            // Gerar usuário do médico
            String username = oMedico.getUsername();
            String senha = Encryptor.encrypt(oMedico.getSenha());
            String admin = Boolean.toString(oMedico.isAdmin());
            String[] usuario = {"", username, senha, admin}; // [idUsuario, username, senha, admin] -- admin = "true" / "false"
            usu.cadastrarUsuario(usuario);
            
            st = con.prepareStatement("insert into medico (nome, especialidade, telefone, email, idUsuario) values (?, ?, ?, ?, ?)"); 
            
            st.setString(1, oMedico.getNome());
            st.setString(2, oMedico.getEspecialidade());
            st.setString(3, oMedico.getTelefone());
            st.setString(4, oMedico.getEmail());
            st.setInt(5, oMedico.getIdUsuario());
            
            st.executeUpdate();
            
        } finally {
            if (st != null) {
                st.close();
            }
        }
    }
    
    public void atualizarMedico(Medico oMedico) throws Exception {
        PreparedStatement st = null;
        try {
            st = con.prepareStatement("update medico set nome = ?, especialidade = ?, telefone = ?, email = ?" +
                    "where id_medico = ?");
            st.setString(1, oMedico.getNome());
            st.setString(2, oMedico.getEspecialidade());
            st.setString(3, oMedico.getTelefone());
            st.setString(4, oMedico.getEmail());
            
            st.executeUpdate();
        } finally {
            if (st != null) {
                st.close();
            }
        }
    }
    
    public void deleteMedico(int id) throws Exception {
        PreparedStatement st = null;
        try {
            st = con.prepareStatement("delete from medico where id_medico = ?");
            st.setInt(1, id);
            
            st.executeUpdate();
        } finally {
            if (st != null) {
                st.close();
            }
        }
    }

    private Medico rowToMedico(ResultSet rs) throws Exception, Exception {
        int idUsuario = rs.getInt("idUsuario");
        String[] usuario = usu.mostrarIdUsuario(idUsuario).get(0); // [id, username, senha, admin]
        String username = usuario[1];
        String senha = usuario[2];
        Boolean admin = Boolean.getBoolean(usuario[3]);
        
        int idMedico = rs.getInt("id_medico");
        String nome = rs.getString("nome");
        String especialidade = rs.getString("especialidade");
        String telefone = rs.getString("telefone");
        String email = rs.getString("email");

        return new Medico(idMedico, nome, especialidade, telefone, email, idUsuario, username, senha, admin);
    }

    private void close(PreparedStatement st, ResultSet rs) throws Exception {
        if (st != null) {
            st.close();
        }
        if (rs != null) {
            rs.close();
        }
    }
    
    public static void main(String[] args) throws Exception {
        Medico medico = new Medico(4, "DADADADA", "Psicologia", "521465215", "dadada@email", 4, "dada_user", "123", false);
        MedicoDAO dao = new MedicoDAO();
        dao.cadastrarMedico(medico);
        System.out.println(dao.mostrarTodosMedicos());
        
    }
}
