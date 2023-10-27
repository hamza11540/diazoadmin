import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/base/base_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../logger/log.dart';
import '../models/order_model.dart';

enum OrderCategory { pickup, delivery }

enum OrderStatus { cooking, onTheWay, delivered, canceled }

class OrderDetailViewModel extends BaseViewModel {
  int currentIndex = 0;
  void changeCurrentIndex(index) {
    currentIndex = index;
    setState();
  }

  List<OrdersModel> allOrders = [];
  List<OrdersModel> cookingOrder = [];
  List<OrdersModel> onTheWayOrder = [];
  List<OrdersModel> deliveredOrder = [];

  var markers = <Marker>{};

  updateMarkers(Set<Marker> newMarkers) {
    markers = newMarkers;
  }

  getOrdersListFromFirebase() async {
    final collection =
        await FirebaseFirestore.instance.collection('orders').get();
    final orders = collection.docs.map((doc) => doc.data()).toList();
    for (int i = 0; i < orders.length; i++) {
      allOrders.add(OrdersModel.fromJson(orders[i]));
    }
    d('allOrders : $allOrders');
  }

  ///.where('branch', isEqualTo: iPrefHelper.retrieveBranch()['name'].toString())

  listenOrderFromFirebase() {
    d('BRANCH .... ${iPrefHelper.retrieveBranch()['name']}');
    final reference = FirebaseFirestore.instance.collection('orders').where(
        'branch',
        isEqualTo: iPrefHelper.retrieveBranch()[
            'name']) /*.orderBy("dateTime", descending: true)*/;
    reference.snapshots().listen((querySnapshot) {
      allOrders = [];
      final orders = querySnapshot.docs.map((doc) => doc.data()).toList();
      d('orders : $orders');
      for (int i = 0; i < orders.length; i++) {
        allOrders.add(OrdersModel.fromJson(orders[i]));
      }
      d('allOrders : $allOrders');
      setOrders();
    });
  }

  listenAllOrderFromFirebase() {
    // d('BRANCH .... ${iPrefHelper.retrieveBranch()['name']}');
    final reference = FirebaseFirestore.instance
        .collection('orders')
        .orderBy("dateTime", descending: true);
    d('This is reference:::::: $reference');
    reference.snapshots().listen((querySnapshot) {
      allOrders = [];
      final orders = querySnapshot.docs.map((doc) => doc.data()).toList();
      // d('orders : $orders');
      for (int i = 0; i < orders.length; i++) {
        allOrders.add(OrdersModel.fromJson(orders[i]));
      }
      d('allOrders : $allOrders');
      setOrders();
    });
  }

  updateCookingOrders(List<OrdersModel> order) {
    cookingOrder = order;
  }

  updateAllOrders(List<OrdersModel> order) {
    allOrders = order;
  }

  setOrders() async {
    cookingOrder = [];
    onTheWayOrder = [];
    deliveredOrder = [];
    for (int i = 0; i < allOrders.length; i++) {
      d('${allOrders[i].status} =========== ${OrderStatus.cooking.name.toString()}');
      if (allOrders[i].status == OrderStatus.cooking.name.toString()) {
        cookingOrder.add(allOrders[i]);
        d('cookingOrder...... ${cookingOrder.length}');
        if (cookingOrder.last.isViewed == false) {
          playSampleSound();
        }
      }
      if (allOrders[i].status == OrderStatus.onTheWay.name.toString()) {
        onTheWayOrder.add(allOrders[i]);
      }
      if (allOrders[i].status == OrderStatus.delivered.name.toString()) {
        deliveredOrder.add(allOrders[i]);
      }
    }
    d('cookingOrder : $cookingOrder');
    d('onTheWayOrder : $onTheWayOrder');
    d('deliveredOrder : $deliveredOrder');
  }

  void playSampleSound() async {
    AudioPlayer player = AudioPlayer();
    // player.play(AssetSource('audios/order_notification.mp3'));
  }
}
