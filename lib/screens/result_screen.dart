import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ResultScreen extends StatelessWidget {

  final int weight;
  final double height;

  const ResultScreen({super.key, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolBarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height/100;
    double imcResult = weight/(fixedHeight*fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('TU RESULTADO', style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.bold
            )
          ,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(getTitleByImc(imcResult), 
                      style: TextStyle(
                        color: getColorByImc(imcResult), 
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(imcResult.toStringAsFixed(2), 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 76, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(getDescriptionByImc(imcResult), 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 26,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },  
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ))
              ),
              child: Text("FINALIZAR", style: TextStyles.bodyText,)
            ),
          )
        ],
      ),
    );
  }

  AppBar toolBarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
  
  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // Bajo
      < 24.9 => Colors.green, // Normal
      < 29.99 => Colors.orange, // Sobrepeso
      _ => Colors.red, // Obesidad
    };
  }

  String getTitleByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => 'Imc Bajo',
      < 24.9 => 'Imc Normal',
      < 29.99 => 'Sobrepeso', // Sobrepeso
      _ => 'Imc Obesidad', // Obesidad
    };
  }

  String getDescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => 'Tu peso esta por debajo de lo recomendado.',
      < 24.9 => 'Tu peso esta en el rango saludable.',
      < 29.99 => 'Tienes Sobrepeso, cuida tu alimentación.', // Sobrepeso
      _ => 'Tienes Obesidad, consulta con un especialista.', // Obesidad
    };
  }
}
