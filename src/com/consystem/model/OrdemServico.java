package com.consystem.model;

import java.util.Calendar;

public class OrdemServico {

	private int os;
	private Calendar dataOs;
	private String descricao;
	private String status;
	private Calendar dataFinalizacao;
	private String observacao;
	private String tecnico;
	private String veiculo;
	private String cliente;

	public int getOs() {
		return os;
	}

	public void setOs(int os) {
		this.os = os;
	}

	public Calendar getDataOs() {
		return dataOs;
	}

	public void setDataOs(Calendar dataOs) {
		this.dataOs = dataOs;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Calendar getDataFinalizacao() {
		return dataFinalizacao;
	}

	public void setDataFinalizacao(Calendar dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getTecnico() {
		return tecnico;
	}

	public void setTecnico(String tecnico) {
		this.tecnico = tecnico;
	}

	public String getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(String veiculo) {
		this.veiculo = veiculo;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

}
