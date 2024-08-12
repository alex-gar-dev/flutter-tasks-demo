import 'package:flutter/material.dart';

class UXDSScaffold extends StatelessWidget {

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const UXDSScaffold({
    super.key,
    this.body,
    this.appBar,
    this.bottomNavigationBar
  });

  const UXDSScaffold.scaffoldLoader({
    super.key,
    this.body = const Center(
      child: CircularProgressIndicator(),
    ), 
    this.appBar,
    this.bottomNavigationBar
  });

  const UXDSScaffold.scaffoldErrorLoader({
    super.key,
    this.body = const Center(
      child: Text('Error fetching data'),
    ), 
    this.appBar,
    this.bottomNavigationBar
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar
    );
  }
}