import 'package:flutter/material.dart';
import 'package:flutter_store/models/page_menager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  DrawerTile({this.iconData, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageMenager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        context.read<PageMenager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Icon(iconData,
                  size: 32.0,
                  color: curPage == page ? primaryColor: Colors.grey[700]),
            ),
            Text(title, style: TextStyle(fontSize: 16.0, color: curPage == page ? primaryColor : Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
