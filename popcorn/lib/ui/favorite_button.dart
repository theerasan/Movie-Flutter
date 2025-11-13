import 'package:flutter/material.dart';

import 'core/theme/colors.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final Function() onClickFavorite;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onClickFavorite,
  });

  @override
  State<StatefulWidget> createState() {
    return _FavoriteButton();
  }
}

class _FavoriteButton extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onClickFavorite,
      icon: Icon(
        (widget.isFavorite) ? Icons.favorite : Icons.favorite_border_rounded,
        color: AppColors.favColor,
      ),
    );
  }
}
