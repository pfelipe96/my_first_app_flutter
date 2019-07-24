import 'package:flutter/material.dart';













class SuggestionSaved extends StatelessWidget{
  const SuggestionSaved({Key key, this.divided});
  final List<Widget> divided;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children:  divided),
    );
  }
}

//class SaveSuggestion() extends StatefulWidget{
//  const SavedSuggestion(List<Widget> divided);
//
//}
//
//StatefulWidget _saveSuggestion(){
//  return Scaffold(
//    appBar: AppBar(
//      title: Text('Saved Suggestions'),
//    ),
//    body: ListView(children: divided),
//  );
//}
