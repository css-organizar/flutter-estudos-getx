import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_unitarios/presentation/home/home_controller.dart';

import 'components/listtile_inkwell.dart';

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
                      return ListTileInkWell(
                        id: controller.personStore.listaPessoas[i].id,
                        nome:
                            '${controller.personStore.listaPessoas[i].name} (${controller.personStore.listaPessoas[i].id})',
                        age: controller.personStore.listaPessoas[i].age,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
