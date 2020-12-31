import 'package:flutter/material.dart';
import 'package:color_convert/color_convert.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double red = 0, green = 0, blue = 0;
  String value = "000000";

  void showToast() {
    Fluttertoast.showToast(
      msg: "Texto copiado para área de transferência.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: red > 200 && green > 200 || blue > 200 && green > 200
          ? Colors.black
          : Colors.white,
      textColor: red > 200 && green > 200 || blue > 200 && green > 200
          ? Colors.white
          : Colors.black,
      fontSize: 14.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    value = convert.rgb.hex(red, green, blue);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(right: 16, left: 16),
        color: Color.fromARGB(255, red.toInt(), green.toInt(), blue.toInt()),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "#$value",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color:
                          red > 200 && green > 200 || blue > 200 && green > 200
                              ? Colors.black
                              : Colors.white,
                    ),
                  ),
                  FloatingActionButton(
                    elevation: 0,
                    child: Icon(
                      Icons.copy,
                      color:
                          red > 200 && green > 200 || blue > 200 && green > 200
                              ? Colors.black
                              : Colors.white,
                    ),
                    onPressed: () {
                      showToast();
                      Clipboard.setData(ClipboardData(text: "#$value"));
                    },
                    backgroundColor: Color.fromARGB(
                      255,
                      red.toInt(),
                      green.toInt(),
                      blue.toInt(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "RGB(${red.toInt()}, ${green.toInt()}, ${blue.toInt()})",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: red > 200 && green > 200 || blue > 200 && green > 200
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              SizedBox(height: 50),
              Slider(
                value: red,
                min: 0,
                max: 255,
                activeColor: Colors.red,
                inactiveColor: Colors.red[200],
                onChanged: (value) {
                  setState(() {
                    red = value;
                  });
                },
              ),
              Slider(
                value: green,
                min: 0,
                max: 255,
                activeColor: Colors.green,
                inactiveColor: Colors.green[200],
                onChanged: (value) {
                  setState(() {
                    green = value;
                  });
                },
              ),
              Slider(
                value: blue,
                min: 0,
                max: 255,
                activeColor: Colors.blue,
                inactiveColor: Colors.blue[200],
                onChanged: (value) {
                  setState(() {
                    blue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
