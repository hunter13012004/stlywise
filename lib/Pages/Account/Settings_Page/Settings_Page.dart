import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool triggerswitch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    'Notifications',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text('This will not affect any order updates'),
                  trailing: CupertinoSwitch(
                      value: triggerswitch,
                      onChanged: (value) {
                        setState(() {
                          triggerswitch = !triggerswitch;
                        });
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
