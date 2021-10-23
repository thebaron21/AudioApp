import 'package:test_getx/app/views/screens/home_screen.dart';
import 'package:test_getx/base/bindings/home.dart';
import 'package:test_getx/core/contracts/page.dart';

class BaseHomePage extends Page{
  BaseHomePage() : super(
    name: "/",
    screen: HomeScreen(),
    binding: BaseHomeBindings()
  );

}