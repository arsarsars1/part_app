import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:permission_handler/permission_handler.dart';

class StudentPicker extends StatefulWidget {
  static const route = '/batch/add-student-contact';
  const StudentPicker({Key? key}) : super(key: key);

  @override
  State<StudentPicker> createState() => _StudentPickerState();
}

class _StudentPickerState extends State<StudentPicker> {
  AuthCubit? authCubit;
  bool isLoading = true;
  PermissionStatus? permission;
  List<Contact>? contacts = [];
  List<Contact>? backUpContacts = [];
  List<Contact>? selectedContacts = [];
  List<Contact>? filteredData = [];
  bool isTrainer = false;
  late BatchCubit cubit;
  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    Future.microtask(() async {
      setState(() => isLoading = true);
      try {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map;
        isTrainer = arguments['isTrainer'];
      } catch (e) {
        isTrainer = false;
      }
      setState(() => isLoading = false);
      context.read<BatchCubit>().selectedContactList.clear();
      await _askPermissions();
    });
  }

  Future<void> _askPermissions() async {
    setState(() => isLoading = true);
    PermissionStatus permissionStatus = await _getContactPermission();
    permission = permissionStatus;
    setState(() {});
    if (permission == PermissionStatus.granted) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withAccounts: true);
      backUpContacts = await FlutterContacts.getContacts(
          withProperties: true, withAccounts: true);
    }
    contacts?.removeWhere((element) => element.phones.isEmpty);
    backUpContacts?.removeWhere((element) => element.phones.isEmpty);
    setState(() => isLoading = false);
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
            title: 'Select Students ( ${selectedContacts?.length} selected )',
          ),
          bottomNavigationBar: isLoading
              ? const SizedBox.shrink()
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                  child: Button(
                    onTap: () {
                      if (cubit.isFromBatchDetail) {
                        selectedContacts?.forEach((element) {
                          cubit.addContact(element);
                        });
                        BatchRequest request;
                        request = BatchRequest(
                          students: cubit.buildStudentList(),
                        );
                        if (isTrainer) {
                          cubit.updateTrainerStudents(request,
                              isTrainer: isTrainer,
                              trainerDetailId: authCubit
                                      ?.user
                                      ?.trainerDetail?[
                                          authCubit?.trainerIndex ?? 0]
                                      .id ??
                                  0);
                        } else {
                          cubit.updateBatch(request);
                        }
                        Navigator.pop(context);
                      } else {
                        selectedContacts?.forEach((element) {
                          cubit.addContact(element);
                        });
                        Navigator.pop(context);
                      }
                    },
                    disable: (selectedContacts ?? []).isEmpty,
                    title: 'Add',
                  ),
                ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
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
                    if ((selectedContacts ?? []).isNotEmpty)
                      Container(
                        margin: EdgeInsets.all(15.w),
                        height: 25.h,
                        child: Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: selectedContacts?.length,
                            itemBuilder: (context, index) {
                              Contact contact = (selectedContacts ?? [])[index];
                              return GestureDetector(
                                onTap: () {
                                  selectedContacts?.remove(contact);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20.h,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  padding:
                                      EdgeInsets.only(left: 5.h, right: 5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.hintColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          contact.displayName,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(fontSize: 12.sp),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.close,
                                        size: 15.sp,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    Expanded(
                      child: permission == PermissionStatus.granted
                          ? (contacts ?? []).isEmpty
                              ? (filteredData ?? []).isEmpty
                                  ? const Center(
                                      child: Text('No contacts found'),
                                    )
                                  : const LoadingView()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: contacts?.length,
                                  itemBuilder: (context, index) {
                                    Contact contact = (contacts ?? [])[index];
                                    return GestureDetector(
                                      onTap: () {
                                        if (contact.phones.isEmpty) {
                                          Alert(context).show(
                                              message:
                                                  'No Phone Number Added for this contact !!');
                                        } else {
                                          if (checkContactSelected(contact)) {
                                            selectedContacts?.remove(contact);
                                          } else {
                                            selectedContacts?.add(contact);
                                          }
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: UIConstants.buttonHeight,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        padding: EdgeInsets.only(
                                            left: 10.h, right: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 250.w,
                                              child: Text(
                                                contact.displayName,
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(fontSize: 16),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            checkContactSelected(contact)
                                                ? Container(
                                                    width: 20.w,
                                                    height: 20.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 2.0),
                                                    ),
                                                    child: Container(
                                                      width: 5.w,
                                                      height: 5.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 20.w,
                                                    height: 20.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 2.0),
                                                    ),
                                                  ),
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

  bool checkContactSelected(Contact contact) {
    bool flag = false;
    for (Contact element in (selectedContacts ?? [])) {
      if (element.phones.first.number == contact.phones.first.number) {
        flag = true;
      }
    }
    return flag;
  }
}
