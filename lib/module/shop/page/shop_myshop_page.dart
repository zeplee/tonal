import 'package:flutter/material.dart';

class ShopMyShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      );

  _buildAppBar() => AppBar(
        title: Text('myshop'),
      );

  _buildBody(context) => Column(
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
                    style: Theme.of(context).textTheme.headline6,
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
