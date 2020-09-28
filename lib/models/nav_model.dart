import 'package:flutter/material.dart';

class NavigationModel{
  String title;
  IconData icon;

  NavigationModel({
    this.title, this.icon
});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "PISB", icon: Icons.ac_unit),
  NavigationModel(title: "PING", icon: Icons.ac_unit),
  NavigationModel(title: "SPONSORS", icon: Icons.ac_unit),
  NavigationModel(title: "MY EVENTS", icon: Icons.ac_unit),
  NavigationModel(title: "EDIT PROFILE", icon: Icons.ac_unit),
  NavigationModel(title: "VISIT WEBSITE", icon: Icons.ac_unit),
  NavigationModel(title: "PRIVACY POLICY", icon: Icons.ac_unit),
];