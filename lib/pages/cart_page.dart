import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 92,
        title: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: const Text(
            'Корзина',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 24,
              height: 28 / 24,
              letterSpacing: 0.33,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: cart.items.isEmpty
          ? Center(
        child: const Text(
          'Корзина пуста',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 27.5, vertical: 20),
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items.values.toList()[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  height: 138,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE0E0E0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                height: 20 / 16,
                                letterSpacing: -0.32,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: 20, color: Colors.grey),
                            onPressed: () {
                              cart.removeItem(item.name);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${item.price}',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                              height: 24 / 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${item.quantity} ${item.quantity == 1 ? 'пациент' : 'пациента'}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  height: 20 / 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: 100,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove, color: Color(0xFFB8C1CC)),
                                      onPressed: () {
                                        cart.removeSingleItem(item.name);
                                      },
                                      padding: EdgeInsets.zero,
                                    ),
                                    Container(
                                      width: 1,
                                      color: Color(0xFFEBEBEB),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add, color: Color(0xFF939396)),
                                      onPressed: () {
                                        cart.addItem(item.name, item.price);
                                      },
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Сумма',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    height: 28 / 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.38,
                  ),
                ),
                Text(
                  '${cart.getTotalAmount()} ₽',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    height: 28 / 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.38,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, bottom: 118),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A6FEE),
                minimumSize: Size(335, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Перейти к оформлению заказа',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 24 / 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
