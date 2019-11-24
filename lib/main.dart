import 'package:flutter/material.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenPage createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            accentColor: Colors.red),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: new Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              isScrollable: false,
              // to customise tab indicator
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5.0, color: Colors.blue),
                  insets: EdgeInsets.symmetric(horizontal: 16.0)),
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.favorite_border),
                  child: Text("One"),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  child: Text("Two"),
                ),
                Tab(
                  icon: Icon(Icons.add_a_photo),
                  child: Text("Three"),
                )
              ],
              controller: tabController,
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              new MyBody("Page One"),
              new MyBody("Page Two"),
              new MyBody("Page Three")
            ],
// if you want yo disable swiping in tab the use below code
//            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
          ),
        ));
  }
}

class MyBody extends StatelessWidget {
  final String title;

  MyBody(this.title);

  final mySnackBar = SnackBar(
    content: Text(
      "Hello There!",
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text(title + "  Click me"),
              onPressed: () => {Scaffold.of(context).showSnackBar(mySnackBar)}),
        ],
      ),
    );
  }
}
