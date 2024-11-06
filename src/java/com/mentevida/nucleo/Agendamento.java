package com.mentevida.nucleo;

import java.time.LocalDate;

public class Agendamento {
    private int idAgendamento;
    private LocalDate dataAgendamento;
    private boolean status;
    private Funcionario funcionario;
    private Medico medico;
    private Paciente paciente;

    public Agendamento(int idAgendamento, LocalDate dataAgendamento, boolean status, Funcionario funcionario, Medico medico, Paciente paciente) {
        this.idAgendamento = idAgendamento;
        this.dataAgendamento = dataAgendamento;
        this.status = status;
        this.funcionario = funcionario;
        this.medico = medico;
        this.paciente = paciente;
    }
    
    public String toString() {
        return "[idAgendamento=" + getIdAgendamento() +
                "dataAgendamento=" + getDataAgendamento() +
                "status=" + isStatus() +
                "funcionario=" + getFuncionario().getIdUsuario() +
                "medico=" + getMedico().getIdUsuario() +
                "paciente=" + getPaciente().getIdPaciente() +
                "]";
    }

    public int getIdAgendamento() {
        return idAgendamento;
    }

    public void setIdAgendamento(int idAgendamento) {
        this.idAgendamento = idAgendamento;
    }

    public LocalDate getDataAgendamento() {
        return dataAgendamento;
    }

    public void setDataAgendamento(LocalDate dataAgendamento) {
        this.dataAgendamento = dataAgendamento;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
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
