import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:teste_unitarios/domain/entities/person_entity.dart';
import 'package:teste_unitarios/infrastructure/repositories/person_repository.dart';

class PersonStore extends GetxController {
  final _isLoading = false.obs;

  final RxList<PersonEntity> _listaPessoas = RxList<PersonEntity>();

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  List<PersonEntity> get listaPessoas => _listaPessoas;

  listarPessoas() async {
    isLoading = true;
    try {
      var lista = await PersonRepository(Client()).getListOfPerson();
      _listaPessoas.clear();
      // await Future.delayed(Duration(seconds: 10));
      _listaPessoas.addAll(lista);
    } finally {
      isLoading = false;
    }
  }

  PersonEntity buscarPessoa() {
    return PersonEntity('1', 'name', 0, 0, 0);
  }
}
