import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvOne(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Provider two"),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.yellow,
          ),
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Selector<ProvOne, int>(
                  selector: (context, provs1) => provs1.showOne,
                  builder: (context, provone, child) {
                    print("text one");
                    return Text("${provone}");
                  }),
              SizedBox(
                height: 30,
              ),
              Selector<ProvOne, String>(
                  selector: (context, proves2) => proves2.showTwo,
                  builder: (context, provone, child) {
                    print("text two");
                    return Text("${provone}");
                  }),
              SizedBox(
                height: 30,
              ),
              Consumer<ProvOne>(builder: (context, provone, child) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      provone.doSomeThing1();
                    },
                    child: Text("Do SomeThing"));
              }),
              SizedBox(
                height: 30,
              ),
              Consumer<ProvOne>(builder: (context, provone, child) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      provone.doSomeThing2();
                    },
                    child: Text("Do SomeThing2"));
              })
            ],
          )),
    );
  }
}

class ProvOne extends ChangeNotifier {
  var showSomeThing1 = 1;
  var showSomeThing2 = "Show Something 2";
  get showOne => showSomeThing1;
  get showTwo => showSomeThing2;
  doSomeThing1() {
    showSomeThing1 ++;

    notifyListeners();
  }

  doSomeThing2() {
    showSomeThing2 = "Yes Provider 2";
    notifyListeners();
  }
}
