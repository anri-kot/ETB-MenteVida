package com.mentevida.Servlets;

import com.mentevida.dao.PacienteDAO;
import com.mentevida.nucleo.Paciente;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet(name = "CadastrarPaciente", urlPatterns = {"/CadastrarPaciente"})
@MultipartConfig (
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 100
)
public class CadastrarPaciente extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String data_nascimento = request.getParameter("data_nascimento");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        
        Paciente paciente = new Paciente(0, nome, LocalDate.parse(data_nascimento), telefone, email, "");
        try {
            // adicionar campos do paciente
            PacienteDAO dao = new PacienteDAO();
            dao.addPaciente(paciente);
            
            // upload do arquivo
            paciente = dao.selectAllPacientes().getLast();
            String caminhoDir = "/home/kuroneko/Dev/Uploads/Pacientes/" + "historico" + paciente.getIdPaciente();
            
            Part filePart = request.getPart("historico_medico");
            String fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
                part.write(caminhoDir);
            }
            
            // atualizar paciente com endereço do upload
            paciente.setHistoricoMedico(caminhoDir);
            dao.updatePaciente(paciente);
            
            PrintWriter pw = response.getWriter();
            pw.println("<head><meta charset=\"utf-8\"><head>");
            pw.println("<script>");
            pw.println("alert('Paciente cadastrado com sucesso!')");
            pw.println("location='paciente.jsp'");
            pw.println("</script>");
        } catch (Exception e) {
            response.getWriter().print("Erro: " + e);
        }
    }
}
