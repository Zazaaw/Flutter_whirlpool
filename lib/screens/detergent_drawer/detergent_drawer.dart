import 'package:flutter/material.dart';
import 'package:flutter_whirlpool/screens/detergent_drawer/detergent_slider.dart';
import 'package:flutter_whirlpool/shared/colors.dart';
import 'package:flutter_whirlpool/shared/consts.dart';
import 'package:flutter_whirlpool/shared/widgets.dart';
import 'package:flutter_whirlpool/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class DetergentDrawer extends StatelessWidget {
  const DetergentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, _) {
        return Container(
          color: CustomColors.primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: globalEdgeMarginValue,
                top: drawerButtonMarginTop,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NeumorphicIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: CustomColors.icon,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Choose detergent',
                    style: TextStyle(
                      fontSize: 26,
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Please save choice',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: DetergentSlider(
                      minValue: 200,
                      maxValue: 1200,
                      initValue: viewModel.detergentValue,
                      onValueChanged: (newValue) =>
                          viewModel.detergentValue = newValue,
                    ),
                  ),
                  const SizedBox(height: 80),
                  RichText(
                    text: TextSpan(
                      text: 'Current  ',
                      style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: viewModel.detergentValue.toStringAsFixed(0),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
