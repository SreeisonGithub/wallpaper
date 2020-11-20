import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:photo_api/src/widgets/image_list.dart';
import './src/model/image_Model.dart';
import 'dart:convert';
import './src/widgets/image_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    _counter++;
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$_counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));

   setState(() {
   
    images.add(imageModel);     
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
