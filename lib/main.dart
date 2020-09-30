import 'package:event_inside_onwillpop/bloc/testbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event inside onWillPop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TestblocBloc(),
        child: WillPopScope(
          onWillPop: () async {
            BlocProvider.of<TestblocBloc>(context).add(GoBackEvent());
            return Future.value(false);
          },
          child: Scaffold(
            body: BlocBuilder<TestblocBloc, TestblocState>(
              builder: (context, state) {
                if (state is TestblocInitial) return FirstPage();
                if (state is SecondPageState) return SecondPage();
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You are on First page',
          ),
          FlatButton(
            onPressed: () => BlocProvider.of<TestblocBloc>(context)
                .add(GoToSecondPageEvent()),
            child: Text("Go to second page"),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You are on Second page',
          ),
          FlatButton(
            onPressed: () =>
                BlocProvider.of<TestblocBloc>(context).add(GoBackEvent()),
            child: Text("Go to First page"),
          )
        ],
      ),
    );
  }
}

