import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neoview/core/constants/colors.dart';
import 'package:neoview/core/constants/sizes.dart';
import 'package:neoview/core/constants/styles.dart';

class AppButton extends StatelessWidget {
  final bool _hollow;
  final Widget child;
  final void Function(BuildContext context) onClick;
  
  const AppButton({ super.key, required this.onClick, required this.child }): _hollow = false;
  const AppButton.hollow({ super.key, required this.onClick, required this.child }): _hollow = true;

  ButtonStyle get _style => _hollow ? _borderButtonStyle : _buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick(context),
      style: _style,
      child: child
    );
  }
}

class AppSquaredButton extends AppButton {
  final IconData icon;

  @override
  Widget get child => Center(child: FaIcon(icon));

  @override
  ButtonStyle get _style => _hollow ? _borderButtonStyleNoPadding : _buttonStyleNoPadding;

  const AppSquaredButton({ super.key, required super.onClick, required this.icon }): super(child: const Placeholder());
  const AppSquaredButton.hollow({ super.key, required super.onClick, required this.icon }): super.hollow(child: const Placeholder());

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        height: 40,
        width: 40,
        child: AspectRatio(
          aspectRatio: 1,
          child: super.build(context),
        ),
      ),
    );
  }
}

const _defaultButtonStyle = ButtonStyle(
  padding: WidgetStatePropertyAll(AppPaddings.small),
  iconSize: WidgetStatePropertyAll(18),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: AppBorderRadius.medium)),
);

final _buttonStyle = _defaultButtonStyle.copyWith(
  textStyle: const WidgetStatePropertyAll(AppTextStyles.button),
  iconColor: const WidgetStatePropertyAll(AppColors.white),
  foregroundColor: WidgetStateMapper({
    WidgetState.disabled: AppColors.grey.shade200,
    WidgetState.pressed: AppColors.grey.shade100,
    WidgetState.any: AppColors.white,
  }),
  backgroundBuilder: (context, states, child) {
    final priorityState = _getPriorityState(states);
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        border: _borders[priorityState] ?? _anyBorder,
        borderRadius: AppBorderRadius.medium,
        color: _backgrounds[priorityState] ?? _anyBackground,
      ),
      child: child,
    );
  },
);

final _borderButtonStyle = _defaultButtonStyle.copyWith(
  textStyle: const WidgetStatePropertyAll(AppTextStyles.hollowButton),
  backgroundBuilder: (context, states, child) {
    final priorityState = _getPriorityState(states);
    return Material(
      child: InkWell(
        overlayColor: WidgetStatePropertyAll(AppColors.white),
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          decoration: BoxDecoration(
            border: _borders[priorityState] ?? _anyBorder,
            borderRadius: AppBorderRadius.medium,
            color: states.contains(WidgetState.hovered)
              || states.contains(WidgetState.pressed)
              || states.contains(WidgetState.focused) ?
                _backgrounds[priorityState] ?? _anyBackground :
                Colors.transparent,
          ),
          child: child,
        ),
      ),
    );
  },
);

final _buttonStyleNoPadding = _buttonStyle.copyWith(
  padding: WidgetStatePropertyAll(AppPaddings.tiny),
);

final _borderButtonStyleNoPadding = _borderButtonStyle.copyWith(
  padding: WidgetStatePropertyAll(AppPaddings.tiny),
);

WidgetStatesConstraint _getPriorityState(Set<WidgetState> states) {
  if (states.contains(WidgetState.disabled)) return WidgetState.disabled;
  if (states.contains(WidgetState.error)) return WidgetState.error;
  if (states.contains(WidgetState.pressed)) return WidgetState.pressed;
  if (states.contains(WidgetState.focused)) return WidgetState.focused;
  if (states.contains(WidgetState.hovered)) return WidgetState.hovered;
  return WidgetState.any;
}

final _borders = {
  WidgetState.error: Border.fromBorderSide(BorderSide(
    color: AppColors.red,
    width: 2,
  )),
  WidgetState.disabled: Border.fromBorderSide(BorderSide(
    color: AppColors.grey.shade700,
    width: 2,
  )),
  WidgetState.pressed: Border.fromBorderSide(BorderSide(
    color: AppColors.blue.shade800,
    width: 2,
  )),
  WidgetState.hovered: Border.fromBorderSide(BorderSide(
    color: AppColors.blue.shade600,
    width: 2,
  )),
  WidgetState.focused: Border.fromBorderSide(BorderSide(
    color: AppColors.blue.shade600,
    width: 2,
  )),
};

final _anyBorder = Border.fromBorderSide(BorderSide(
  color: AppColors.blue,
  width: 2,
));

final _backgrounds = {
  WidgetState.error: AppColors.red,
  WidgetState.disabled: AppColors.grey.shade700,
  WidgetState.pressed: AppColors.blue.shade800,
  WidgetState.hovered: AppColors.blue.shade600,
  WidgetState.focused: AppColors.blue.shade600,
};

final _anyBackground = AppColors.blue;