import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier{

  int _count = 0;
   setCounter() => _count;
   getCounter() => _count = _count;
   void incrementCounter(){
    _count++;
    notifyListeners();
   }

}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Text('${Provider.of<Counter>(context)._count}'),
              TextButton(onPressed: (){
                try{
                  Provider.of<Counter>(context, listen: false).incrementCounter();
                }catch(e){
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },child: const Text('Click'),),
            ],
          ),
        ),
      ),
    );
  }
}