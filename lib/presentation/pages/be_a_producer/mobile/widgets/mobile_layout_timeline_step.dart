import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/desktop/constants/timeline_constants.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/desktop/providers/timeline_step_view_model.dart';


class MobileTimelineStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String stepNumber;
  final List<Color> gradientColors;
  final String imagePath;
  final bool isLeft;
  final bool isLast;

  const MobileTimelineStep({
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
        builder: (context, viewModel, _) => Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              _buildImage(context, viewModel),
              const SizedBox(height: 16),
              _buildContent(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TimelineStepViewModel viewModel) {
    return Container(
      width: context.sized.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(viewModel),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.merriweather(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: TimelineColors.textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.merriweather(
              fontSize: 14,
              color: TimelineColors.textColor.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, TimelineStepViewModel viewModel) {
    return Container(
      width: context.sized.width * 0.9,
      height: context.sized.width * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientColors[1].withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
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
                color: gradientColors[1].withOpacity(viewModel.isHovered ? 0.3 : 0.2),
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
        color: gradientColors[1].withOpacity(viewModel.isHovered ? 0.15 : 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: gradientColors[1].withOpacity(viewModel.isHovered ? 0.3 : 0.2),
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
}
