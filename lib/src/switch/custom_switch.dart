import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class CustomSwitchDemo extends StatefulWidget {
  const CustomSwitchDemo({Key? key}) : super(key: key);

  @override
  State<CustomSwitchDemo> createState() => _CustomSwitchDemoState();
}

class _CustomSwitchDemoState extends State<CustomSwitchDemo> {
  final _controller00 = ValueNotifier<bool>(false);
  final _controller01 = ValueNotifier<bool>(false);
  final _controller02 = ValueNotifier<bool>(false);
  final _controller03 = ValueNotifier<bool>(false);
  final _controller04 = ValueNotifier<bool>(false);
  final _controller05 = ValueNotifier<bool>(false);
  final _controller06 = ValueNotifier<bool>(false);
  final _controller07 = ValueNotifier<bool>(false);
  final _controller08 = ValueNotifier<bool>(false);
  final _controller09 = ValueNotifier<bool>(false);
  final _controller10 = ValueNotifier<bool>(false);
  final _controller11 = ValueNotifier<bool>(false);
  final _controller12 = ValueNotifier<bool>(false);
  final _controller13 = ValueNotifier<bool>(false);
  final _controller14 = ValueNotifier<bool>(false);
  final _controller15 = ValueNotifier<bool>(false);

  bool _enabled = false;
  bool _themeDark = false;

  @override
  void initState() {
    super.initState();
    _controller00.addListener(() {
      setState(() {
        _controller00.value ? _themeDark = true : _themeDark = false;
      });
    });
  }

  @override
  void dispose() {
    _controller01.dispose();
    _controller02.dispose();
    _controller03.dispose();
    _controller04.dispose();
    _controller05.dispose();
    _controller06.dispose();
    _controller07.dispose();
    _controller08.dispose();
    _controller09.dispose();
    _controller10.dispose();
    _controller11.dispose();
    _controller12.dispose();
    _controller13.dispose();
    _controller14.dispose();
    _controller15.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Advanced Switch Example')),
        body: SingleChildScrollView(
          // padding: const EdgeInsets.only(left: 20, right: 20),
          // physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLabel('Switch Theme'),
              AdvancedSwitch(
                controller: _controller00,
                thumb: ValueListenableBuilder<bool>(
                  valueListenable: _controller00,
                  builder: (_, value, __) {
                    return Icon(
                        value ? Icons.lightbulb : Icons.lightbulb_outline);
                  },
                ),
              ),
              const SizedBox(height: 20),
              UnconstrainedBox(
                child: AdvancedSwitch(
                  controller: _controller01,
                  width: 110,
                  enabled: false,
                  inactiveColor: Colors.red,
                  activeColor: Colors.green,
                  activeChild: const Text(
                    'File selected',
                    style: TextStyle(color: Colors.black87),
                  ),
                  inactiveChild: const Text(
                    'No File Selected',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              _buildLabel('Default Switch'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdvancedSwitch(
                    controller: _controller01,
                  ),
                  const SizedBox(width: 25),
                  AdvancedSwitch(
                    controller: _controller01,
                    thumb: ValueListenableBuilder<bool>(
                      valueListenable: _controller01,
                      builder: (_, value, __) {
                        return Icon(
                            value ? Icons.cloud_upload : Icons.cloud_download);
                      },
                    ),
                  ),
                ],
              ),
              _buildLabel('Disabled Switch'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdvancedSwitch(
                    enabled: _enabled,
                    controller: ValueNotifier(false),
                  ),
                  const SizedBox(width: 25),
                  AdvancedSwitch(
                    enabled: _enabled,
                    controller: ValueNotifier(true),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () => setState(() => _enabled = !_enabled),
                    child: const Text('Enable/Disable'),
                  )
                ],
              ),
              _buildLabel('Color/Icon/Image Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    activeColor: Colors.orangeAccent,
                    inactiveColor: Colors.indigo,
                    activeChild: const Text('Yellow'),
                    inactiveChild: const Text('Indigo'),
                    width: 80,
                    controller: _controller03,
                  ),
                  AdvancedSwitch(
                    activeChild: const Icon(
                      Icons.terrain,
                      color: Colors.white,
                    ),
                    inactiveChild: const Icon(Icons.cloud),
                    activeColor: Colors.teal,
                    inactiveColor: Colors.deepPurple,
                    width: 60,
                    controller: _controller15,
                  ),
                ],
              ),
              _buildLabel('ON/OFF Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    activeChild: const Text(
                      '1',
                      style: TextStyle(fontSize: 20),
                    ),
                    inactiveChild: const Text(
                      '0',
                      style: TextStyle(fontSize: 20),
                    ),
                    width: 80,
                    height: 40,
                    controller: _controller02,
                  ),
                  AdvancedSwitch(
                    activeChild: const Text(
                      'ON',
                      style: TextStyle(fontSize: 20),
                    ),
                    inactiveChild: const Text(
                      'OFF',
                      style: TextStyle(fontSize: 20),
                    ),
                    borderRadius: BorderRadius.circular(5),
                    width: 100,
                    height: 40,
                    controller: _controller04,
                    inactiveColor: Colors.lightBlue,
                  ),
                  AdvancedSwitch(
                    activeChild: const Text(
                      'true',
                      style: TextStyle(fontSize: 20),
                    ),
                    inactiveChild: const Text(
                      'false',
                      style: TextStyle(fontSize: 20),
                    ),
                    borderRadius: BorderRadius.zero,
                    width: 100,
                    height: 40,
                    controller: _controller05,
                    activeColor: Colors.teal,
                  ),
                ],
              ),
              _buildLabel('XXS/XS Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    width: 16,
                    height: 8,
                    controller: _controller06,
                  ),
                  AdvancedSwitch(
                    width: 32,
                    height: 16,
                    controller: _controller07,
                  ),
                ],
              ),
              _buildLabel('S/M/L Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    width: 48,
                    height: 24,
                    controller: _controller08,
                  ),
                  AdvancedSwitch(
                    width: 56,
                    height: 28,
                    controller: _controller09,
                  ),
                  AdvancedSwitch(
                    width: 72,
                    height: 36,
                    controller: _controller10,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ],
              ),
              _buildLabel('XL/XXL Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    width: 96,
                    height: 48,
                    controller: _controller11,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  AdvancedSwitch(
                    width: 112,
                    height: 56,
                    controller: _controller12,
                    borderRadius: BorderRadius.circular(29),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String value) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 5),
      child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
