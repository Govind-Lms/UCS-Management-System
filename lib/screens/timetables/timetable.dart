import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class TimetableScreen extends StatefulWidget {
  final String year;
  final String section;
  final String csOrCtorCst;
  const TimetableScreen(
      {super.key,
      required this.year,
      required this.section,
      required this.csOrCtorCst});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  getPDFs() {
    if (widget.year == 'first') {
      if (widget.csOrCtorCst == 'cs') {
        if (widget.section == 'A') {
          return 'assets/pdfs/FirstA.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/FirstB.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/FirstC.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/FirstD.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/FirstE.pdf';
        }
      } else if (widget.csOrCtorCst == 'ct') {
        if (widget.section == 'A') {
          return 'assets/pdfs/FirstA.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/FirstB.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/FirstC.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/FirstD.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/FirstE.pdf';
        }
      } else if (widget.csOrCtorCst == 'cst') {
        if (widget.section == 'A') {
          return 'assets/pdfs/FirstA.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/FirstB.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/FirstC.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/FirstD.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/FirstE.pdf';
        }
      } else {
        return 'assets/pdfs/error.pdf';
      }
    } else if (widget.year == 'second') {
      if (widget.csOrCtorCst == 'cs') {
        if (widget.section == 'A') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/SecondYear.pdf';
        }
      } else if (widget.csOrCtorCst == 'ct') {
        if (widget.section == 'A') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/SecondYear.pdf';
        }
      } else if (widget.csOrCtorCst == 'cst') {
        if (widget.section == 'A') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/SecondYear.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/SecondYear.pdf';
        }
      }
    } else if (widget.year == 'third') {
      if (widget.csOrCtorCst == 'cs') {
        if (widget.section == 'A') {
          return 'assets/pdfs/ThirdYear_cs.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/ThirdYear_cs.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/ThirdYear_cs.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/ThirdYear_cs.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/ThirdYear_cs.pdf';
        }
      } else if (widget.csOrCtorCst == 'ct') {
        if (widget.section == 'A') {
          return 'assets/pdfs/ThirdYear_ct.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/ThirdYear_ct.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/ThirdYear_ct.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/ThirdYear_ct.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/ThirdYear_ct.pdf';
        }
      } else if (widget.csOrCtorCst == 'cst') {
        if (widget.section == 'A') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/error.pdf';
        }
      }
    } else if (widget.year == 'fourth') {
      if (widget.csOrCtorCst == 'cs') {
        if (widget.section == 'A') {
          return 'assets/pdfs/FourthYear_cs.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/FourthYear_cs.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/FourthYear_cs.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/FourthYear_cs.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/FourthYear_cs.pdf';
        }
      } else if (widget.csOrCtorCst == 'ct') {
        if (widget.section == 'A') {
          return 'assets/pdfs/FourthYear_ct.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/FourthYear_ct.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/FourthYear_ct.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/FourthYear_ct.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/FourthYear_ct.pdf';
        }
      } else if (widget.csOrCtorCst == 'cst') {
        if (widget.section == 'A') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'B') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'C') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'D') {
          return 'assets/pdfs/error.pdf';
        } else if (widget.section == 'E') {
          return 'assets/pdfs/error.pdf';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TimeTable'),
      ),
      body: const PDF().fromAsset(getPDFs()),
    );
  }
}
