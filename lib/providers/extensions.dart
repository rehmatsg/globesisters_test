import 'dart:math';

import 'package:flutter/material.dart';

extension ListsEntenstion<T> on List<T> {
  T getRandom() {
    int lth = length;
    int random = Random().nextInt(lth);
    return this[random];
  }
  List<String> toStringList() {
    List<String> _list = [];
    for (var item in this) {
      _list.add(item.toString());
    }
    return _list;
  }
}

extension MapExtension<T, V> on Map<T, V> {

  Map<T, V> getRange(int start, int end) {
    Map<T, V> updated = Map<T, V>.from(this);
    updated.removeWhere((key, value) {
      int index = keys.toList().indexOf(key);
      if (index < start || index >= end) {
        return true;
      } else {
        return false;
      }
    });
    return updated;
  }

  Map<String, Object> toStringObject() {
    Map<String, Object> result = {};
    this.forEach((key, value) {
      if (value != null) result[key.toString()] = value;
    });
    return result;
  }

}

extension IntExtension on int {

  int limit({
    required int max
  }) {
    if (this > max) {
      return max;
    } else {
      return this;
    }
  }

  /// Convert large numbers to international format
  /// For example: 1,000,000 will be converted into 1M
  String inInternationalFormat() {
    if (this > 999 && this < 99999) {
      return "${(this / 1000).toStringAsFixed(1)}K";
    } else if (this > 99999 && this < 999999) {
      return "${(this / 1000).toStringAsFixed(0)}K";
    } else if (this > 999999 && this < 999999999) {
      return "${(this / 1000000).toStringAsFixed(1)}M";
    } else if (this > 999999999) {
      return "${(this / 1000000000).toStringAsFixed(1)}B";
    } else {
      return this.toString();
    }
  }

}

extension SizeExtension on Size {

  Map toJSON() {
    return {
      'width': width,
      'height': height
    };
  }

  static Size fromJSON(Map data) {
    return Size(data['width'].toDouble(), data['height'].toDouble());
  }

}

extension StringExtension on String {

  String toTitleCase() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

}