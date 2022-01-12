import 'package:get/get.dart';
import 'package:teste_unitarios/infrastructure/stores/person_store.dart';

class HomeController extends GetxController {
  PersonStore personStore = PersonStore();
  final _selectedPerson = 0.obs;

  get selectedPerson => _selectedPerson.value;
  set selectedPerson(value) {
    _selectedPerson.value = value;
  }

  void setSelectedPerson(value) {
    selectedPerson = value;
  }

  @override
  void onInit() async {
    personStore.listarPessoas();
    super.onInit();
  }
}
