import 'package:flutter/material.dart';
import 'package:sanificatori/viewmodel/DeviceViewModel.dart';
import 'package:stacked/stacked.dart';

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeviceViewModel>.reactive(
      builder: (context, viewModel, child) {
        viewModel.getDevice();

        return Scaffold(
            appBar: AppBar(
              title: Text("Device"),
            ),
            body: Column(
              children: <Widget>[
                TextField(controller: viewModel.textEditingController),
                TextButton(
                    onPressed: viewModel.saveDevice(), child: Text("Salva")),
              ],
            ));
      },
      viewModelBuilder: () => DeviceViewModel(),
    );
  }
}
