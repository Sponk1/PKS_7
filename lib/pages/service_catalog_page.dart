import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ServiceCatalogPage extends StatefulWidget {
  @override
  _ServiceCatalogPageState createState() => _ServiceCatalogPageState();
}

class _ServiceCatalogPageState extends State<ServiceCatalogPage> {
  final List<Map<String, String>> services = [
    {
      'name': 'ПЦР-тест на определение РНК коронавируса стандартный',
      'time': '2 дня',
      'price': '1800 ₽'
    },
    {
      'name': 'Тест на антитела IgG/IgM к COVID-19',
      'time': '1 день',
      'price': '1500 ₽'
    },
    {
      'name': 'Общий анализ крови',
      'time': '1 день',
      'price': '500 ₽'
    },
    {
      'name': 'Биохимический анализ крови',
      'time': '1 день',
      'price': '1200 ₽'
    },
    {
      'name': 'Анализ мочи общий',
      'time': '1 день',
      'price': '400 ₽'
    },
    {
      'name': 'Анализ на сахар в крови',
      'time': '1 день',
      'price': '600 ₽'
    },
    {
      'name': 'Тест на аллергены',
      'time': '3 дня',
      'price': '2500 ₽'
    },
  ];

  void _addToCart(String serviceName, String price) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(serviceName, price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 92),
            const Text(
              'Каталог услуг',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500, // Medium
                fontSize: 24,
                height: 28 / 24, // line height
                letterSpacing: 0.33,
              ),
            ),
            SizedBox(height: 66),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ServiceCard(
                      name: service['name']!,
                      time: service['time']!,
                      price: service['price']!,
                      onAdd: () {
                        _addToCart(service['name']!, service['price']!);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final String time;
  final String price;
  final VoidCallback onAdd;

  const ServiceCard({
    Key? key,
    required this.name,
    required this.time,
    required this.price,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 136,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              height: 20 / 16,
              letterSpacing: -0.32,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Color(0xFF939396),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onAdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A6FEE),
                  minimumSize: Size(96, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Добавить',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
