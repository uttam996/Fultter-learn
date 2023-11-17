import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:learning_flutter_getx/app/modules/Tickers/views/tickers_view.dart';
import 'package:learning_flutter_getx/app/modules/first/views/first_view.dart';
import 'package:learning_flutter_getx/app/routes/app_pages.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.toNamed(Routes.HOME);
            },
          ),
          const ListTile(
            leading: Icon(Icons.login),
            title: Text('Tickerss'),
          ),
          ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Tickers'),
            onTap: () {
              Get.toNamed(Routes.TICKERS);
            },
          ),
        ],
      ),
    );
  }
}
