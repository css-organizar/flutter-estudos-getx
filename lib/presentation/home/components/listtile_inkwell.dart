import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

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
