import 'dart:convert'; // Para manipular BigDecimal como String
import 'cliente_model.dart'; // Importa o Cliente para o relacionamento

class PedidoModel {
  final int? id; // Pode ser nulo ao criar um novo pedido
  final String descricao;
  final double valor; // Representa o BigDecimal como um double
  final String status;
  final ClienteModel? cliente; // Relacionamento com o cliente

  PedidoModel({
    this.id,
    required this.descricao,
    required this.valor,
    required this.status,
    this.cliente,
  });

  // Método para converter um JSON em um objeto Pedido
  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    return PedidoModel(
      id: json['id'],
      descricao: json['descricao'],
      valor: json['valor'].toDouble(), // Converte para double, caso venha como numérico
      status: json['status'],
      cliente: json['cliente'] != null ? ClienteModel.fromJson(json['cliente']) : null,
    );
  }

  // Método para converter um objeto Pedido em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'valor': valor,
      'status': status,
      'cliente': cliente?.toJson(), // Converte o cliente para JSON, se existir
    };
  }
}
