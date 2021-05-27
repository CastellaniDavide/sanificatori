import 'package:flutter/material.dart';
import 'package:sanificatori/Account.dart';
import 'package:sanificatori/Device.dart';
import 'package:sanificatori/Searching.dart';
import 'package:sanificatori/viewmodel/HomeViewModel.dart';
import 'package:stacked/stacked.dart';

import 'main.dart';

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: getBody(viewModel.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Device"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bluetooth_searching), label: "Searching")
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (viewModel) {
        viewModel.init();
      },
    );
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return Account();
      case 1:
        return Device();
      case 2:
        return Searching();
    }
  }
}
