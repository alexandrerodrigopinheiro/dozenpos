import 'package:dozenpos/app/data/models/ticket_model.dart';
import 'package:dozenpos/app/data/resources/printer_resource.dart';
import 'package:dozenpos/app/utils/utils.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class SalePrint {
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
  final String _key = 'orix';

  void draw(PrinterResource printer, TicketModel ticket) async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    bool normal = printer.printType.name!.compareTo('Normal') == 0;
    _bluetooth.isConnected.then((isConnected) {
      if (isConnected!) {
        _bluetooth.printCustom(ticket.title!.toUpperCase(), normal ? 3 : 1, 1, charset: 'windows-1250');
        _bluetooth.printCustom(ticket.owner!.toUpperCase(), normal ? 3 : 1, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toDateTime(DateTime.now(), link: ' '), 0, 1, charset: 'windows-1250');
        _bluetooth.printNewLine();
        if (printer.containsKey(_key)) {
          _bluetooth.printImage(printer.getImage(_key)!);
        }
        _bluetooth.printCustom('--------------------------------', 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('concurso:', ticket.contest!.toString(), 41), normal ? 1 : 0, 1,charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('bilhete:', ticket.code!.toString(), 40), normal ? 1 : 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('data:', Utils.toDate(ticket.date!), 37), normal ? 1 : 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('hora:', ticket.time!, 37), normal ? 1 : 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('valor:', 'R\$${ticket.value!.toStringAsFixed(2).replaceAll('.', ',')}', 38), normal ? 1 : 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('premio:', 'R\$${ticket.prize!.toStringAsFixed(2).replaceAll('.', ',')}', 39), normal ? 1 : 0, 1, charset: 'windows-1250');
        _bluetooth.printNewLine();
        _bluetooth.printCustom('--------------------------------', 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(ticket.numbers!.toUpperCase().replaceAll(',', ' '), normal ? 3 : 3, 1, charset: 'windows-1250');
        _bluetooth.printNewLine();
        _bluetooth.printCustom('--------------------------------', 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('n:', ticket.name ?? '', 33), normal ? 1 : 0, 1,charset: 'windows-1250');
        _bluetooth.printCustom(Utils.toLine('t:', ticket.phone ?? '', 33), normal ? 1 : 0, 1, charset: 'windows-1250');
        _bluetooth.printNewLine();
        _bluetooth.printCustom('--------------------------------', 0, 1, charset: 'windows-1250');
        _bluetooth.printCustom(ticket.observation!.toUpperCase(), 0, 0, charset: 'windows-1250');
        _bluetooth.printNewLine();
        _bluetooth.printNewLine();
        _bluetooth.printNewLine();
        _bluetooth.printNewLine();
        _bluetooth.printNewLine();
        _bluetooth.printNewLine();
        _bluetooth.paperCut();
      }
    });
  }
}
