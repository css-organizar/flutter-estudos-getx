import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:teste_unitarios/domain/entities/person.dart';
import 'package:teste_unitarios/infrastructure/repositories/person_repository.dart';

class PersonStore extends GetxController {
  final _isLoading = false.obs;

  final RxList<Person> _listaPessoas = RxList<Person>();

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  List<Person> get listaPessoas => _listaPessoas;

  listarPessoas() async {
    isLoading = true;
    try {
      var lista = await PersonRepository(Client()).getPerson();
      _listaPessoas.clear();
      // await Future.delayed(Duration(seconds: 10));
      _listaPessoas.addAll(lista);
    } finally {
      isLoading = false;
    }
  }
}
