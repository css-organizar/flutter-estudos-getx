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
            return controller.personStore.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.personStore.listaPessoas.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          controller.setSelectedPerson(int.parse(controller.personStore.listaPessoas[i].id));
                        },
                        child: Obx(
                          () => ListTile(
                            selected:
                                (controller.selectedPerson == int.parse(controller.personStore.listaPessoas[i].id)),
                            title: Text(
                                '${controller.personStore.listaPessoas[i].name} (${controller.personStore.listaPessoas[i].id})'),
                            subtitle: Text('Idade: ${controller.personStore.listaPessoas[i].age.toString()}'),
                          ),
                        ),
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
      child: Obx(
        () => ListTile(
          selected: (controller.selectedPerson == int.parse(id)),
          title: Text(nome),
          subtitle: Text('Idade: ${age.toString()}'),
        ),
      ),
    );
  }
}
