import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';

class ShippingAddressScreen extends StatefulWidget {
  static String id = 'shipping_address_screen';

  @override
  _ShippingAddressScreenState createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "Shipping\nAddress",
                                style: kMenuTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ReusableBackButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 80.0),
                Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              "I Nyoman Triarta",
                              style: kCardTextStyle,
                            ),
                            SizedBox(width: 12.0),
                            Text(
                              "[Default]",
                              style: kCardLabelTextStyle.copyWith(
                                color: kMainColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "085967153944",
                          style: kCardLabelTextStyle,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Text(
                                "Jl. Dr. Ir Soekarno No. 1 Tampaksiring\nTampaksiring - Gianyar Regency, Bali, ID 80552",
                                style: kCardLabelTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.pin_drop_outlined,
                                color: kMainColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13.0),
                Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add New Address",
                          style: kCardTextStyle,
                        ),
                        Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
