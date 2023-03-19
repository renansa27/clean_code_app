import 'package:flutter/material.dart';
import 'package:tut_project/views/login/enums/strength_enum.dart';
import 'package:tut_project/views/resources/color_manager.dart';

class FieldStrength extends StatefulWidget {
  final int? strength;
  const FieldStrength({Key? key, this.strength}) : super(key: key);

  @override
  State<FieldStrength> createState() => _FieldStrengthState();
}

class _FieldStrengthState extends State<FieldStrength> {
  String _passwordStrength = StrengthEnum.weak;
  @override
  void initState() {
    super.initState();
    if (widget.strength == 0 || widget.strength == 1) {
      _passwordStrength = StrengthEnum.weak;
    } else if (widget.strength == 2) {
      _passwordStrength = StrengthEnum.soso;
    } else if (widget.strength == 3) {
      _passwordStrength = StrengthEnum.good;
    } else if (widget.strength == 4) {
      _passwordStrength = StrengthEnum.great;
    }
  }

  @override
  void didUpdateWidget(covariant FieldStrength oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.strength == 0 || widget.strength == 1) {
      _passwordStrength = StrengthEnum.weak;
    } else if (widget.strength == 2) {
      _passwordStrength = StrengthEnum.soso;
    } else if (widget.strength == 3) {
      _passwordStrength = StrengthEnum.good;
    } else if (widget.strength == 4) {
      _passwordStrength = StrengthEnum.great;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.794,
          height: 6,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        6.0,
                      ),
                    ),
                    color: _passwordStrength == StrengthEnum.weak
                        ? ColorManager.error
                        : _passwordStrength == StrengthEnum.soso
                            ? ColorManager.primary
                            : _passwordStrength == StrengthEnum.good
                                ? ColorManager.darkGrey //Verde claro
                                : _passwordStrength == StrengthEnum.great
                                    ? ColorManager.lightGrey // Verde escuro
                                    : ColorManager.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        6.0,
                      ),
                    ),
                    color: _passwordStrength == StrengthEnum.weak
                        ? ColorManager.white
                        : _passwordStrength == StrengthEnum.soso
                            ? ColorManager.primary
                            : _passwordStrength == StrengthEnum.good
                                ? ColorManager.darkGrey //Verde claro
                                : _passwordStrength == StrengthEnum.great
                                    ? ColorManager.lightGrey // Verde escuro
                                    : ColorManager.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        6.0,
                      ),
                    ),
                    color: _passwordStrength == StrengthEnum.weak
                        ? ColorManager.white
                        : _passwordStrength == StrengthEnum.soso
                            ? ColorManager.white
                            : _passwordStrength == StrengthEnum.good
                                ? ColorManager.darkGrey //Verde claro
                                : _passwordStrength == StrengthEnum.great
                                    ? ColorManager.lightGrey // Verde escuro
                                    : ColorManager.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        6.0,
                      ),
                    ),
                    color: _passwordStrength == StrengthEnum.weak
                        ? ColorManager.white
                        : _passwordStrength == StrengthEnum.soso
                            ? ColorManager.white
                            : _passwordStrength == StrengthEnum.good
                                ? ColorManager.white //Verde claro
                                : _passwordStrength == StrengthEnum.great
                                    ? ColorManager.lightGrey // Verde escuro
                                    : ColorManager.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              _passwordStrength == StrengthEnum.weak
                  ? 'Weak'
                  : _passwordStrength == StrengthEnum.soso
                      ? 'So-so'
                      : _passwordStrength == StrengthEnum.good
                          ? 'Good'
                          : 'Great!',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: _passwordStrength == StrengthEnum.weak
                        ? ColorManager.error
                        : _passwordStrength == StrengthEnum.soso
                            ? ColorManager.primary
                            : _passwordStrength == StrengthEnum.good
                                ? ColorManager.darkGrey
                                : ColorManager.darkPrimary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
