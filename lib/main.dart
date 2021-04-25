import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: _getCurrentAppSize(context).height - 56,
          child: GridView.count(
            crossAxisCount: 8,
            children: [
              ...List.generate(
                64,
                (index) => PlayButtonWidget(
                  playButton: PlayButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Size _getCurrentAppSize(context) => MediaQuery.of(context).size;
