import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/RegisterController/registercontroller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final regCntrl = Get.put(RegisterScreenCntrl());
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return GetBuilder<RegisterScreenCntrl>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              keyboardIsOpened
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/dashlogo.png', height: 18),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(height: 12),
              Text(
                "Create an account !",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.grey.shade900),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Text("Your Name",
                            style: GoogleFonts.raleway(
                                color: Colors.grey.shade900,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.nameController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      enableSuggestions: false,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Name can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your Name",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.person,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Company Name",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.compNameController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.sentences,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Company Name can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your Company Name",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.building_2_fill,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Address",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.addressController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.streetAddress,
                      textCapitalization: TextCapitalization.sentences,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Company Address can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your Company Address",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(CupertinoIcons.location,
                            color: Colors.black54, size: 20),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "VAT Number",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.vatNoController,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      enableSuggestions: false,
                      textCapitalization: TextCapitalization.sentences,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "VAT No. can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your VAT No.",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.doc_text_search,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "CR Number",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.crNOController,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: false,
                      enableSuggestions: false,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "CR No. can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your CR No.",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.doc_text_search,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Phone Number",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.phoneNoController,
                      autocorrect: false,
                      enableSuggestions: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Phone No. can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your Phone No.",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.phone,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.emailsController,
                      autocorrect: false,
                      enableSuggestions: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Email can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Please enter your Email",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.at,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.passWController,
                      textInputAction: TextInputAction.next,
                      obscureText: regCntrl.isObscured.value,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      style: GoogleFonts.inter(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Password can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            regCntrl.toggleObscure();
                          },
                          child: Icon(
                              regCntrl.isObscured.value
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash_fill,
                              size: 20,
                              color: Colors.black54),
                        ),
                        hintText: "Please enter your Password",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.lock_open,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Confirm Password",
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: regCntrl.confPassWController,
                      textInputAction: TextInputAction.done,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: regCntrl.isObscuredCon.value,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Email can't be empty";
                      },
                      onChanged: (text) {},
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            regCntrl.toggleObscureConf();
                          },
                          child: Icon(
                              regCntrl.isObscuredCon.value
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash_fill,
                              size: 20,
                              color: Colors.black54),
                        ),
                        hintText: "Please enter Password to confirm",
                        hintStyle: GoogleFonts.raleway(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          CupertinoIcons.lock_open,
                          color: Colors.black54,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffc49a6d),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC9E0FF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: regCntrl.isCreateAccLoadss.value
                          ? null
                          : () {
                              // regCntrl.getRegister(
                              //   firstN: regCntrl.firstNameController.text,
                              //   lastN: regCntrl.lastNameController.text,
                              //   emails: regCntrl.emailsController.text,
                              //   passW: regCntrl.passWController.text,
                              // );
                            },
                      child: Obx(
                        () => regCntrl.isCreateAccLoadss.value
                            ? const LinearProgressIndicator(
                                color: Color(0xffc49a6d),
                              )
                            : Container(
                                width: double.maxFinite,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffd69a54)),
                                child: Material(
                                    type: MaterialType.transparency,
                                    child: Text("Register",
                                        style: GoogleFonts.raleway(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1))),
                              ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: GoogleFonts.raleway(
                                color: Colors.grey.shade900,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text("Log In",
                              style: GoogleFonts.raleway(
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xffc49a6d),
                                  color: const Color(0xffc49a6d),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
