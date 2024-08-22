import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/atoms/uxds_button.dart';

class UXDSDrawerProfile extends StatelessWidget {

  final String label;
  final Function()? onPressed;

  const UXDSDrawerProfile({
    required this.label,
    super.key,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(label),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                  },
                ),
              ],
            )
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10
              ),
              child: UXDSButton(
                labelText: 'Sign Out',
                onPressed: onPressed
              ),
            ),
          )
        ],
      ),
    );
  }
}