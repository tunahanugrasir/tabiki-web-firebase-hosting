import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../constants/timeline_constants.dart';
import '../providers/timeline_step_view_model.dart';

class TimelineStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String stepNumber;
  final List<Color> gradientColors;
  final String imagePath;
  final bool isLeft;
  final bool isLast;

  const TimelineStep({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.stepNumber,
    required this.gradientColors,
    required this.imagePath,
    required this.isLeft,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimelineStepViewModel(),
      child: Consumer<TimelineStepViewModel>(
        builder: (context, viewModel, _) => MouseRegion(
          onEnter: (_) => viewModel.onHoverChanged(true),
          onExit: (_) => viewModel.onHoverChanged(false),
          child: AnimatedContainer(
            duration: TimelineConstants.animationDuration,
            curve: TimelineConstants.animationCurve,
            margin: const EdgeInsets.only(bottom: 80),
            child: Stack(
              children: [
                if (!isLast) _buildTimelineLine(context, viewModel),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLeft) ...[
                      _buildContent(context, viewModel),
                      SizedBox(width: context.sized.width * 0.05),
                    ],
                    _buildImage(context, viewModel),
                    if (!isLeft) ...[
                      SizedBox(width: context.sized.width * 0.05),
                      _buildContent(context, viewModel),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineLine(BuildContext context, TimelineStepViewModel viewModel) {
    return Positioned(
      left: context.sized.width * 0.4 - 10,
      top: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: TimelineConstants.animationDuration,
        curve: TimelineConstants.animationCurve,
        width: TimelineConstants.timelineWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              gradientColors[1],
              gradientColors[1].withValues(alpha: viewModel.isHovered ? 0.3 : 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, TimelineStepViewModel viewModel) {
    return TweenAnimationBuilder<double>(
      duration: TimelineConstants.animationDuration,
      curve: TimelineConstants.animationCurve,
      tween: Tween<double>(
        begin: TimelineConstants.defaultScale,
        end: viewModel.scaleValue,
      ),
      builder: (context, scale, child) => Transform.scale(
        scale: scale,
        child: Container(
          width: context.sized.width * 0.3,
          height: context.sized.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: gradientColors[1].withValues(alpha: TimelineConstants.defaultShadowOpacity),
                blurRadius: viewModel.isHovered ? TimelineConstants.hoverBlur : TimelineConstants.defaultBlur,
                offset: Offset(0, viewModel.isHovered ? 15 : 10),
                spreadRadius: viewModel.isHovered ? TimelineConstants.hoverSpread : TimelineConstants.defaultSpread,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TimelineStepViewModel viewModel) {
    return TweenAnimationBuilder<double>(
      duration: TimelineConstants.animationDuration,
      curve: TimelineConstants.animationCurve,
      tween: Tween<double>(
        begin: TimelineConstants.defaultScale,
        end: viewModel.scaleValue,
      ),
      builder: (context, scale, child) => Transform.scale(
        scale: scale,
        child: Container(
          width: context.sized.width * 0.3,
          height: context.sized.height * 0.3,
          padding: TimelineConstants.cardPadding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(TimelineConstants.cardBorderRadius),
            boxShadow: [
              BoxShadow(
                color: viewModel.isHovered ? gradientColors[1].withValues(alpha: TimelineConstants.hoverShadowOpacity) : Colors.black.withValues(alpha: TimelineConstants.defaultShadowOpacity),
                blurRadius: viewModel.isHovered ? TimelineConstants.hoverBlur : TimelineConstants.defaultBlur,
                offset: Offset(0, viewModel.isHovered ? 15 : 10),
                spreadRadius: viewModel.isHovered ? TimelineConstants.hoverSpread : TimelineConstants.defaultSpread,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(viewModel),
              SizedBox(height: context.sized.height * 0.02),
              _buildTitle(viewModel, context),
              SizedBox(height: context.sized.height * 0.01),
              _buildDescription(viewModel, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(TimelineStepViewModel viewModel) {
    return Row(
      children: [
        _buildIcon(viewModel),
        const SizedBox(width: 16),
        _buildStepNumber(viewModel),
      ],
    );
  }

  Widget _buildIcon(TimelineStepViewModel viewModel) {
    return TweenAnimationBuilder<double>(
      duration: TimelineConstants.animationDuration,
      curve: TimelineConstants.animationCurve,
      tween: Tween<double>(begin: 0, end: viewModel.rotateValue),
      builder: (context, rotation, _) => Transform.rotate(
        angle: rotation * 2 * pi,
        child: Container(
          padding: TimelineConstants.iconPadding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(TimelineConstants.iconBorderRadius),
            boxShadow: [
              BoxShadow(
                color: gradientColors[1].withValues(alpha: viewModel.isHovered ? 0.3 : 0.2),
                blurRadius: viewModel.isHovered ? 20 : 15,
                offset: const Offset(0, 8),
                spreadRadius: viewModel.isHovered ? 2 : 0,
              ),
            ],
          ),
          child: Icon(
            icon,
            size: TimelineConstants.defaultIconSize + (viewModel.isHovered ? TimelineConstants.hoverIconSizeIncrease : 0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStepNumber(TimelineStepViewModel viewModel) {
    return AnimatedContainer(
      duration: TimelineConstants.animationDuration,
      curve: TimelineConstants.animationCurve,
      padding: EdgeInsets.symmetric(
        horizontal: viewModel.isHovered ? 20 : 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: gradientColors[1].withValues(alpha: viewModel.isHovered ? 0.15 : 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: gradientColors[1].withValues(alpha: viewModel.isHovered ? 0.3 : 0.2),
          width: viewModel.isHovered ? 1.5 : 1,
        ),
      ),
      child: Text(
        "Adım $stepNumber",
        style: GoogleFonts.merriweather(
          color: gradientColors[1],
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTitle(TimelineStepViewModel viewModel, BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: TimelineConstants.animationDuration,
      curve: TimelineConstants.animationCurve,
      style: GoogleFonts.merriweather(
        fontSize: viewModel.isHovered ? TimelineConstants.hoverTitleFontSize : TimelineConstants.titleFontSize,
        fontWeight: FontWeight.bold,
        color: TimelineColors.textColor,
      ),
      child: Text(title, style: GoogleFonts.merriweather(fontSize: context.sized.width * 0.02)),
    );
  }

  Widget _buildDescription(TimelineStepViewModel viewModel, BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: TimelineConstants.animationDuration,
      curve: TimelineConstants.animationCurve,
      style: GoogleFonts.merriweather(
        fontSize: viewModel.isHovered ? TimelineConstants.hoverFontSize : TimelineConstants.defaultFontSize,
        color: TimelineColors.textColor.withValues(alpha: viewModel.isHovered ? TimelineConstants.hoverOpacity : TimelineConstants.defaultOpacity),
        height: 1.6,
      ),
      child: Text(description, style: GoogleFonts.merriweather(fontSize: context.sized.width * 0.01)),
    );
  }
}
