// ignore_for_file: prefer_generic_function_type_aliases

import 'package:wallet/views/page_one.dart';
import 'package:wallet/views/page_three.dart';
import 'package:wallet/views/page_two.dart';
import 'package:wallet/views/widget/drawer.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => const MainPage());
    register<PageOne>(() => PageOne());
    register<PageTwo>(() => PageTwo());
    register<PageThree>(() => PageThree());
  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}
