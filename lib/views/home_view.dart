import 'package:flutter/material.dart';
import 'package:apponaug_stats/view_models/home_view_model.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:apponaug_stats/models/firebase_apponaugdata.dart';

class MyHomePage extends StatefulWidget {
  final HomeViewModel homeViewModel = HomeViewModel();
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = widget.homeViewModel;
    homeViewModel.fetchStats();
    super.initState();
  }

  int _counter = 0;

  void _incrementCounter() {
    // DatabaseReference _testRef =
    //     FirebaseDatabase.instance.ref('BoilerOpsRT').child('data');
    // String sample = _testRef.get.toString();
    //set('Hello World $Random().nextInt(100)');

    setState(() {
      _counter++;
    });
  }

//  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AppBar Demo'),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Streams POC'), //widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            _buildStatsText(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatsText() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: StreamBuilder<String>(
        builder: (context, snapshot) {
          if (snapshot.data?.isEmpty == true) {
            return Text('Empty data');
          }
          return Text('${snapshot.data!}');
        },
        initialData: '',
        stream: homeViewModel.dataElement,
      ),
    );
  }
}
