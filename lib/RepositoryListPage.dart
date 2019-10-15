import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chopper_example/utils/HexColor.dart';
import 'package:provider/provider.dart';

import 'data/api_service.dart';
import 'utils/Padding.dart';

class RepositoryListPage extends StatefulWidget {
  @override
  _RepositoryListPageState createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositories"),
      ),
      body: Container(
        child: FutureBuilder<Response>(
          future: Provider.of<ApiService>(context).getRepos(),
          builder: (context, snapshot) => _getView(context, snapshot),
        ),
      ),
    );
  }

  Widget _getView(BuildContext context, AsyncSnapshot<Response> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: horizontal(32.0),
                child: Text(
                  "Unable to load data. Please try again!",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                onPressed: () => setState(() {}),
                color: Colors.orange,
                child: Text("Retry"),
              )
            ],
          ),
        );
      }
      var list = json.decode(snapshot.data.bodyString);
      return ListView.builder(
          itemBuilder: (context, position) => Container(
                color: HexColor("#FF4433"),
                margin: box(8.0),
                height: 56.0,
              ),
          itemCount: 20);
    } else {
      return Container(
        child: SizedBox.expand(
          child: Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }
  }
}
