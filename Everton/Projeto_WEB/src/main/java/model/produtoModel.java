package model;

import java.util.ArrayList;

import multitools.Produto;

public class produtoModel {
	
	private int idProduto;
	private String descricao;
	private int quantidade;
	private double preco;
	private boolean onLine;
	
	
	public produtoModel() {
	}


	public produtoModel(int idProduto, String descricao, int quantidade, double preco, boolean onLine) {
		this.idProduto = idProduto;
		this.descricao = descricao;
		this.quantidade = quantidade;
		this.preco = preco;
		this.onLine = onLine;
	}


	public produtoModel(String descricao, int quantidade, double preco, boolean onLine) {
		this.descricao = descricao;
		this.quantidade = quantidade;
		this.preco = preco;
		this.onLine = onLine;
	}


	public int getIdProduto() {
		return idProduto;
	}


	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public int getQuantidade() {
		return quantidade;
	}


	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}


	public double getPreco() {
		return preco;
	}


	public void setPreco(double preco) {
		this.preco = preco;
	}


	public boolean isOnLine() {
		return onLine;
	}


	public void setOnLine(boolean onLine) {
		this.onLine = onLine;
	}

	
	public void salvar () {
		new Produto().cadastrarProduto(this);
	}
	
	public void excluir(int idProduto) {
		new Produto().ExcluirProduto(idProduto);
	}

	public void alterar() {
		new Produto().AlterarProduto(this);
	}
	
	public produtoModel buscarProdutoPorId(int idProduto) {
		return new Produto().BuscarProdutoPorId(idProduto);
	}
	
	public ArrayList<produtoModel> buscarProdutosPorDescricao(String descricao){
		return new Produto().BuscarProdutosPorDescricao(descricao);
	}
	
}
