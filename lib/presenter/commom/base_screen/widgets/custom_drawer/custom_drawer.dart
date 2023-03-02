import 'package:flutter/material.dart';
import 'package:melembra/utils/providers.dart';

import '../../../../../domain/usecases/authentication.dart';

class CustomDrawer extends StatelessWidget {
  final user = getIt<Authentication>().getCurrentUser();

  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: const Color(0xff3072F2),
            height: 134,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.pictureUrl),
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Olá, ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: ' ${user.name}!',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home_outlined, color: Color(0xff3072F2),),
            title: Text('Início'),
          ),
          Divider(
            color: const Color(0xff7D7D7D).withOpacity(.20),
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          const ListTile(
            leading: Icon(Icons.settings_outlined, color: Color(0xff3072F2),),
            title: Text('Configurações'),
          ),
          Divider(
            color: const Color(0xff7D7D7D).withOpacity(.20),
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          const ListTile(
            leading: Icon(Icons.info_outline, color: Color(0xff3072F2),),
            title: Text('Sobre o app'),
          ),
          Divider(
            color: const Color(0xff7D7D7D).withOpacity(.20),
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          const ListTile(
            leading: Icon(Icons.logout, color: Color(0xff3072F2),),
            title: Text('Sair'),
          ),
        ],
      ),
    );
  }
}
