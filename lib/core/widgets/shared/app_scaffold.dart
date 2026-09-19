import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';

/// Professional, highly versatile global scaffold for CollabConnect (<95 LOC).
class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool useSafeArea;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool scrollable;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsetsGeometry? padding;
  final double? maxWidth;
  final bool withAmbientGlow;
  final bool? resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;

  const AppScaffold({
    super.key,
    this.body,
    this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.useSafeArea = false,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.scrollable = false,
    this.scrollPhysics,
    this.padding,
    this.maxWidth,
    this.withAmbientGlow = false,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
  }) : assert(body != null || child != null, 'Either body or child must be provided.');

  Widget _buildContent(BuildContext context) {
    Widget content = body ?? child!;
    if (padding != null) content = Padding(padding: padding!, child: content);
    if (maxWidth != null) content = Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: maxWidth!), child: content));
    if (scrollable) content = SingleChildScrollView(physics: scrollPhysics ?? const BouncingScrollPhysics(), child: content);
    if (useSafeArea) content = SafeArea(top: safeAreaTop, bottom: safeAreaBottom, child: content);
    if (withAmbientGlow) {
      content = Stack(
        children: [
          Positioned(
            top: -40,
            left: 35,
            child: Container(
              width: 288,
              height: 288,
              decoration: const BoxDecoration(shape: BoxShape.circle, gradient: AppColors.ambientAuraGradient),
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32), child: const SizedBox.expand()),
            ),
          ),
          content,
        ],
      );
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.scaffoldBackground,
      appBar: appBar,
      body: _buildContent(context),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: drawer,
      endDrawer: endDrawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }
}
