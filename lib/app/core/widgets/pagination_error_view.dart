import 'package:flutter/material.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class PaginationErrorView extends StatelessWidget {
  const PaginationErrorView({Key? key, this.errorTitle, this.onTap})
      : super(key: key);

  final String? errorTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppValues.marginDouble),
      padding: const EdgeInsets.all(AppValues.paddingDouble),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorTitle ?? S.of(context).fetchingDataError,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: onTap,
            label: Text(
              S.of(context).retry,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.white),
            ),
            icon: const Icon(
              Icons.refresh,
              size: AppValues.iconSizeDefault,
            ),
          )
        ],
      ),
    );
  }
}
