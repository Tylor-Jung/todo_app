import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/task_model.dart';
// GetxController 로 firestore 다루기
// addTodo(String task, bool done) 여기서 firestore에 들어가는 변수값의 타입 결정

class TodoController extends GetxController {
  // Firesstore 값 읽기위한 변수 생성
  var isLoading = false;
  var taskList = <TaskModel>[];

  // Firestore 값 저장
  Future<void> addTodo(String task, bool done, String id) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(id != '' ? id : null)
        .set(
      {
        'task': task,
        'isDone': done,
      },
      SetOptions(merge: true),
      // Firesbase에서 .set은 새로운 값을 만들고 merge 할 수 있음
      // 이것이 .add와의 차이점
    ).then(
      (value) => getData(),
    );
  }

  // Firebase 값 읽기 명령 (try catch 구조)
  Future<void> getData() async {
    try {
      QuerySnapshot _taskSnap = await FirebaseFirestore.instance
          .collection('todos')
          .orderBy('task')
          .get();
      taskList.clear(); // clear 안하면 계속 값을 불러옴

      // Firesbase 에서 읽은 값을 앱상에 저장
      for (var item in _taskSnap.docs) {
        taskList.add(
          TaskModel(
            item['task'],
            item['isDone'],
            item.id,
          ),
        );
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteTask(String id) {
    FirebaseFirestore.instance.collection('todos').doc(id).delete();
  }
}
