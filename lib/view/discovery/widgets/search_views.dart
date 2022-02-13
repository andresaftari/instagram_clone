import 'package:flutter/material.dart';
import 'package:instagram_clone/themes/theme_color.dart';
import 'package:instagram_clone/utils/snackbar_util.dart';

class SearchViews extends StatefulWidget {
  const SearchViews({Key? key}) : super(key: key);

  @override
  _SearchViewsState createState() => _SearchViewsState();
}

class _SearchViewsState extends State<SearchViews> {
  final _searchFormKey = GlobalKey<FormState>(debugLabel: 'search');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      transformAlignment: Alignment.center,
      child: Form(
        key: _searchFormKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: TextFormField(
          autofocus: false,
          autocorrect: false,
          enabled: false,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            filled: true,
            fillColor: actionFillColor,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Color.fromRGBO(157, 157, 157, 1),
              fontSize: 14,
              decoration: TextDecoration.none,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromRGBO(219, 219, 219, 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: bgDarkMode),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: bgDarkMode),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: bgDarkMode),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: bgDarkMode),
            ),
          ),
        ),
      ),
    );
  }
}
