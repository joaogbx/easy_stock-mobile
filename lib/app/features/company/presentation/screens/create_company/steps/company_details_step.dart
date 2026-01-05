import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

const Color kCardColor = Color(0xFF1E1E1E);

class CompanyDetailsStep extends StatefulWidget {
  final Function(String) onNameChanged;

  const CompanyDetailsStep({
    super.key,
    required this.onNameChanged,
  });

  @override
  State<CompanyDetailsStep> createState() => _CompanyDetailsStepState();
}

class _CompanyDetailsStepState extends State<CompanyDetailsStep> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    widget.onNameChanged(_nameController.text);
  }

  @override
  void dispose() {
    _nameController.removeListener(_handleTextChange);
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),

          Text(
            'Detalhes Essenciais',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: ColorsPallete.primaryPurple,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            'Qual será o nome principal da sua empresa? Ele será o identificador do seu espaço.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 40),

          TextFormField(
            controller: _nameController,

            autofocus: false,
            decoration: InputDecoration(
              labelText: 'Nome da Empresa',

              hintText: 'Ex: EasyStock Logística',

              fillColor: kCardColor,
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
