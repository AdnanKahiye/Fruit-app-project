import 'package:flutter/material.dart';
import 'package:fruit_app/themes/app_themes.dart';

class AddsWidget extends StatelessWidget {
  const AddsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To",
                    style: AppThems.bigTitle,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fresh Fruits Delivered Fast From Farm to Your Doorstep!',
                    style: AppThems.BodyText.copyWith(color: WhiteColr),
                  ),
                  SizedBox(height: 4),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: seconadryColor,
                          foregroundColor: WhiteColr),
                      onPressed: () {},
                      child: Text('Shop new year'))
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/general/land.png',
            height: 250,
            width: 200,
          )
        ],
      ),
    );
  }
}
