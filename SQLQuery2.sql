
CREATE TABLE Usuarios (
  id_usuario INT IDENTITY (1,1) PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,  
);

CREATE TABLE Pessoas (
  idPessoa INT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(255),
  celular VARCHAR(255) NOT NULL,
  end_logradouro VARCHAR(255) NOT NULL,
  end_numero VARCHAR(255) NOT NULL,
  end_cep VARCHAR(255) NOT NULL,
  end_cidade VARCHAR(255) NOT NULL,
  end_UF VARCHAR(255) NOT NULL,
  end_bairro VARCHAR(255) NOT NULL,
);


CREATE TABLE PessoaFisicas (
  idPessoaFisica INT PRIMARY KEY,
  cpf VARCHAR(11) NOT NULL,
  idPessoa INT FOREIGN KEY REFERENCES Pessoas(idPessoa)
);


CREATE TABLE PessoaJuridica (
  idPessoaJuridica INT PRIMARY KEY,
  cnpj VARCHAR(14) NOT NULL,
  idPessoa INT FOREIGN KEY REFERENCES Pessoas(idPessoa)
);

CREATE TABLE Produto (
  idProduto INT PRIMARY KEY,
  nome VARCHAR(255)NOT NULL,
  precoVenda NUMERIC(20, 2) NOT NULL,
  quantidade INT NOT NULL,  
);



CREATE TABLE Movimento_Compra(
  idMovimentoCompra INT PRIMARY KEY,
  precoProduto NUMERIC(20, 2) NOT NULL,
  quantidade INT NOT NULL,
  idPessoaJuridica INT FOREIGN KEY REFERENCES PessoaJuridica(idPessoaJuridica),
  idProduto INT FOREIGN KEY REFERENCES Produto(idProduto),
);

CREATE TABLE Movimento_Venda(
  idMovimentoVenda INT PRIMARY KEY,
  quantidade INT NOT NULL,
  idPessoaFisica INT FOREIGN KEY REFERENCES PessoaFisica(idPessoaFisica),
  idProduto INT FOREIGN KEY REFERENCES Produto(idProduto),
  
);
