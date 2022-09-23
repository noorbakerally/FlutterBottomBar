import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({ super.key });

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings>
    with AutomaticKeepAliveClientMixin<ProfileSettings>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Profile Settings Page"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}