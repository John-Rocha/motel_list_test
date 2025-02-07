import 'package:motel_list_test/data/models/discount_model.dart';
import 'package:motel_list_test/data/models/period_entity.dart';

sealed class PeriodModel {
  static PeriodEntity fromJson(Map<String, dynamic> json) {
    return PeriodEntity(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: json['valor'],
      valorTotal: json['valorTotal'],
      temCortesia: json['temCortesia'],
      desconto: (json['desconto'] != null)
          ? DiscountModel.fromJson(json['desconto'])
          : null,
    );
  }
}
