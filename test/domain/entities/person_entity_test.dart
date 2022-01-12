import 'package:flutter_test/flutter_test.dart';
import 'package:teste_unitarios/domain/entities/person_entity.dart';

void main() async {
  test(
    'PersonEntity',
    () {
      PersonEntity person =
          PersonEntity.fromJson('{"name":"Claudney Sarti Sessa","age":37,"height":1.81,"weight":140.0,"id":"1"}');

      expect(person, isNotNull);
      expect(person.id, equals('1'));
      expect(person.name, equals('Claudney Sarti Sessa'));
      expect(person.isOlder, equals(true));
      expect(person.toJson(), isA<String>());
      expect(person.toMap(), isA<Map>());
    },
  );
}
