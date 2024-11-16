package com.mentevida.Servlets;

import com.mentevida.dao.ConnectionManager;
import com.mentevida.dao.RelatorioDAO;
import com.mentevida.nucleo.Consulta;
import com.mentevida.nucleo.Relatorio;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "CadastrarRelatorios", urlPatterns = {"/CadastrarRelatorios"})
@MultipartConfig (
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 100
)
public class CadastrarRelatorios extends HttpServlet {
    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        LocalDate dataRelatorio = LocalDate.parse(request.getParameter("data"), dtf);
        Consulta consulta = new Consulta();
        consulta.setIdConsulta(Integer.parseInt(request.getParameter("consulta")));
        
        try {
            RelatorioDAO dao = new RelatorioDAO();
            Relatorio oRelatorio = new Relatorio(0, dataRelatorio, "", consulta);
            
            dao.cadastrarRelatorio(oRelatorio);
            
            oRelatorio.setIdRelatorio(dao.mostrarTodasRelatorios().getLast().getIdRelatorio());
            
            Part filePart = request.getPart("arquivo");
            String diretorio = "/Relatorios/relatorio" + oRelatorio.getIdRelatorio() + "consulta" + consulta.getIdConsulta() + ".pdf";
            String diretorioReal = ConnectionManager.getUploads() + diretorio;
            for (Part part : request.getParts()) {
                part.write(diretorioReal);
            }
            
            oRelatorio.setEndereco(diretorio);
            dao.alterarRelatorio(oRelatorio);
            
            PrintWriter out = response.getWriter();
            out.println("<head><meta charset=\"utf-8\"><head>");
            out.println("<script>");
            out.println("alert('Paciente cadastrado com sucesso!')");
            out.println("location='paciente.jsp'");
            out.println("</script>");
        } catch (Exception e) {
            response.getWriter().print("Erro: " + e);
        }
    }
    
}
