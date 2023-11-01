// todo: remove this once you have real data
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';

class SellGridItemData {
  final String title;

  final String imagePath;
  final String valueUnit;
  final SellGridKPIs kpi;

  const SellGridItemData({
    required this.title,
    required this.imagePath,
    required this.valueUnit,
    required this.kpi,
  });
}
