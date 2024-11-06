package com.mentevida;

import com.mentevida.dao.AgendamentoDAO;
import com.mentevida.nucleo.Agendamento;
import com.mentevida.nucleo.Funcionario;
import com.mentevida.nucleo.Medico;
import com.mentevida.nucleo.Paciente;
import java.time.LocalDate;

public class Testa {
    
    public static void main(String[] args) throws Exception {
        AgendamentoDAO dao = new AgendamentoDAO();
        LocalDate data = LocalDate.parse("2020-01-02");
        
        Funcionario f = new Funcionario();
        f.setIdFuncionario(2);
        Medico m = new Medico();
        m.setIdMedico(2);
        Paciente p = new Paciente();
        p.setIdPaciente(6);
        
        Agendamento oAgendamento = new Agendamento(1, data, true, f, m, p);
        dao.deletarAgendamento(1);
        System.out.println(dao.mostrarTodosAgendamentos());
    }

}
