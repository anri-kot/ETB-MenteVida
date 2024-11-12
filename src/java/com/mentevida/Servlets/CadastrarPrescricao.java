package com.mentevida.Servlets;

import com.mentevida.dao.PrescricaoDAO;
import com.mentevida.nucleo.Consulta;
import com.mentevida.nucleo.Prescricao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "CadastrarPrescricao", urlPatterns = {"/CadastrarPrescricao"})
public class CadastrarPrescricao extends HttpServlet {
    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate dataPrescricao = LocalDate.parse(request.getParameter("data_prescricao"), dtf);
        String medicamentos = request.getParameter("medicamentos");
        String dosagem = request.getParameter("dosagem");
        String comentario = request.getParameter("comentario");
        int idConsulta = Integer.parseInt(request.getParameter("consulta"));
        
        PrintWriter out = response.getWriter();
        
        try {
            PrescricaoDAO dao = new PrescricaoDAO();
            Consulta consulta = new Consulta();
            consulta.setIdConsulta(idConsulta);
            Prescricao aPrescricao = new Prescricao(0, dataPrescricao, medicamentos, dosagem, comentario, consulta);
            
            dao.cadastrarPrescricao(aPrescricao);
            out.println("<head><meta charset=\"utf-8\"><head>");
            out.println("<script>");
            out.println("alert('Prescrição cadastrada com sucesso!')");
            out.println("location='prescricao.jsp'");
            out.println("</script>");
        } catch (Exception e) {
            out.print(e);
        }
    }
}
