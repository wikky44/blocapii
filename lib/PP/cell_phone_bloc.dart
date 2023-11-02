import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Model/Cell_Api.dart';
import '../Model/Products.dart';

part 'cell_phone_event.dart';
part 'cell_phone_state.dart';

class CellPhoneBloc extends Bloc<CellPhoneEvent, CellPhoneState> {
  CellApi api=CellApi();
  CellPhoneBloc() : super(CellPhoneInitial(plist: [])) {
    on<Fetch>((event, emit) async {
     var list=await api.getproducts();
     emit(CellPhoneState(plist: list));
    });
  }
}
