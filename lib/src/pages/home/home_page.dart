import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/menu_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => ShopListItem(220),
        itemCount: 100,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('kaisorn.dev'),
            accountEmail: Text('kaisorn@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/50194756?s=460&u=c5a19b9b2fb0fff0f46bcdb96a36eb81d1e1accf&v=4'),
            ),
            decoration: BoxDecoration(
              gradient: BackGroundTheme.gradient,
            ),
          ),
          ...MenuViewModel()
              .items
              .map((e) => ListTile(
                    onTap: e.onTap(context),
                    leading: Icon(e.icon),
                    title: Text('Logout'),
                  ))
              .toList(),
          Spacer(),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.loginRoute, (route) => false);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class ShopListItem extends StatelessWidget {
  final Function press;
  final double maxHeight;

  const ShopListItem(this.maxHeight, {Key key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildImage(),
            Expanded(
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildInfo() => Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'xxx',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$ 599',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '10 pieces',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                )
              ],
            ),
          ],
        ),
      );

  Stack _buildImage() {
    final height = maxHeight - 75;
    final productImage = 'https://cu.lnwfile.com/f3vhiv.jpg';
    return Stack(
      children: [
        productImage != null && productImage.isNotEmpty
            ? Image.network(
                productImage,
                height: height,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'xxx',
                height: height,
                width: double.infinity,
              ),
        1 > 0
            ? SizedBox()
            : Positioned(
                top: 1,
                right: 1,
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.box,
                          size: 15.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'out of stock',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
