import 'dart:convert';
import 'package:http/http.dart' as http;

class cliente_controller {
  final String baseUrl = 'http://localhost:8080/clientes';

  // Método para criar um cliente
  Future<bool> createClient(String nome, String cpf, String telefone, String endereco) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'nome': nome,
        'cpf': cpf,
        'telefone': telefone,
        'endereco': endereco,
      }),
    );

    return response.statusCode == 201; // Retorna true se a criação for bem-sucedida
  }

  // Método para listar todos os clientes
  Future<List<dynamic>> getClients() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retorna a lista de clientes
    } else {
      throw Exception('Falha ao carregar clientes');
    }
  }

  // Método para atualizar um cliente
  Future<bool> updateClient(int id, String nome, String cpf, String telefone, String endereco) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'nome': nome,
        'cpf': cpf,
        'telefone': telefone,
        'endereco': endereco,
      }),
    );

    return response.statusCode == 200; // Retorna true se a atualização for bem-sucedida
  }

  // Método para excluir um cliente
  Future<bool> deleteClient(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    return response.statusCode == 200; // Retorna true se a exclusão for bem-sucedida
  }
}
