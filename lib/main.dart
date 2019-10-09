import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  List<Container> daftarStadium = new List();

  var stadium = [
    {"name":"Allianz Arena","pic":"allianz.jpg"},
    {"name":"Camp Nou","pic":"campnou.jpg"},
    {"name":"Etihad Stadium","pic":"etihad.jpg"},
    {"name":"Old Trafford","pic":"oldtrafford.jpg"},
    {"name":"Santiago Bernabeu","pic":"santiago.jpg"},
    {"name":"Wembley Stadium","pic":"wembley.jpg"},
  ];

  _list()async{
    for (var i=0; i<stadium.length;i++){
      final listStadium = stadium[i];
      final picture = listStadium["pic"];

      daftarStadium.add(
        new Container(
          padding: EdgeInsets.all(10.0),
          child: new Card(
            child: new Column(
              children: <Widget>[

                new Hero(
                  tag: listStadium["name"],
                  child: new Material(
                    child: new InkWell(
                      onTap:()=> Navigator.push(context, new MaterialPageRoute(
                          builder:(BuildContext context)=> Detail(name: listStadium["name"],pic: "img/"+picture,))
                      ) ,
                      child: new Image.asset("img/"+picture,fit: BoxFit.fill,),
                    ),
                  ) ,
                ),


                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(listStadium["name"], style: TextStyle(fontSize: 18.0),),
              ],
            ),
          )
          ),
      );
    }
  }

  @override
  void initState() {
    _list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Football Stadium")
      ),

      body: new GridView.count(
          crossAxisCount: 2 , // untuk banyak kolom di grid
          children: daftarStadium,
      ),
    );
  }
}


class Detail extends StatelessWidget {
  final String name;
  final String pic;
  Detail({this.name,this.pic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(name,textAlign: TextAlign.center,),

      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
                tag: name,
                child: new Image.asset(pic,fit: BoxFit.cover,),
            ),
          ),

          new NameSide(name: name,),
          new IconSide(),
          new InfoSide(),
        ],
      )
    );
  }
}

class IconSide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          IconLayout(iconData: Icons.call,textIcon: "Call",),
          IconLayout(iconData: Icons.location_on,textIcon: "Location",),
          IconLayout(iconData: Icons.photo, textIcon: "Photo",),
        ],
      ),
    );
  }
}

class IconLayout extends StatelessWidget {
  final IconData iconData;
  final String textIcon;

  IconLayout({this.iconData,this.textIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          new Icon(iconData, size: 45.0,color: Colors.lightBlue,),
          new Text(textIcon,style: TextStyle(fontSize: 14.0,color: Colors.lightBlue[600]),)
        ],
      ),
    );
  }
}


class NameSide extends StatelessWidget {
  String name;
  NameSide({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(name,style: TextStyle(fontSize: 24.0,color: Colors.black54),),
                new Text(name+" Street", style: TextStyle(fontSize: 16.0,color: Colors.grey),),
              ],
            ),
          ),

          new Row(
            children: <Widget>[
              new Icon(Icons.star,color: Colors.amber,size: 30.0,),
              new Text("5",style: TextStyle(fontSize: 18.0),)
            ],
          )
        ],
      ),
    );
  }
}


class InfoSide extends StatelessWidget {
  final String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Purus viverra accumsan in nisl nisi scelerisque eu ultrices. Vehicula ipsum a arcu cursus vitae. "
      "Risus at ultrices mi tempus imperdiet nulla malesuada. Varius quam quisque id diam vel quam elementum pulvinar. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum. "
      "Habitant morbi tristique senectus et. Nibh sit amet commodo nulla facilisi nullam. Auctor augue mauris augue neque. Non quam lacus suspendisse faucibus interdum posuere lorem. Donec massa sapien faucibus et. Dignissim cras tincidunt lobortis feugiat vivamus at. "
      "Id semper risus in hendrerit gravida rutrum quisque non tellus. Erat imperdiet sed euismod nisi porta lorem mollis aliquam ut. "
      "Posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Enim sed faucibus turpis in eu mi bibendum neque. "
      "In pellentesque massa placerat duis. Dignissim sodales ut eu sem.";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: new Text(text,style: TextStyle(fontSize: 16.0),),
    );
  }
}
