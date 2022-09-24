import 'dart:math';


import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
////
}
class RRandom{
  var random_n=0;
  RRandom(){
    var  r = new Random();
    random_n = r.nextInt(100)+1;
    print(random_n);
  }

}
class _HomeState extends State<Home> {
  var Messege = "";
  var Messege2 = "ทายเลข 1-100";
  var countnumber = 0;

  var A = new RRandom();

  void sumMessege(int n) {
    setState(() {
      Messege += n.toString();
    });
  }

  void setMessege2(var str) {
    if (Messege.length == 0) {
      setState(() {
        Messege2 = str;
      });
    } else {
      setState(() {
        Messege2 = "$Messege : " + str;
      });
    }
  }

  void deleteMessege(int n) {
    setState(() {
      Messege = Messege.substring(0, Messege.length - 1);
    });
  }

  void callculate() {
    var checknum = int.tryParse(Messege);
    if (checknum == A.random_n) {
      setMessege2("ถูกต้อง (ทายไป $countnumber ครั้ง)");
    } else {
      if (checknum! < A.random_n) {
        setMessege2("น้อยเกินไป");
      } else {
        setMessege2("มากเกินไป");
      }
    }
  }

  Widget Button(int n) {
    //1
    return InkWell(
        onTap: () {
          if (n == -1) {
            deleteMessege(n);
          } else if (n == -2) {
            return;
          } else if (n == -3) {
            countnumber++;
            if (Messege.length == 0) {
              setMessege2("โปรดใส่เลขด้วย");
              Messege = "";
              return;
            }
            callculate();
            Messege = "";
          } else {
            sumMessege(n);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.center,
              width: 55,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                border: Border.all(
                    color: Colors.black.withOpacity(0.76), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(() {
                if (n == -1) {
                  return "<";
                }
                if (n == -2) {
                  return "x";
                }
                if (n == -3) {
                  return "GUESS";
                }
                return "$n";
              }())),
        ),
        customBorder: UnderlineInputBorder());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GUESS THE NUMBER")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.black54.withOpacity(0.5),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 150),
                        Column(
                          children: [
                            Text("GUESS", style: TextStyle(fontSize: 35)),
                            Text("THE NUMBER", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        child: Text(Messege, style: TextStyle(fontSize: 40)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(Messege2),

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (var row in [
                      [1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9],
                    ])
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [for (var i in row) Button(i)],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(-2),
                        Button(0),
                        Button(-1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(-3),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}