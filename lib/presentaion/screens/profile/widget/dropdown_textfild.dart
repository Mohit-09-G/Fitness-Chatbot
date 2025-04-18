import 'package:fitnessbot/config/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownTextfild extends StatefulWidget {
  final TextEditingController? controller;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final List<String> items;
  final void Function(String)? onItemSelected;

  const DropdownTextfild({
    super.key,
    this.controller,
    this.enabled = true,
    this.prefix,
    this.suffix,
    required this.hint,
    required this.items,
    this.onItemSelected,
  });

  @override
  State<DropdownTextfild> createState() => _DropdownTextfildState();
}

class _DropdownTextfildState extends State<DropdownTextfild> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _key = GlobalKey();

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 4),
          child: Material(
            color: Colors.white,
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      widget.controller?.text = item;
                      widget.onItemSelected?.call(item);
                      _removeDropdown();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        key: _key,
        controller: widget.controller,
        enabled: widget.enabled,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefix,
          suffixIcon: GestureDetector(
            onTap: _toggleDropdown,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.blueColor,
            ),
          ),
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          disabledBorder: _buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffB0B3C7), width: 1),
      borderRadius: BorderRadius.circular(23),
    );
  }
}
