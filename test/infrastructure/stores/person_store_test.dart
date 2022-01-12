@Skip('Teste de API real')

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:teste_unitarios/domain/entities/person_entity.dart';
import 'package:teste_unitarios/infrastructure/repositories/person_repository.dart';

void main() {
  group(
    'PersonStore',
    () {
      test(
        'getListOfPerson',
        () async {
          Client client = Client();

          List<PersonEntity> listOfPerson = await PersonRepository(client).getListOfPerson();

          expect(listOfPerson, isNotEmpty);
          expect(listOfPerson.length, equals(50));
        },
        timeout: Timeout(
          Duration(seconds: 60),
        ),
      );
      test(
        'getPerson',
        () async {
          Client client = Client();

          PersonEntity person = await PersonRepository(client).getPerson('1');

          expect(person.id, equals('1'));
          expect(person.name, equals('Sheila Schuppe'));
        },
        timeout: Timeout(
          Duration(seconds: 60),
        ),
      );
    },
  );
}
