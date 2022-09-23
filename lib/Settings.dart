import 'package:flutter/material.dart';
class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>  with AutomaticKeepAliveClientMixin<Settings>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/main'),
            child: Text('Go to Main Screen'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/settings/profile'),
            child: Text('Go to Profile Settings'),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}