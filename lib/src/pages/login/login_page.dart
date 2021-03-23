import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/sso_viewmodel.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: BackGroundTheme.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'assets/images/logo.png',
                  width: 350,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Card(
                      margin: EdgeInsets.only(
                        bottom: 22,
                        left: 22,
                        right: 22,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          right: 22,
                          top: 22,
                          bottom: 42,
                        ),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: "exmaple@gmail.com",
                                labelText: "Username",
                                icon: Icon(Icons.person),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              height: 28,
                              indent: 22,
                              endIndent: 22,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Password",
                                icon: Icon(Icons.lock),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: _boxDecoration(),
                      width: 280,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          print('login click!!!');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                _buildTextButton(
                  'forgot password?',
                  onPressed: () {
                    //todo
                  },
                ),
                SSOButton(),
                _buildTextButton(
                  'register',
                  onPressed: () {
                    //todo
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    final gradientStart = BackGroundTheme().gradientStart;
    final gradientEnd = BackGroundTheme().gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadow: <BoxShadow>[
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: LinearGradient(
        colors: [
          gradientEnd,
          gradientStart,
        ],
        begin: const FractionalOffset(0, 0),
        end: const FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
      ),
    );
  }

  Container _buildTextButton(String text, {VoidCallback onPressed}) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      );
}

class SSOButton extends StatelessWidget {
  const SSOButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: SSOViewModel()
            .item
            .map(
              (item) => FloatingActionButton(
                onPressed: item.onPressed,
                child: FaIcon(
                  item.icon,
                  color: item.iconColor,
                ),
                backgroundColor: item.backgroundColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
