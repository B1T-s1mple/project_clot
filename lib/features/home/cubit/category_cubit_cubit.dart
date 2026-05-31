import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/home/cubit/category_cubit_state.dart';
import 'package:scot/features/home/repo/category_repo.dart';

class CategoryCubitCubit extends Cubit<CategoryCubitState> {
  final CategoryRepo repo;
  CategoryCubitCubit({required this.repo}) : super(const Categoryinitial());
Future<void> getProducts() async {
  emit(CategoryLoading());

  try {
    final category = await repo.getcategory();

    emit(CategoryLoaded(category)); 
  } catch (e) {
    emit(CategoryError(e.toString()));
  }
}
}
