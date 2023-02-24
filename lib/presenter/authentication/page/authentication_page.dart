import 'package:flutter/material.dart';
import 'package:melembra/domain/usecases/authentication.dart';
import 'package:melembra/utils/images.dart';
import 'package:melembra/utils/providers.dart';

class AuthenticationPage extends StatelessWidget {
  final Authentication authentication = getIt<Authentication>();

  AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagesRepository.authImage, height: 250),
            const SizedBox(height: 30),
            const Text(
              "Bem-vindo!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff3072F2),
              ),
            ),
            const Text(
              "Não perca mais o prazo de\npagamento dos seus boletos.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff7D7D7D),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0xff3072F2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () => authentication.signInWithGoogleAccount(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImagesRepository.iconGoogle,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Fazer login com o Google",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff3E3E3E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
