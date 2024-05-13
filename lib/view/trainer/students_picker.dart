import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:permission_handler/permission_handler.dart';

class StudentPicker extends StatefulWidget {
  static const route = '/batch/add-student-contact';
  const StudentPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentPicker> createState() => _StudentPickerState();
}

class _StudentPickerState extends State<StudentPicker> {
  PermissionStatus? permission;
  List<Contact>? contacts = [];
  List<Contact>? backUpContacts = [];
  List<Contact>? filteredData = [];
  @override
  void initState() {
    super.initState();
    context.read<BatchCubit>().selectedContactList.clear();
    _askPermissions();
  }

  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    permission = permissionStatus;
    setState(() {});
    if (permission == PermissionStatus.granted) {
      contacts = await FastContacts.getAllContacts();
      backUpContacts = await FastContacts.getAllContacts();
    }
    setState(() {});
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  bool isInteger(String str) {
    int? parsedInt = int.tryParse(str);
    return parsedInt != null;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    return BlocConsumer<BatchCubit, BatchState>(
      listener: (context, state) {
        if (state is ContactAdded || state is ContactRemoved) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CommonBar(
            title:
                'Select Students ( ${cubit.selectedContactList.length} selected )',
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Button(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'Add',
            ),
          ),
          body: Column(
            children: [
              CommonField(
                title: 'Search',
                hint: 'Search Student',
                onChange: (value) {
                  if (isInteger(value.toString())) {
                    backUpContacts?.forEach((contact) {
                      for (var phone in contact.phones) {
                        if (phone.number.contains(value)) {
                          filteredData?.add(contact);
                        }
                      }
                    });
                    contacts?.clear();
                    contacts?.addAll(filteredData ?? []);
                    filteredData?.clear();
                    setState(() {});
                  } else {
                    backUpContacts?.forEach((contact) {
                      if (contact.displayName
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        filteredData?.add(contact);
                      }
                    });
                    contacts?.clear();
                    contacts?.addAll(filteredData ?? []);
                    filteredData?.clear();
                    setState(() {});
                  }
                },
                prefixIcon: const Icon(Icons.search),
                textInputAction: TextInputAction.search,
              ),
              Expanded(
                child: permission == PermissionStatus.granted
                    ? (contacts ?? []).isEmpty
                        ? const LoadingView()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: contacts?.length,
                            itemBuilder: (context, index) {
                              Contact contact = (contacts ?? [])[index];
                              return GestureDetector(
                                onTap: () {
                                  if (cubit.checkContactSelected(contact)) {
                                    cubit.removeContact(contact);
                                  } else {
                                    cubit.addContact(contact);
                                  }
                                },
                                child: Container(
                                  height: 70.h,
                                  margin: EdgeInsets.all(10.h),
                                  padding:
                                      EdgeInsets.only(left: 10.h, right: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.hintColor.withOpacity(0.5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 300.w,
                                            child: Text(
                                              contact.displayName,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(fontSize: 16),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            '( ${contact.phones.first.number} )',
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 12,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      if (cubit.checkContactSelected(contact))
                                        Icon(
                                          Icons.check,
                                          color: AppColors.green,
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                    : const Center(
                        child: Text('Contact Permission Not granted'),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
