import 'package:flutter/material.dart';
import 'package:flutter_store/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerTile(iconData: Icons.home, title: 'Inicio', page: 1),
          DrawerTile(iconData: Icons.list, title: 'Produtos',page: 2),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus pedidos',page: 3),
          DrawerTile(iconData: Icons.location_on , title: 'Lojas',page: 4),
        ],
      ),
    );
  }
}
