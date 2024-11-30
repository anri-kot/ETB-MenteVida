/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mentevida.Servlets;

import com.mentevida.dao.ConnectionManager;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet(name = "PdfServlet", urlPatterns = {"/pdf"})
public class PdfServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String PDF_DIRECTORY = "/home/kuroneko/Dev/Uploads";
        
        // Get the PDF file path from the request
        String filePath = request.getParameter("file");
        if (filePath == null || filePath.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File path is required");
            return;
        }

        // Construct the full path to the PDF file, including inner directories
        Path pdfPath = Paths.get(PDF_DIRECTORY, filePath);
        if (!Files.exists(pdfPath) || !Files.isRegularFile(pdfPath)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        // Set the response content type to PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"" + pdfPath.getFileName() + "\"");

        // Write the PDF to the response output stream
        try (InputStream in = Files.newInputStream(pdfPath);
             OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }

}
