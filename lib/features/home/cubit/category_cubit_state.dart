
import 'package:scot/features/home/models/category_model.dart';

abstract class CategoryCubitState {
  const CategoryCubitState();
}

// ignore: camel_case_types
class categoryinitial extends CategoryCubitState {
  const categoryinitial();
}

class CategoryLoading extends CategoryCubitState {
   CategoryLoading();
}

class CategoryError extends CategoryCubitState {
  final String message;
  const CategoryError(this.message);
}

class CategoryLoaded extends CategoryCubitState {
  final List<CategoryModel> categorise;
  const CategoryLoaded(this.categorise);
}
