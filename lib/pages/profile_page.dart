import 'package:flutter/material.dart';
import '../widgets/profile_option.dart';
import '../widgets/footer_option.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 92),
            const Text(
              'Эдуард',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 24,
                height: 28 / 24,
                letterSpacing: 0.33,
              ),
            ),
            SizedBox(height: 22),
            const Text(
              '+7 900 800-55-33',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF898A8D),
                height: 16 / 15,
                letterSpacing: 0.33,
              ),
            ),
            SizedBox(height: 16),
            const Text(
              'email@gmail.com',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF898A8D),
                height: 16 / 15,
                letterSpacing: 0.33,
              ),
            ),
            SizedBox(height: 48),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  ProfileOption(
                    icon: Icons.shopping_bag,
                    label: 'Мои заказы',
                  ),
                  ProfileOption(
                    icon: Icons.medical_services,
                    label: 'Медицинские карты',
                  ),
                  ProfileOption(
                    icon: Icons.home,
                    label: 'Мои адреса',
                  ),
                  ProfileOption(
                    icon: Icons.settings,
                    label: 'Настройки',
                  ),
                ],
              ),
            ),
            SizedBox(height: 48),
            Center(
              child: Column(
                children: [
                  FooterOption(text: 'Ответы на вопросы'),
                  SizedBox(height: 24),
                  FooterOption(text: 'Политика конфиденциальности'),
                  SizedBox(height: 24),
                  FooterOption(text: 'Пользовательское соглашение'),
                  SizedBox(height: 24),
                  const Text(
                    'Выход',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: Color(0xFFFD3535),
                      height: 20 / 15,
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
