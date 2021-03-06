import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class ListTileSwitchDemo extends StatefulWidget {
  const ListTileSwitchDemo({Key? key}) : super(key: key);

  @override
  State<ListTileSwitchDemo> createState() => _ListTileSwitchDemoState();
}

class _ListTileSwitchDemoState extends State<ListTileSwitchDemo> {
  final List<bool> _switchValues = List.generate(7, (_) => false);
  final TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTileSwitch Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ListTileSwitch with only title', style: textStyle),
            const SizedBox(height: 20),
            ListTileSwitch(
              value: _switchValues[0],
              leading: const Icon(Icons.access_alarm),
              onChanged: (value) {
                setState(() {
                  _switchValues[0] = value;
                });
              },
              switchActiveColor: Colors.indigo,
              title: const Text('Default Custom Switch'),
            ),
            ListTileSwitch(
              value: _switchValues[1],
              leading: const Icon(Icons.message),
              onChanged: (value) {
                setState(() {
                  _switchValues[1] = value;
                });
              },
              switchActiveColor: Colors.teal,
              switchScale: 0.8,
              switchType: SwitchType.cupertino,
              title: const Text('Cupertino Switch'),
            ),
            ListTileSwitch(
              value: _switchValues[2],
              leading: const Icon(Icons.build),
              onChanged: (value) {
                setState(() {
                  _switchValues[2] = value;
                });
              },
              switchActiveColor: Colors.deepOrange,
              switchType: SwitchType.material,
              title: const Text('Material Switch'),
            ),
            const SizedBox(height: 20),
            Text('ListTileSwitch with subtitle', style: textStyle),
            const SizedBox(height: 20),
            ListTileSwitch(
              value: _switchValues[3],
              toggleSelectedOnValueChange: true,
              leading: const Icon(Icons.access_alarms),
              onChanged: (value) {
                setState(() {
                  _switchValues[3] = value;
                });
              },
              subtitle: const Text(
                'This tile is using custom switch and subtitle.',
              ),
              switchActiveColor: Colors.blueGrey,
              title: const Text('Custom Switch'),
            ),
            const SizedBox(height: 10),
            ListTileSwitch(
              value: _switchValues[4],
              leading: const Icon(Icons.message),
              onChanged: (value) {
                setState(() {
                  _switchValues[4] = value;
                });
              },
              switchActiveColor: Colors.teal,
              switchScale: 0.8,
              subtitle: const Text(
                'This tile is using cupertino switch and subtitle.',
              ),
              switchType: SwitchType.cupertino,
              title: const Text('Cupertino Switch'),
            ),
            const SizedBox(height: 10),
            ListTileSwitch(
              value: _switchValues[5],
              onChanged: (value) {
                setState(() {
                  _switchValues[5] = value;
                });
              },
              toggleSelectedOnValueChange: true,
              subtitle: const Text(
                'This tile is using material switch and subtitle.',
              ),
              switchActiveColor: Colors.deepOrange,
              switchType: SwitchType.material,
              title: const Text('Material Switch'),
            ),
            const SizedBox(height: 20),
            Text('ListTileSwitch with no title', style: textStyle),
            const SizedBox(height: 20),
            ListTileSwitch(
              value: _switchValues[6],
              onChanged: (value) {
                setState(() {
                  _switchValues[6] = value;
                });
              },
              toggleSelectedOnValueChange: true,
              subtitle: const Text(
                'This tile is using material switch with only subtitle.',
              ),
              switchActiveColor: Colors.deepOrange,
              switchType: SwitchType.material,
            ),
          ],
        ),
      ),
    );
  }
}
