import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class ErrorView extends StatelessWidget {
  ErrorView({
    super.key,
    this.containerHeight,
    this.messageTitle,
    this.messageDesc,
    this.errorCTA,
    this.errorIcon,
    this.titleColor,
    this.descriptionColor,
    this.bgColor,
    this.onErrorCTAClicked,
  });

  final double? containerHeight;
  final String? messageTitle;
  final String? messageDesc;
  final String? errorCTA;
  final IconData? errorIcon;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? bgColor;
  final VoidCallback? onErrorCTAClicked;

  final INetworkInfoProvider _networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(AppValues.marginDouble),
        padding: const EdgeInsets.all(
            AppValues.paddingDouble + AppValues.paddingDefault),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.radiusDefault),
          color: bgColor ?? Colors.black.withOpacity(0.03),
        ),
        height: containerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                _networkController.isNetworkConnected.value
                    ? messageTitle ?? S.of(context).errorTitle
                    : S.of(context).errorTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: titleColor)),
            const SizedBox(height: AppValues.paddingMini),
            Text(
              _networkController.isNetworkConnected.value
                  ? messageDesc ?? ''
                  : S.of(context).noNetworkMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: descriptionColor ?? Theme.of(context).disabledColor),
            ),
            const SizedBox(height: AppValues.paddingDouble),
            if (onErrorCTAClicked != null)
              ElevatedButton.icon(
                onPressed: onErrorCTAClicked,
                label: Text(
                  errorCTA ?? S.of(context).retry,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.white),
                ),
                icon: Icon(
                  errorIcon ?? Icons.refresh,
                  size: AppValues.iconSizeDefault,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
