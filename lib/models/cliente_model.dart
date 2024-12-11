class ClienteModel {
  final int? id; // Pode ser nulo ao criar um novo cliente
  final String cpf;
  final String nome;
  final String? telefone; // Pode ser nulo
  final String? endereco; // Pode ser nulo
  final List<Pedido>? pedidos; // Lista de pedidos associados ao cliente (opcional)

  ClienteModel({
    this.id,
    required this.cpf,
    required this.nome,
    this.telefone,
    this.endereco,
    this.pedidos,
  });

  // Método para converter um JSON em um objeto Cliente
  factory ClienteModel.fromJson(Map<String, dynamic> json) {
    return ClienteModel(
      id: json['id'],
      cpf: json['cpf'],
      nome: json['nome'],
      telefone: json['telefone'],
      endereco: json['endereco'],
      pedidos: json['pedidos'] != null
          ? List<Pedido>.from(json['pedidos'].map((pedido) => Pedido.fromJson(pedido)))
          : null,
    );
  }

  // Método para converter um objeto Cliente em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cpf': cpf,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco,
      'pedidos': pedidos?.map((pedido) => pedido.toJson()).toList(),
    };
  }
}

// Classe Pedido (usada no relacionamento do Cliente com pedidos)
class Pedido {
  final int? id; // Pode ser nulo ao criar um novo pedido
  final String descricao;
  final double valor;
  final String status;

  Pedido({
    this.id,
    required this.descricao,
    required this.valor,
    required this.status,
  });

  // Método para converter um JSON em um objeto Pedido
  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      descricao: json['descricao'],
      valor: json['valor'],
      status: json['status'],
    );
  }

  // Método para converter um objeto Pedido em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'valor': valor,
      'status': status,
    };
  }
}
