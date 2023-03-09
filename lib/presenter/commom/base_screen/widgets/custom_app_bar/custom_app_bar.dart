import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../domain/usecases/authentication.dart';
import '../../../../../utils/providers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final user = getIt<Authentication>().getCurrentUser();
  final String? pageTitle;

  CustomAppBar({Key? key, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: const Color(0xff3072F2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      centerTitle: true,
      title: title,
      leading: IconButton(
          icon: Icon(pageTitle != null ? Icons.arrow_back_ios_new : Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }),
      actions: [
        Container(
          height: 20,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.pictureUrl),
            radius: 20,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget get title {
    if (pageTitle != null) {
      return Text(
        pageTitle!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      );
    } else {
      return RichText(
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
      );
    }
  }

  @override
// TODO: implement preferredSize
  Size get preferredSize => const Size(0, 95);
}
