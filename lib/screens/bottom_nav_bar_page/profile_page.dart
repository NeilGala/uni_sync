import 'package:flutter/material.dart';
import 'package:uni_sync/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _editing = false;

  String _name = 'Neil';
  String _batch = '2025';
  String _branch = 'Computer Engineering';
  String _division = 'A';
  String _roll = '12345';
  String _sap = '987654321';
  String? _photoUrl;

  late final TextEditingController _nameCtrl;
  late final TextEditingController _batchCtrl;
  late final TextEditingController _branchCtrl;
  late final TextEditingController _divisionCtrl;
  late final TextEditingController _rollCtrl;
  late final TextEditingController _sapCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: _name);
    _batchCtrl = TextEditingController(text: _batch);
    _branchCtrl = TextEditingController(text: _branch);
    _divisionCtrl = TextEditingController(text: _division);
    _rollCtrl = TextEditingController(text: _roll);
    _sapCtrl = TextEditingController(text: _sap);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _batchCtrl.dispose();
    _branchCtrl.dispose();
    _divisionCtrl.dispose();
    _rollCtrl.dispose();
    _sapCtrl.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    if (_editing) {
      setState(() {
        _name = _nameCtrl.text;
        _batch = _batchCtrl.text;
        _branch = _branchCtrl.text;
        _division = _divisionCtrl.text;
        _roll = _rollCtrl.text;
        _sap = _sapCtrl.text;
        _editing = false;
      });
    } else {
      setState(() => _editing = true);
    }
  }

  Future<void> _changePhoto() async {
    final controller = TextEditingController(text: _photoUrl);
    final result = await showDialog<String?>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Set photo URL'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'https://...'),
          keyboardType: TextInputType.url,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: const Text('Set'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() => _photoUrl = result);
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            readOnly: !_editing,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              isDense: true,
              filled: !_editing,
              fillColor: !_editing ? Colors.grey.shade100 : null,
            ),
          ),
        ],
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    final first = parts.first.isNotEmpty ? parts.first[0] : '';
    final last = parts.length > 1 && parts.last.isNotEmpty ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _editing ? _changePhoto : null,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade300,
                    foregroundImage:
                        (_photoUrl != null && _photoUrl!.isNotEmpty)
                        ? NetworkImage(_photoUrl!)
                        : null,
                    child: (_photoUrl == null || _photoUrl!.isEmpty)
                        ? Text(
                            _initials(_nameCtrl.text),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.camera_alt, size: 18),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _buildTextField(label: 'Name', controller: _nameCtrl),
            _buildTextField(label: 'Batch', controller: _batchCtrl),
            _buildTextField(label: 'Branch', controller: _branchCtrl),
            _buildTextField(label: 'Division', controller: _divisionCtrl),
            _buildTextField(
              label: 'Roll Number',
              controller: _rollCtrl,
              keyboardType: TextInputType.number,
            ),
            _buildTextField(
              label: 'SAP',
              controller: _sapCtrl,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _toggleEdit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: Text(
                _editing ? 'Save Changes' : 'Edit Profile',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
