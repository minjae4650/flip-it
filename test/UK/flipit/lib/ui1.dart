import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UI1 extends StatefulWidget {
  const UI1({super.key});

  @override
  State<UI1> createState() => _UI1State();
}

class _UI1State extends State<UI1> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _controller_name = TextEditingController();
  TextEditingController _controller_age = TextEditingController();
  TextEditingController _controller_MBTI = TextEditingController();
  bool _hasError = false;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller_MBTI.addListener(() {
      // 입력된 텍스트를 대문자로 변경
      String text = _controller_MBTI.text.toUpperCase();
      _controller_MBTI.value = _controller_MBTI.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.15,
                fit: BoxFit.contain, // 이미지가 컨테이너 안에 맞게 들어감
              ),
              Text(
                "플립-잇에 온 걸 환영해!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "포스티잇 앞면에 보여질 기본 정보야.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // 너비 설정
                height: MediaQuery.of(context).size.height * 0.42, // 높이 설정
                decoration: BoxDecoration(
                  color: Colors.yellow[700], // 노란색 배경
                  borderRadius: BorderRadius.circular(50.0), // 둥근 테두리
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height * 0.06, // 높이 설정
                          child: TextFormField(
                            controller: _controller_name,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "닉네임을 입력해줘!!";
                              }
                              if (value.length < 2) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "닉네임이 너무 짧아!!";
                              }
                              if (value.length > 15) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "닉네임이 너무 길어!!";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "닉네임을 지어줘",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height * 0.06, // 높이 설정
                          child: TextFormField(
                            controller: _controller_age,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "나이를 입력해줘!!";
                              }

                              int? number = int.tryParse(value);
                              if (number == null) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "나이를 입력해줘!!";
                              }
                              if (number < 15 || number > 40) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 나이를 입력해줘!!";
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9\d]')),
                            ],
                            decoration: InputDecoration(
                              hintText: "나이는?",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height * 0.06, // 높이 설정
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "키를 입력해줘!!";
                              }

                              int? number = int.tryParse(value);
                              if (number == null) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "키를 입력해줘!!";
                              }
                              if (number < 100 || number > 280) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 키를 입력해줘!!";
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9\d]')),
                            ],
                            decoration: InputDecoration(
                              hintText: "키는?",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height * 0.06, // 높이 설정
                          child: TextFormField(
                            controller: _controller_MBTI,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "MBTI를 입력해줘!!";
                              }
                              if (value.length < 4 || value.length > 4) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 MBTI를 입력해줘!!";
                              }
                              if (value[0] == 'I' || value[0] == 'E') {
                                if (value[1] == 'N' || value[1] == 'S') {
                                  if (value[2] == 'F' || value[2] == 'T') {
                                    if (value[3] == 'J' || value[3] == 'P') {
                                      return null;
                                    } else {
                                      setState(() {
                                        _hasError = true;
                                      });
                                      return "제대로 MBTI를 입력해줘!!";
                                    }
                                  } else {
                                    setState(() {
                                      _hasError = true;
                                    });
                                    return "제대로 MBTI를 입력해줘!!";
                                  }
                                } else {
                                  setState(() {
                                    _hasError = true;
                                  });
                                  return "제대로 MBTI를 입력해줘!!";
                                }
                              } else {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 MBTI를 입력해줘!!";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z\d]')),
                            ],
                            decoration: InputDecoration(
                              hintText: "MBTI 를 말해줘",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3, // 버튼의 너비
                              height: MediaQuery.of(context).size.height * 0.06, // 버튼의 높이
                              child: customRadio("남자", 0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3, // 버튼의 너비
                              height: MediaQuery.of(context).size.height * 0.06, // 버튼의 높이
                              child: customRadio("여자", 1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // 너비 설정
                height: MediaQuery.of(context).size.height * 0.2, // 높이 설정
                decoration: BoxDecoration(
                  color: Colors.yellow[700], // 노란색 배경
                  borderRadius: BorderRadius.circular(50.0), // 둥근 테두리
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextFormField(
                            enabled: false, // true 하면 수정됨!
                            controller: _controller_name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            SizedBox(
                              width: 70,
                              child: TextField(
                                textAlign: TextAlign.center,
                                enabled: false, // true 하면 수정됨!
                                controller: _controller_age,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                textAlign: TextAlign.center,
                                enabled: false, // true 하면 수정됨!
                                controller: _controller_MBTI,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 340.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF5EFF),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ex. 나 엔팁임",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                Text(
                                    "내 포스트잇이 제일눈에 띄도록\n나를 가장 잘 소개하는 한 줄을 적을거야.",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B2FFE)),
                child: Container(
                  width: 150.0,
                  height: 55.0,
                  child: Center(
                    child: Text(
                      "다음",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    setState(() {
      _hasError = false;
    });

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("저장되었습니다."),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return SizedBox(
      width: 170,
      height: 48,
      child: OutlinedButton(
        onPressed: () => changeIndex(index),
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            side: BorderSide(
                color: selectedIndex == index ? Colors.cyan : Colors.black),
            backgroundColor: Colors.white),
        child: Text(
          txt,
          style: TextStyle(
            color: selectedIndex == index ? Colors.cyan : Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
