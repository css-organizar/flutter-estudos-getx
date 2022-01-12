import 'dart:convert';
import 'package:http/http.dart';
import 'package:teste_unitarios/application/application_settings/application_settings.dart';

import '../../domain/entities/person_entity.dart';

class PersonRepository {
  final Client client;

  PersonRepository(this.client);

  Future<List<PersonEntity>> getListOfPerson() async {
    Response response = await client.get(Uri.parse('${ApplicationSettings.apiUrl}/person'));

    try {
      if (response.statusCode == 200) {
        var resultString = response.body;
        var resultJson = jsonDecode(resultString) as List;
        return resultJson.map((e) => PersonEntity.fromMap(e)).toList();
      } else {
        throw Exception('Erro (404)');
      }
    } catch (e) {
      throw Exception('Erro: ${e.toString()}');
    }
  }

  Future<PersonEntity> getPerson(String id) async {
    Response response = await client.get(Uri.parse('${ApplicationSettings.apiUrl}/person/$id'));
    var personResult = PersonEntity.fromJson(response.body);
    return personResult;
  }
}
