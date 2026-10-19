import 'package:flutter/material.dart';

class LoginUI extends StatefulWidget {
	const LoginUI({super.key});

	@override
	State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> with SingleTickerProviderStateMixin {
	static const Color _purple = Color(0xFF6D4ACD);
	static const Color _deepPurple = Color(0xFF382568);

	late final AnimationController _animationController;
	late final Animation<double> _fadeAnimation;
	late final Animation<Offset> _slideAnimation;
	bool _obscurePassword = true;
	bool _rememberMe = true;

	@override
	void initState() {
		super.initState();
		_animationController = AnimationController(
			vsync: this,
			duration: const Duration(milliseconds: 850),
		);
		_fadeAnimation = CurvedAnimation(
			parent: _animationController,
			curve: Curves.easeOut,
		);
		_slideAnimation = Tween<Offset>(
			begin: const Offset(0, 0.08),
			end: Offset.zero,
		).animate(CurvedAnimation(
			parent: _animationController,
			curve: Curves.easeOutCubic,
		));
		_animationController.forward();
	}

	@override
	void dispose() {
		_animationController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF6F2FF),
			body: Stack(
				children: [
					const Positioned.fill(
						child: DecoratedBox(
							decoration: BoxDecoration(
								gradient: LinearGradient(
									begin: Alignment.topLeft,
									end: Alignment.bottomRight,
									colors: [
										Color(0xFFFBF9FF),
										Color(0xFFF1EBFF),
										Color(0xFFF8F4FF),
									],
								),
							),
						),
					),
					const Positioned(
						top: -110,
						right: -75,
						child: _DecorativeCircle(size: 280, color: Color(0x55D7C8FF)),
					),
					const Positioned(
						bottom: -145,
						left: -90,
						child: _DecorativeCircle(size: 310, color: Color(0x55CFC1F5)),
					),
					const Positioned(
						top: 190,
						left: -55,
						child: _DecorativeCircle(size: 125, color: Color(0x33E3D7FF)),
					),
					SafeArea(
						child: Center(
							child: SingleChildScrollView(
								padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
								child: FadeTransition(
									opacity: _fadeAnimation,
									child: SlideTransition(
										position: _slideAnimation,
										child: ConstrainedBox(
											constraints: const BoxConstraints(maxWidth: 430),
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.stretch,
												children: [
													Center(
														child: Column(
															mainAxisSize: MainAxisSize.min,
															children: [
																Image.asset(
																	'assets/images/sevima_logo.png',
																	width: 68,
																	height: 68,
																	fit: BoxFit.contain,
																),
																const SizedBox(height: 5),
																const Text(
																	'SEVIMA',
																	style: TextStyle(
																		color: _deepPurple,
																		fontSize: 13,
																		fontWeight: FontWeight.bold,
																		letterSpacing: 1.5,
																	),
																),
															],
														),
													),
													const SizedBox(height: 30),
													const Text(
														'Selamat datang',
														textAlign: TextAlign.center,
														style: TextStyle(
															fontFamily: 'Georgia',
															fontSize: 30,
															fontWeight: FontWeight.bold,
															color: _deepPurple,
															letterSpacing: -0.6,
														),
													),
													const SizedBox(height: 10),
													Text(
														'Masuk untuk melanjutkan ke akun Anda',
														textAlign: TextAlign.center,
														style: TextStyle(
															fontSize: 14,
															color: Colors.blueGrey.shade600,
															height: 1.5,
														),
													),
													const SizedBox(height: 34),
													Container(
														padding: const EdgeInsets.fromLTRB(22, 26, 22, 24),
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(25),
															border: Border.all(color: const Color(0xFFF0EDF7)),
															boxShadow: [
																BoxShadow(
																	color: const Color(0xFF493879).withOpacity(0.08),
																	blurRadius: 30,
																	offset: const Offset(0, 14),
																),
															],
														),
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.stretch,
															children: [
																const _FieldLabel('Email'),
																const SizedBox(height: 9),
																TextField(
																	keyboardType: TextInputType.emailAddress,
																	decoration: _inputDecoration(
																		hint: 'nama@email.com',
																		icon: Icons.mail_outline_rounded,
																	),
																),
																const SizedBox(height: 20),
																const _FieldLabel('Kata sandi'),
																const SizedBox(height: 9),
																TextField(
																	obscureText: _obscurePassword,
																	decoration: _inputDecoration(
																		hint: 'Masukkan kata sandi',
																		icon: Icons.lock_outline_rounded,
																		suffix: IconButton(
																			tooltip: _obscurePassword
																					? 'Tampilkan kata sandi'
																					: 'Sembunyikan kata sandi',
																			onPressed: () => setState(() {
																				_obscurePassword = !_obscurePassword;
																			}),
																			icon: Icon(
																				_obscurePassword
																						? Icons.visibility_off_outlined
																						: Icons.visibility_outlined,
																				color: Colors.blueGrey.shade400,
																				size: 20,
																			),
																		),
																	),
																),
																const SizedBox(height: 10),
																Row(
																	children: [
																		SizedBox(
																			width: 22,
																			height: 22,
																			child: Checkbox(
																				value: _rememberMe,
																				activeColor: _purple,
																				shape: RoundedRectangleBorder(
																					borderRadius: BorderRadius.circular(5),
																				),
																				onChanged: (value) => setState(() {
																					_rememberMe = value ?? false;
																				}),
																			),
																		),
																		const SizedBox(width: 8),
																		Text(
																			'Ingat saya',
																			style: TextStyle(
																				color: Colors.blueGrey.shade700,
																				fontSize: 13,
																			),
																		),
																		const Spacer(),
																		TextButton(
																			onPressed: () {},
																			style: TextButton.styleFrom(
																				foregroundColor: _purple,
																				padding: const EdgeInsets.symmetric(horizontal: 4),
																			),
																			child: const Text(
																				'Lupa kata sandi?',
																				style: TextStyle(
																					fontSize: 12,
																					fontWeight: FontWeight.w600,
																				),
																			),
																		),
																	],
																),
																const SizedBox(height: 20),
																SizedBox(
																	height: 54,
																	child: DecoratedBox(
																		decoration: BoxDecoration(
																			gradient: const LinearGradient(
																				colors: [_purple, Color(0xFF8566DF)],
																			),
																			borderRadius: BorderRadius.circular(15),
																			boxShadow: [
																				BoxShadow(
																					color: _purple.withOpacity(0.25),
																					blurRadius: 16,
																					offset: const Offset(0, 7),
																				),
																			],
																		),
																		child: ElevatedButton(
																			onPressed: () {
																				ScaffoldMessenger.of(context).showSnackBar(
																					const SnackBar(
																						content: Text('Form login siap dihubungkan.'),
																					),
																				);
																			},
																			style: ElevatedButton.styleFrom(
																				backgroundColor: Colors.transparent,
																				shadowColor: Colors.transparent,
																				shape: RoundedRectangleBorder(
																					borderRadius: BorderRadius.circular(15),
																				),
																			),
																			child: const Text(
																				'Masuk',
																				style: TextStyle(
																					color: Colors.white,
																					fontSize: 15,
																					fontWeight: FontWeight.w600,
																					letterSpacing: 0.3,
																				),
																			),
																		),
																	),
																),
																const SizedBox(height: 23),
																Row(
																	children: [
																		Expanded(child: Divider(color: Colors.grey.shade200)),
																		Padding(
																			padding: const EdgeInsets.symmetric(horizontal: 12),
																			child: Text(
																				'ATAU',
																				style: TextStyle(
																					color: Colors.blueGrey.shade400,
																					fontSize: 10,
																					fontWeight: FontWeight.w600,
																					letterSpacing: 1.2,
																				),
																			),
																		),
																		Expanded(child: Divider(color: Colors.grey.shade200)),
																	],
																),
																const SizedBox(height: 20),
																OutlinedButton.icon(
																	onPressed: () {},
																	icon: const Icon(Icons.g_mobiledata_rounded, size: 26),
																	label: const Text('Lanjutkan dengan Google'),
																	style: OutlinedButton.styleFrom(
																		foregroundColor: const Color(0xFF41404A),
																		side: const BorderSide(color: Color(0xFFE9E6F0)),
																		minimumSize: const Size.fromHeight(49),
																		shape: RoundedRectangleBorder(
																			borderRadius: BorderRadius.circular(14),
																		),
																		textStyle: const TextStyle(
																			fontSize: 13,
																			fontWeight: FontWeight.w500,
																		),
																	),
																),
															],
														),
													),
													const SizedBox(height: 24),
													Row(
														mainAxisAlignment: MainAxisAlignment.center,
														children: [
															Text(
																'Belum memiliki akun? ',
																style: TextStyle(color: Colors.blueGrey.shade600, fontSize: 13),
															),
															TextButton(
																onPressed: () {},
																style: TextButton.styleFrom(
																	foregroundColor: _purple,
																	padding: EdgeInsets.zero,
																	minimumSize: Size.zero,
																	tapTargetSize: MaterialTapTargetSize.shrinkWrap,
																),
																child: const Text(
																	'Daftar',
																	style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
																),
															),
														],
													),
												],
											),
										),
									),
								),
							),
						),
					),
				],
			),
		);
	}

	InputDecoration _inputDecoration({
		required String hint,
		required IconData icon,
		Widget? suffix,
	}) {
		return InputDecoration(
			hintText: hint,
			hintStyle: TextStyle(color: Colors.blueGrey.shade300, fontSize: 13),
			prefixIcon: Icon(icon, color: _purple.withOpacity(0.75), size: 20),
			suffixIcon: suffix,
			filled: true,
			fillColor: const Color(0xFFFAF9FC),
			contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
			border: OutlineInputBorder(
				borderRadius: BorderRadius.circular(13),
				borderSide: const BorderSide(color: Color(0xFFECE9F2)),
			),
			enabledBorder: OutlineInputBorder(
				borderRadius: BorderRadius.circular(13),
				borderSide: const BorderSide(color: Color(0xFFECE9F2)),
			),
			focusedBorder: OutlineInputBorder(
				borderRadius: BorderRadius.circular(13),
				borderSide: const BorderSide(color: _purple, width: 1.4),
			),
		);
	}
}

class _FieldLabel extends StatelessWidget {
	const _FieldLabel(this.label);

	final String label;

	@override
	Widget build(BuildContext context) {
		return Text(
			label,
			style: const TextStyle(
				color: Color(0xFF383342),
				fontSize: 13,
				fontWeight: FontWeight.w600,
			),
		);
	}
}

class _DecorativeCircle extends StatelessWidget {
	const _DecorativeCircle({required this.size, required this.color});

	final double size;
	final Color color;

	@override
	Widget build(BuildContext context) {
		return Container(
			width: size,
			height: size,
			decoration: BoxDecoration(color: color, shape: BoxShape.circle),
		);
	}
}
