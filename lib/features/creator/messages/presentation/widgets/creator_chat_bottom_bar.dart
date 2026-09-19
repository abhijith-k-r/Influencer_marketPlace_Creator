import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../../bloc/creator_chat_input_cubit.dart';

/// Bottom bar for creator chat thread supporting Cubit integration (<80 LOC).
class CreatorChatBottomBar extends StatelessWidget {
  final VoidCallback onSend;
  final VoidCallback? onAttach;

  const CreatorChatBottomBar({
    super.key,
    required this.onSend,
    this.onAttach,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorChatInputCubit, String>(
      builder: (context, inputText) {
        final controller = TextEditingController(text: inputText)
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: inputText.length),
          );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: CreatorColors.surfaceContainerLowest,
            border: Border(top: BorderSide(color: Color(0x1A000000), width: 1)),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline_rounded, size: 24),
                  color: CreatorColors.primary,
                  onPressed: onAttach,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: const BoxDecoration(
                      color: CreatorColors.surfaceContainerLow,
                      borderRadius: AppRadii.roundedFull,
                    ),
                    child: TextField(
                      controller: controller,
                      onChanged: (val) => context.read<CreatorChatInputCubit>().setInput(val),
                      decoration: InputDecoration(
                        hintText: 'Message or submit deliverable link...',
                        hintStyle: AppTextStyles.bodySm(color: CreatorColors.outline),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    color: CreatorColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send_rounded, size: 18, color: Colors.white),
                    onPressed: onSend,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
