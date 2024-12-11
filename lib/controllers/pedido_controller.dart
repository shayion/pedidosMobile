import 'dart:convert';
import 'package:http/http.dart' as http;

class pedido_controller {
  final String baseUrl = 'http://localhost:8080/pedidos';

  // Método para criar um pedido
  Future<bool> createOrder(String descricao, double valor, String status, int clienteId) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'descricao': descricao,
        'valor': valor,
        'status': status,
        'clienteId': clienteId,
      }),
    );

    return response.statusCode == 201; // Retorna true se a criação for bem-sucedida
  }

  // Método para listar todos os pedidos
  Future<List<dynamic>> getOrders() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retorna a lista de pedidos
    } else {
      throw Exception('Falha ao carregar pedidos');
    }
  }

  // Método para obter um pedido específico
  Future<dynamic> getOrder(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retorna o pedido
    } else {
      throw Exception('Falha ao carregar pedido');
    }
  }

  // Método para atualizar um pedido
  Future<bool> updateOrder(int id, String descricao, double valor, String status, int clienteId) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'descricao': descricao,
        'valor': valor,
        'status': status,
        'cliente': {
          'id': clienteId
        }
      }),
    );

    return response.statusCode == 200; // Retorna true se a atualização for bem-sucedida
  }

  // Método para excluir um pedido
  Future<bool> deleteOrder(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    return response.statusCode == 200; // Retorna true se a exclusão for bem-sucedida
  }
}
