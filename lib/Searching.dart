import 'package:flutter/material.dart';
import 'package:sanificatori/model/BTDevice.dart';
import 'package:sanificatori/viewmodel/SearchingViewModel.dart';
import 'package:stacked/stacked.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchingViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text("Scan for Bluetooth devices"),
        ),
        body: new RefreshIndicator(
          child: new ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: viewModel.devices.length,
              itemBuilder: (context, i) {
                return _buildRow(viewModel.devices[i], viewModel);
              }),
          onRefresh: viewModel.scanDevices,
        ),
      ),
      viewModelBuilder: () => SearchingViewModel(),
    );
  }

  Widget _buildRow(BTDevice device, SearchingViewModel viewModel) {
    return ListTile(
      title: Text(device.name),
      subtitle: Text(device.MAC),
      trailing: (RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        color: Colors.grey,
        child: Text(device.connected ? "Disconnect" : "Connect"),
        onPressed: () {
          viewModel.connectToDevice(device);
        },
      )),
      onTap: () {
        viewModel.connectToDevice(device);
      },
    );
  }
}
