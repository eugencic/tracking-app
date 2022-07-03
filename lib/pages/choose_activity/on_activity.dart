import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/pages/home/home.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class OnActivity extends StatefulWidget {
  const OnActivity({Key? key}) : super(key: key);

  @override
  State<OnActivity> createState() => _OnActivityState();
}

class _OnActivityState extends State<OnActivity> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    return Scaffold(
        body: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110.0,
                ),
                Icon(Icons.timer, size: 50, color: Colors.black87,),
                SizedBox(
                  height: 70.0,
                ),
                Text('Your activity has started',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w500
                    )
                ),
                SizedBox(
                  height: 100.0,
                ),
                StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: _stopWatchTimer.rawTime.value,
                    builder: (context, snapshot) {
                  final value = snapshot.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                  return Text(
                    displayTime,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )
                  );
                }),
                SizedBox(
                  height: 110.0,
                ),
                TextButton(
                    child: Text('Stop'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      onSurface: Colors.grey,
                      elevation: 5,
                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () async {
                      await db
                          .collection('activities')
                          .doc(auth.currentUser?.uid.toString())
                          .collection('unfinished')
                          .doc("1")
                          .get()
                          .then((DocumentSnapshot snapshot) async {
                        await FirebaseFirestore.instance
                            .collection('activities')
                            .doc(FirebaseAuth.instance.currentUser?.uid.toString())
                            .collection('all')
                            .add({
                          'name': snapshot['name'],
                          'time_begin': snapshot['time_begin'],
                          'kka': 30,
                          'time': DateTime.now()
                              .difference(snapshot['time_begin'].toDate())
                              .inMinutes,
                          'time_end': DateTime.now(),
                        });
                      });

                      await db
                          .collection('activities')
                          .doc(auth.currentUser?.uid.toString())
                          .collection('unfinished')
                          .doc("1")
                          .delete();

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Home()));
                    }),
              ],
            )));
  }
}