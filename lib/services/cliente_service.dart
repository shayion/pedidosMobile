import 'dart:convert';
import 'package:http/http.dart' as http;

class cliente_service {
  static const String baseUrl = 'http://localhost:8080/clientes';

  // Adicionar um novo cliente
  Future<void> addCliente(Map<String, dynamic> clienteData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(clienteData),
    );

    if (response.statusCode == 201) {
      print('Cliente criado com sucesso');
    } else {
      print('Erro ao criar cliente: ${response.statusCode}');
    }
  }

  // Obter todos os clientes
  Future<List<dynamic>> getClientes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar clientes');
    }
  }

  // Atualizar um cliente
  Future<void> updateCliente(int id, Map<String, dynamic> clienteData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(clienteData),
    );

    if (response.statusCode == 200) {
      print('Cliente atualizado com sucesso');
    } else {
      print('Erro ao atualizar cliente: ${response.statusCode}');
    }
  }

  // Deletar um cliente
  Future<void> deleteCliente(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      print('Cliente deletado com sucesso');
    } else {
      print('Erro ao deletar cliente: ${response.statusCode}');
    }
  }
}
