import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';

class Test extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  DateTime _currentTime;
  DateTime _ntpTime;
  int _ntpOffset;  

    void _updateTime() async {
    _currentTime = DateTime.now();
print("ok!");
    NTP.getNtpOffset().then((value) {
      print('runninf here');
      setState(() {
        _ntpOffset = value;
        _ntpTime = _currentTime.add(Duration(milliseconds: _ntpOffset));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              floatingActionButton: new FloatingActionButton(
          tooltip: 'Update time',
          child: const Icon(Icons.timer),
          onPressed: _updateTime,
        ),
      
       body: Container(
         child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Current time: $_currentTime'),
              Text('NTP offset:$_ntpOffset ms'),
              Text('NTP time:$_ntpTime'),
            ],
          ),
        ),
       ),

    );
  }
}
