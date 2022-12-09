package multitools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DBConnection;
import model.produtoModel;

public class Produto {

	public void cadastrarProduto(produtoModel produto) {

		String sql = "INSERT INTO PRODUTO VALUES (null,?,?,?,?)";
		PreparedStatement pStatement = null;
		Connection conn = null;

		try {
			conn = new DBConnection().getConnection();
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, produto.getDescricao());
			pStatement.setInt(2, produto.getQuantidade());
			pStatement.setDouble(3, produto.getPreco());
			pStatement.setBoolean(4, produto.isOnLine());
			pStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pStatement != null)
					pStatement.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public produtoModel BuscarProdutoPorId(int id) {
		String sql = "SELECT * FROM PRODUTO WHERE idProduto = ?";
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pStatement = null;
		produtoModel produto = null;
		try {
			conn = new DBConnection().getConnection();
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, id);
			rs = pStatement.executeQuery();
			if (rs != null && rs.next()) {
				produto = new produtoModel();
				produto.setIdProduto(rs.getInt("idProduto"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setQuantidade(rs.getInt("quantidade"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setOnLine(rs.getBoolean("onLine"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pStatement != null) {
					pStatement.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return produto;
	}
	
	public ArrayList<produtoModel> BuscarProdutosPorDescricao(String descricao) {
		String sql = "SELECT * FROM PRODUTO WHERE descricao LIKE '%" + descricao + "%'";
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pStatement = null;
		produtoModel produto = null;
		ArrayList<produtoModel> produtos = null;
		try {
			conn = new DBConnection().getConnection();
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			if (rs != null) {

				produtos = new ArrayList<produtoModel>();

				while (rs.next()) {
					produto = new produtoModel();
					produto.setIdProduto(rs.getInt("idProduto"));
					produto.setDescricao(rs.getString("descricao"));
					produto.setQuantidade(rs.getInt("quantidade"));
					produto.setPreco(rs.getDouble("preco"));
					produto.setOnLine(rs.getBoolean("OnLine"));
					produtos.add(produto);

				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (pStatement != null)
					pStatement.close();
			} catch (Exception ex1) {
				ex1.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception ex1) {
				ex1.printStackTrace();
			}
		}

		return produtos;
	}
	
	public void ExcluirProduto(int idProduto) {
		String sql = "DELETE FROM PRODUTO WHERE idProduto = ?";
		PreparedStatement pStatement = null;
		Connection conn = null;
		try {
			conn = new DBConnection().getConnection();
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, idProduto);
			pStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pStatement != null)
					pStatement.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public void AlterarProduto(produtoModel produto) {
		String sql = "UPDATE PRODUTO SET descricao = ?, quantidade = ?, preco = ?, onLine = ? WHERE idProduto = ?";
		PreparedStatement pStatement = null;
		Connection conn = null;
		try {
			conn = new DBConnection().getConnection();
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, produto.getDescricao());
			pStatement.setInt(2, produto.getQuantidade());
			pStatement.setDouble(3, produto.getPreco());
			pStatement.setBoolean(4, produto.isOnLine());
			pStatement.setInt(5, produto.getIdProduto());
			pStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pStatement != null)
					pStatement.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
