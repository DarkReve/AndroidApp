import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/todo_model.dart';
import 'package:final_project/services/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateProvider((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance.collection('TodoList')
      .snapshots()
      .map((event) => event.docs
      .map((snapshot) => TodoModel
      .fromSnapshot(snapshot)).toList());
  yield* getData;
});