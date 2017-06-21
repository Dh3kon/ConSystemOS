package com.consystem.model;

import java.util.Calendar;

public class OrdemServico {

	private int os;
	private Calendar dataOs;
	private String descricao;
	private String status;
	private Calendar dataFinalizacao;
	private String observacao;
	private int idTecnico;
	private int idVeiculo;
	private int idCliente;

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

	public int getIdTecnico() {
		return idTecnico;
	}

	public void setIdTecnico(int idTecnico) {
		this.idTecnico = idTecnico;
	}

	public int getIdVeiculo() {
		return idVeiculo;
	}

	public void setIdVeiculo(int idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

}
