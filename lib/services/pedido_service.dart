import 'dart:convert';
import 'package:http/http.dart' as http;

class pedido_service {
  static const String baseUrl = 'http://localhost:8080/pedidos';

  // Adicionar um novo pedido
  Future<void> addPedido(Map<String, dynamic> pedidoData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(pedidoData),
    );

    if (response.statusCode == 201) {
      print('Pedido criado com sucesso');
    } else {
      print('Erro ao criar pedido: ${response.statusCode}');
    }
  }

  // Obter todos os pedidos
  Future<List<dynamic>> getPedidos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar pedidos');
    }
  }

  // Atualizar um pedido
  Future<void> updatePedido(int id, Map<String, dynamic> pedidoData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(pedidoData),
    );

    if (response.statusCode == 200) {
      print('Pedido atualizado com sucesso');
    } else {
      print('Erro ao atualizar pedido: ${response.statusCode}');
    }
  }
}
