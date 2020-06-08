import 'package:flutter/material.dart';

class ShopMyShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('myshop'),
        ),
        body: ShopMyShopBody(),
      );
}

//演示两个控件，一个控件控制另一个控件的显示状态时，父控件为有状态，两个子控件无状态
class ShopMyShopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle, size: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Flutter McFlutter',
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  'Experienced App Developer',
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '123 Main Street',
            ),
            Text(
              '800-123-1234',
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(),
      ],
    );
  }
}
