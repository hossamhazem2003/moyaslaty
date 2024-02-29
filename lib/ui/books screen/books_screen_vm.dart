
import '../../domain/model/stories_model.dart';

class BoocsScreenVM {
  List<Book> categoryNewList(String txt) {
    return books.where((element) => element.tasneaf == txt).toList();
  }
}
