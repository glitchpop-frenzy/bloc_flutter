import 'package:bloc_flutter/business_logic/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Consumer can include both listener and builder
            BlocConsumer<CounterCubit, CounterState>(
              // listener is used when one want to execute the code just one,
              //for example if you push a button to navigate to new screen
              //then you'll use listener as you want it to execute just once
              // in builder if you press it multiple times then it'll stack up multiple same screens
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(seconds: 1)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(seconds: 1),
                  ));
                }
              },
              // if you want to execute a function after every state change
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRRR, NEGATIVE ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY, ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMMMM, NUMBER ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.remove)),
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
