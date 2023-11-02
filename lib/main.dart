import 'package:blocapii/Model/Products.dart';
import 'package:blocapii/PP/cell_phone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CellPhoneBloc>(
        create: (BuildContext context) => CellPhoneBloc(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, title});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    context.read<CellPhoneBloc>().add(Fetch());
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'), backgroundColor: Colors.brown,
      ),
      body: BlocBuilder<CellPhoneBloc, CellPhoneState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.plist!.length,
              itemBuilder: (BuildContext context, int index) {
              Products p=state.plist![index];
              return ListTile(
                title: Text('${p.title}'),
              );
              });
        },
      ),
    );
  }
}
