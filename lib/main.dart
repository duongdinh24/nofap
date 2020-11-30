import 'package: flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Welcom to Flutter",
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _words = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 19.0);
  final Set<WordPair> _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Example for Statefull"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved,)
        ],
      ),

      body: Center(child: ListView.builder(itemBuilder: (context, index){
        if (index.isOdd) return Divider();
        if (index >= _words.length){
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index]);
    })),
    );
  }
  Widget _buildRow(WordPair wordPair){
    final bool alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite: Icons.favorite_border,
        color:  alreadySaved ? Colors.red = null,
      ),
      onTap: (){
        setState((){
          if(alreadySaved){
            _saved.remove(wordPair);
          } else{
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}

void _pushSaved(){
  Navigator.of(context)
      .push(new MaterialPageRoute<void>(builder: (BuildCContext context){
        final Interable<ListTile> tiles = _saved.map((WordPair pain){
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        })
        final List<Widget> divided = ListTile.divideTiles(tiles: tiles, context: context).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: const Text("Saved list"),
          ),
          body: new ListView(
            children: divided,
          ),
        );
  }));
}