import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'RepositoryListPage.dart';
import 'data/api_service.dart';

void main() {
  runApp(MyApp());
  _setLogging();
}

void _setLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) =>
      print("${record.level.name}: ${record.time}: ${record.message}"));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => ApiService.create(),
      dispose: (_, ApiService service) => service.client.dispose(),
      child: MaterialApp(
        title: "Chopper Example",
        debugShowCheckedModeBanner: false,
        home: RepositoryListPage(),
      ),
    );
  }
}
