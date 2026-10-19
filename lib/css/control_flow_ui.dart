import 'package:flutter/material.dart';

class ControlFlowUi extends StatelessWidget {
  const ControlFlowUi({
    required this.hariIni,
    required this.hariKhusus,
    required this.seragam,
    super.key,
  });

  final DateTime hariIni;
  final bool hariKhusus;
  final String seragam;

  static const Color _purple = Color(0xFF7047EB);
  static const Color _ink = Color(0xFF27213D);
  static const Color _muted = Color(0xFF827C94);
  static const Color _canvas = Color(0xFFF7F5FC);

  String _namaHari(int hari) {
    const hariDalamMinggu = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    return hariDalamMinggu[hari - 1];
  }

  String _namaBulan(int bulan) {
    const bulanDalamTahun = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return bulanDalamTahun[bulan - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _canvas,
      appBar: AppBar(
        backgroundColor: _canvas,
        foregroundColor: _ink,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Control Flow',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHero(hariIni),
              const SizedBox(height: 28),
              const Text(
                'Alur keputusan',
                style: TextStyle(
                  color: _ink,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Ikuti kondisi untuk melihat seragam yang dipilih.',
                style: TextStyle(color: _muted, fontSize: 13),
              ),
              const SizedBox(height: 18),
              _buildFlowDiagram(hariKhusus, seragam),
              const SizedBox(height: 18),
              _buildRuleNote(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(DateTime hariIni) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8059F2), Color(0xFF6338D8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: _purple.withValues(alpha: 0.22),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 15),
                SizedBox(width: 6),
                Text(
                  'BELAJAR LOGIKA IF ELSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Seragam hari ini',
            style: TextStyle(
              color: Color(0xFFE9E2FF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            seragam,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              height: 1.2,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_rounded,
                color: Color(0xFFE9E2FF),
                size: 14,
              ),
              const SizedBox(width: 8),
              Text(
                '${_namaHari(hariIni.weekday)}, ${hariIni.day} '
                '${_namaBulan(hariIni.month)} ${hariIni.year}',
                style: const TextStyle(
                  color: Color(0xFFE9E2FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlowDiagram(bool hariKhusus, String seragam) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFECE8F5)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF33245E).withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFFF1EDFF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'MULAI',
              style: TextStyle(
                color: _purple,
                fontWeight: FontWeight.w800,
                fontSize: 11,
                letterSpacing: 1,
              ),
            ),
          ),
          _buildConnector(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F7FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE6DFFF)),
            ),
            child: const Column(
              children: [
                Icon(Icons.help_outline_rounded, color: _purple, size: 21),
                SizedBox(height: 6),
                Text(
                  'Hari ini Senin, Sabtu, atau Minggu?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildBranch(
                  label: 'YA',
                  answer: 'Merah putih',
                  isActive: hariKhusus,
                  accent: const Color(0xFFE76878),
                  icon: Icons.checkroom_rounded,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildBranch(
                  label: 'TIDAK',
                  answer: 'Hitam putih',
                  isActive: !hariKhusus,
                  accent: const Color(0xFF495064),
                  icon: Icons.checkroom_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          _buildConnector(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF9F3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.flag_rounded, color: Color(0xFF31966A), size: 16),
                SizedBox(width: 7),
                Text(
                  'SELESAI',
                  style: TextStyle(
                    color: Color(0xFF27845C),
                    fontSize: 10,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6FC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded, color: _purple, size: 19),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Hasil hari ini: $seragam',
                    style: const TextStyle(
                      color: _ink,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBranch({
    required String label,
    required String answer,
    required bool isActive,
    required Color accent,
    required IconData icon,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: isActive ? accent : const Color(0xFFF2F0F6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : _muted,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 91),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? accent.withValues(alpha: 0.08) : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isActive
                  ? accent.withValues(alpha: 0.42)
                  : const Color(0xFFECE9F1),
              width: isActive ? 1.5 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: accent, size: 21),
              const SizedBox(height: 5),
              Text(
                answer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isActive ? accent : _ink,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (isActive) ...[
                const SizedBox(height: 4),
                const Text(
                  'Pilihan hari ini',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _muted,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnector() {
    return Container(
      width: 2,
      height: 18,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D1EF),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildRuleNote() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E9),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFF4E8C9)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded, color: Color(0xFFC58B24)),
          SizedBox(width: 11),
          Expanded(
            child: Text(
              'Aturannya sederhana: Senin, Sabtu, dan Minggu memakai '
              'seragam merah putih. Selain hari tersebut, gunakan seragam '
              'hitam putih.',
              style: TextStyle(
                color: Color(0xFF66563A),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
