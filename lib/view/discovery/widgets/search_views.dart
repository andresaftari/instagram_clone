import 'package:flutter/material.dart';
import 'package:instagram_clone/themes/theme_color.dart';

class SearchViews extends StatefulWidget {
  const SearchViews({Key? key}) : super(key: key);

  @override
  _SearchViewsState createState() => _SearchViewsState();
}

class _SearchViewsState extends State<SearchViews> {
  final _searchFormKey = GlobalKey<FormState>(debugLabel: 'search');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _searchFormKey,
      child: TextFormField(
        autofocus: false,
        autocorrect: false,
        scrollPadding: EdgeInsets.all(12),
        decoration: InputDecoration(
          filled: true,
          fillColor: searchFillColor,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromRGBO(157, 157, 157, 1),
            fontSize: 14,
            decoration: TextDecoration.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: bgDarkMode),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: bgDarkMode),
          ),
        ),
      ),
    );
  }
}
