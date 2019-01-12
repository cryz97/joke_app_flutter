import 'package:flutter/material.dart';
import 'package:joke_app_orientation/model/joke.dart';
import 'package:joke_app_orientation/ui/joke_details.dart';
import 'package:joke_app_orientation/ui/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {

  static const int tabletBreakpoint = 600;
  Joke _selectedJode;

  Widget _buildMobileLayout() {
    return JokeListing(jokeSelectedCallback: (jokeSelected) {
        Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context){
                return JokeDetails(isInTabletLayout: false, joke: jokeSelected,);
              }));
    },
    );
  }
  Widget _buildTabletLayou() {
    return Row(
      children: <Widget>[
        Flexible (
          flex: 1,
          child: Material(
            elevation: 13,
            child: JokeListing(
                jokeSelectedCallback: (joke) {
                  setState(() {
                    _selectedJode = joke;
                  });
                }, jokeSelected: _selectedJode,),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(isInTabletLayout: true, joke: _selectedJode),
        )
      ],
    );

  }


  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait && shortestSide < tabletBreakpoint) {
      content = _buildMobileLayout();

    }else {
      content = _buildTabletLayou();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
