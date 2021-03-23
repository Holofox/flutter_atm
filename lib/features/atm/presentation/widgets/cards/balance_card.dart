import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';
import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key? key,
    required this.categoryName,
    this.items = const [],
  }) : super(key: key);

  final String categoryName;
  final List<BankCell> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Card(
        color: AtmColors.white,
        elevation: 0,
        margin: const EdgeInsets.only(top: 10.0),
        shape: const Border(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 21.0,
            top: 14.0,
            right: 21.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 13.0,
                  height: 1.5151,
                  color: AtmColors.gray,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15.0),
              GridView.extent(
                maxCrossAxisExtent: 250.0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 10.0,
                children: List.generate(
                  items.length,
                  (index) => _buildListItem(items[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BankCell cell) {
    return Text(
      cell.toString(),
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        height: 1.1671,
        color: AtmColors.textColor,
      ),
      textAlign: TextAlign.start,
    );
  }
}
