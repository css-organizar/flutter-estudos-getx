import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_unitarios/presentation/home/home_controller.dart';

class HomeTesteFlutter extends StatefulWidget {
  const HomeTesteFlutter({Key? key}) : super(key: key);

  @override
  State<HomeTesteFlutter> createState() => _HomeTesteFlutterState();
}

class _HomeTesteFlutterState extends State<HomeTesteFlutter> {
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo GetX'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Obx(
          () {
            return controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.listaPessoas.length,
                    itemBuilder: (context, i) {
                      return ListTileInkWell(
                        id: controller.listaPessoas[i].id,
                        nome: '${controller.listaPessoas[i].name} (${controller.listaPessoas[i].id})',
                        age: controller.listaPessoas[i].age,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

class ListTileInkWell extends StatelessWidget {
  final String id;
  final String nome;
  final int age;

  const ListTileInkWell({
    Key? key,
    required this.id,
    required this.nome,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return InkWell(
      onTap: () {
        controller.setSelectedPerson(int.parse(id));
      },
      child: ListTile(
        selected: (controller.selectedPerson == int.parse(id)),
        title: Text(nome),
        subtitle: Text('Idade: ${age.toString()}'),
      ),
    );
  }
}
