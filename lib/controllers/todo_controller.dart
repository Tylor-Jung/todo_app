import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// GetxController 로 firestore 다루기
// addTodo(String task, bool done) 여기서 firestore에 들어가는 변수값의 타입 결정

class TodoController extends GetxController {
  Future<void> addTodo(String task, bool done) async {
    await FirebaseFirestore.instance.collection('todos').doc().set(
      {
        'task': task,
        'isDone': done,
      },
      SetOptions(merge: true),
      // Firesbase에서 .set은 새로운 값을 만들고 merge 할 수 있음
      // 이것이 .add와의 차이점
    ).then(
      (value) => Get.back(),
    );
  }
}
