import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [
    SquareStateful(text: "hello", key: UniqueKey(),),
    SquareStateful(text: "world", key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Column(
                children: widgets,
              ),
              FlatButton(
                child: Text("SWAP"),
                onPressed: (){
                  setState(() {
                    widgets.insert(0, widgets.removeLast());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SquareStateless extends StatelessWidget {
  final String text;
  final Color color;

  SquareStateless({
    @required this.text,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      color: color,
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}

/////////////////
class SquareStateful extends StatefulWidget {
  final String text;
  final Key key;
  SquareStateful({
    @required this.text,
    @required this.key,
  }):super(key:key);

  @override
  _SquareStatefulState createState() => _SquareStatefulState();
}

class _SquareStatefulState extends State<SquareStateful> {
  Color color = RandomColor().randomColor();
  String test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(SquareStateful oldWidget) {
    super.didUpdateWidget(oldWidget);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SquareStateless(text: widget.text, color: color),
      onTap: (){
        color = RandomColor().randomColor();
        setState(() {});
      },
    );
  }
}
