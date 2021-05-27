import 'package:flutter/material.dart';
import 'package:sanificatori/viewmodel/DeviceViewModel.dart';
import 'package:stacked/stacked.dart';

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  TextEditingController textEditingController =
      new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeviceViewModel>.reactive(
      builder: (context, viewModel, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Device"),
            ),
            body: Column(
              children: <Widget>[
                TextField(controller: textEditingController),
                TextButton(
                    onPressed: () {
                      viewModel.saveDevice(textEditingController.text);
                    },
                    child: Text("Salva")),
              ],
            ));
      },
      viewModelBuilder: () => DeviceViewModel(),
      onModelReady: (viewModel) async {
        textEditingController.text = await viewModel.getDevice();
      },
    );
  }
}
