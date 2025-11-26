import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {

  final double selectedHeight;
  final Function(double) onHeightChange;

  const HeightSelector({super.key, required this.selectedHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text('Altura'.toUpperCase(), style: TextStyles.bodyText,),
            ),
            Text('${widget.selectedHeight.toStringAsFixed(0)} cm', style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold
              )
            ),
            Slider(
              value: widget.selectedHeight, 
              onChanged: (value) {
                widget.onHeightChange(value);
              },
              max: 220,
              min: 120,
              divisions: 100,
              // ignore: unnecessary_string_interpolations
              label: "${widget.selectedHeight.toStringAsFixed(0)}",
              activeColor: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}