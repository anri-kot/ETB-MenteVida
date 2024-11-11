package com.mentevida.Servlets;

import com.mentevida.dao.AgendamentoDAO;
import com.mentevida.nucleo.Agendamento;
import com.mentevida.nucleo.Funcionario;
import com.mentevida.nucleo.Medico;
import com.mentevida.nucleo.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "CadastrarAgendamento", urlPatterns = {"/CadastrarAgendamento"})
public class CadastrarAgendamento extends HttpServlet {
    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        LocalDateTime data_agendamento = LocalDateTime.parse(request.getParameter("data_agendamento"), dtf);
        Boolean status = Boolean.parseBoolean(request.getParameter("status"));
        int idPaciente = Integer.parseInt(request.getParameter("paciente"));
        int idMedico = Integer.parseInt(request.getParameter("medico"));
        int idFuncionario = Integer.parseInt(request.getParameter("funcionario"));
        
        PrintWriter out = response.getWriter();
        
        try {
            AgendamentoDAO dao = new AgendamentoDAO();
            
            Paciente p = new Paciente();
            p.setIdPaciente(idPaciente);
            Medico m = new Medico();
            m.setIdMedico(idMedico);
            Funcionario f = new Funcionario();
            f.setIdFuncionario(idFuncionario);
            Agendamento oAgendamento = new Agendamento(0, data_agendamento, status, f, m, p);
            
            dao.cadastrarAgendamento(oAgendamento);
            out.println("<script>");
            out.println("alert('Agendamento cadastrado com sucesso!')");
            out.println("location='agendamento.jsp'");
            out.println("</script>");
        } catch (Exception e) {
            out.print(e);
        }
    }

}
