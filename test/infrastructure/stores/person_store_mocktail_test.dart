import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:teste_unitarios/application/application_settings/application_settings.dart';
import 'package:teste_unitarios/domain/entities/person_entity.dart';
import 'package:teste_unitarios/infrastructure/repositories/person_repository.dart';

import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group(
    'PersonStore With mocktail',
    () {
      test(
        'getListOfPerson',
        () async {
          MockClient client = MockClient();

          when(
            () {
              return client.get(
                Uri.parse('${ApplicationSettings.apiUrl}/person'),
              );
            },
          ).thenAnswer(
            (invocation) async {
              return http.Response(
                  '[{"name":"Claudney Sarti Sessa","age":37,"height":1.81,"weight":140.0,"id":"1"}]', 200);
            },
          );

          List<PersonEntity> listOfPerson = await PersonRepository(client).getListOfPerson();

          verify(
            () {
              return client.get(
                Uri.parse('${ApplicationSettings.apiUrl}/person'),
              );
            },
          );

          expect(listOfPerson, isNotEmpty);
          expect(listOfPerson.length, equals(1));
        },
        timeout: Timeout(
          Duration(seconds: 60),
        ),
      );
      test(
        'getPerson',
        () async {
          MockClient client = MockClient();

          when(
            () {
              return client.get(
                Uri.parse('${ApplicationSettings.apiUrl}/person/1'),
              );
            },
          ).thenAnswer(
            (invocation) async {
              return http.Response(
                  '{"name":"Claudney Sarti Sessa","age":37,"height":1.81,"weight":140.0,"id":"1"}', 200);
            },
          );

          PersonEntity person = await PersonRepository(client).getPerson('1');

          expect(person.id, equals('1'));
          expect(person.name, equals('Claudney Sarti Sessa'));
        },
        timeout: Timeout(
          Duration(seconds: 60),
        ),
      );
    },
  );
}
