import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:teste_unitarios/application/application_bidings.dart';
import 'package:teste_unitarios/presentation/home/home_biding.dart';
import 'package:teste_unitarios/presentation/home/home_widget.dart';

class ApplicationWidget extends StatefulWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  _ApplicationWidgetState createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/home',
          binding: HomeBiding(),
          page: () => HomeTesteFlutter(),
        ),
      ],
      initialRoute: '/home',
      initialBinding: ApplicationBinding(),
    );
  }
}
