package com.mentevida.nucleo;

import java.time.LocalDate;

public class Consulta {
    private int idConsulta;
    private LocalDate dataConsulta;
    private Medico medico;
    private Paciente paciente;

    public Consulta(int idConsulta, LocalDate dataConsulta, Medico medico, Paciente paciente) {
        this.idConsulta = idConsulta;
        this.dataConsulta = dataConsulta;
        this.medico = medico;
        this.paciente = paciente;
    }
    
    public String toString() {
        return "[idConsulta=" + getIdConsulta() +
                "dataConsulta=" + getDataConsulta() +
                "medico=" + getMedico().getIdUsuario() +
                "paciente=" + getPaciente().getIdPaciente() +
                "]";
    }

    public int getIdConsulta() {
        return idConsulta;
    }

    public void setIdConsulta(int idConsulta) {
        this.idConsulta = idConsulta;
    }

    public LocalDate getDataConsulta() {
        return dataConsulta;
    }

    public void setDataConsulta(LocalDate dataConsulta) {
        this.dataConsulta = dataConsulta;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
}
