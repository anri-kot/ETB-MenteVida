package com.mentevida.nucleo;

import java.time.LocalDate;

public class Relatorio {
    private int idRelatorio;
    private LocalDate dataRelatorio;
    private String conteudo;
    private Consulta consulta;

    public Relatorio(int idRelatorio, LocalDate dataRelatorio, String conteudo, Consulta consulta) {
        this.idRelatorio = idRelatorio;
        this.dataRelatorio = dataRelatorio;
        this.conteudo = conteudo;
        this.consulta = consulta;
    }
    
    public String toString() {
        return "[idRelatorio=" + getIdRelatorio() +
                "dataRelatorio=" + getDataRelatorio() +
                "conteudo=" + getConteudo() +
                "consulta=" + getConsulta().getIdConsulta() +
                "]";
    }

    public int getIdRelatorio() {
        return idRelatorio;
    }

    public void setIdRelatorio(int idRelatorio) {
        this.idRelatorio = idRelatorio;
    }

    public LocalDate getDataRelatorio() {
        return dataRelatorio;
    }

    public void setDataRelatorio(LocalDate dataRelatorio) {
        this.dataRelatorio = dataRelatorio;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public Consulta getConsulta() {
        return consulta;
    }

    public void setConsulta(Consulta consulta) {
        this.consulta = consulta;
    }
}
