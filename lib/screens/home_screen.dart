import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedAge = 20;
  int selectedWeight = 80;
  double selectedHeight = 170;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight, 
          onHeightChange: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  value: selectedWeight ,
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                )
              ),
              SizedBox(width: 16,),
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  value: selectedAge,
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                )
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ResultScreen(weight: selectedWeight, height: selectedHeight,))
                );
              }, 
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ))
              ),
              child: Text("CALCULAR", style: TextStyles.bodyText,)
            )
          ),
        )
      ],
    );
  }
}