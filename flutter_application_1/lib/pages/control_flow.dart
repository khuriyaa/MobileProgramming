import 'package:flutter/material.dart';
import 'package:flutter_application_1/css/control_flow_ui.dart';

class ControlFlowPage extends StatelessWidget {
  const ControlFlowPage({super.key});

  String _seragamUntukHari(int hari) {
    if (hari == DateTime.saturday ||
        hari == DateTime.sunday ||
        hari == DateTime.monday) {
      return 'Seragam merah putih';
    } else {
      return 'Seragam hitam putih';
    }
  }

  @override
  Widget build(BuildContext context) {
    final hariIni = DateTime.now();
    final hariKhusus = hariIni.weekday == DateTime.monday ||
        hariIni.weekday == DateTime.saturday ||
        hariIni.weekday == DateTime.sunday;
    final seragam = _seragamUntukHari(hariIni.weekday);

    return ControlFlowUi(
      hariIni: hariIni,
      hariKhusus: hariKhusus,
      seragam: seragam,
    );
  }
}
