import 'package:booking_app/screens/booking_complete.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Заказ оплачен'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Кнопка для перехода на другой экран
            ElevatedButton(
              onPressed: () {
                // Навигация к другому экрану при нажатии кнопки
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookingCompleteScreen(),
                  ),
                );
              },
              child: Text('Перейти на другой экран'),
            ),
          ],
        ),
      ),
    );
  }
}

// Ваш другой экран (AnotherScreen) должен быть определен в другом месте.
