import 'package:gsheets/gsheets.dart';

class GSheetService {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-gs-poc",
  "private_key_id": "6f506def454ffd87431f016e81c6431846558b86",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC1mj04tnyzZGkJ\nYvc5+sFglpSQYVszSYK0fwaPhDe8QyCgUBfokZXZ3Dn+lFxy6dn/fLILUi6vCLb1\n/h/7XNGAY5+fqviZy0Ovz0tqislAu+NR1ruCzrubdPRJuzkAkXusL7UXBGE2HSm1\ns2aexJz6R5Unli1TnxjA/jHiEKU6MaK6n0ZH0VZiREbeI3XWdXi71MbjDRqctQKX\nC4hf7GHzWzLsPQtegvfH54vq2SCBBm9838LcEq5xykam+fEeqxGGHsFPtsyaHwOk\nduAKGSLhQdlyyr6gqwFxW1BMJpIUdqMn1FABHSmb2AGyX0Kwmg+MR9gWQ7LVLhFU\nqKESCcnLAgMBAAECggEADuCg7Vl949BxDnTOHjDd0MTlTOK87vmxvIm/hthlHIY/\nUQLewo3SwfNZyPJslHl2A4k6qNTFwE8tdf+orRYQj70ZoaIHFcpiNC/+VK8kB6qc\n1+KIoBHBqt2s+bFd3R8OC7Ao3MbeE+nVte4JlS40Ugi1PnX+JqCdDYqFmaiVcKvm\nxeG/HJj8oK3P2IMybP/ayYavC8OmZbZfqMioVHKftXXdOO0v4aaAN29yNsiqu/h2\nbKJ1+H83erb/5pIZlFonjKZQjhmaT5NmLhM/cnqNmOoBpnpHXwKCOZc5fJZaaaiI\nsiCGjMdL060AsZjYMMbEYRiszVhYSnCEyVSrgZtN2QKBgQDw+1d81TG5d3jIsVrC\ngRXLmHXEi5hYT34qZOA/0B+3jCvLcZXmg4vTQY9ZnnBJeOqn2n/mRiYd2wI/XTgL\nvZlEA5V7PiP16LGojYel68DMER+DIyKBtRP7hVo3mpTyx/q2wm80VNb91Edl2sQc\nE4o/d+LNtHE82ZkylZK0NuAZtQKBgQDA640py38VbF8KfCvI7HY9Wv4YA+K0N+lk\ng5flSNom5P0FN+E6jtkcIs1p1gXgfWUMAR9R+oW3vQvlpU4eeshIfSec7ISP+TN7\nia68uu4N4uRG70wHpY1VKccQmMhDzFHaDhSK2dEh9WUCtaGlRc6sRxO/wpuY5Uad\nVciwhrqFfwKBgAX6lm8YcwVg+3QvQks1HK9SdwmLVRpLzpuKqS2sIj1RkvyXMtrn\nRJ7XL5FPpwWLpHbJqwaxktyGxIWB8JQJ/jV7yUengQjm3xGJgWYSdVQa0KdWRdLm\nBTrmUhizEyL65zOFm3C28iaWD7dtOBRiP7nXZZ8o7O5Pj8d7gopKGkFJAoGBALzB\n/EWniTlx5nAA3GpkCrCvpivjKV7B0gd5xhYeOOyTYolHioTcHcustaVXNjrXFhYv\nxvBUGZ+URd605gFmiy553ldpB69C2b+HEEQy9hb6J/bLzm0w618nWFGB23iSooei\n/TB6PGhojSOgiX+HFNd1V/ppNAreUkBBHfKycC+LAoGBANByE3MyjK8Be7y+CuvM\nbwbc2Q+Mi918Up7v+bVI235+27F+RDTN6x2HQ+N47sL7OIGmUkHW6wBbiAxucCoN\nUmcgrnWCTfA4BDM7HGhmYNul9SovrK1pFoUkmoZMTEgRaMZDNxbl0Ms8ZUMaCR67\ntBj05Q+SfaOoktwMg2wRVVaw\n-----END PRIVATE KEY-----\n",
  "client_email": "gs-poc@flutter-gs-poc.iam.gserviceaccount.com",
  "client_id": "116725483442332622044",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gs-poc%40flutter-gs-poc.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetId = '1nhQVlzTLrgBiXtkzPr3h0EdfTFyXs5BNtOZXQqg07Ck';
  late GSheets? gsheets = null;
  late Spreadsheet? ss = null;
  late Worksheet? sheet = null;

  GSheetService() {
    initService();
  }

  initService() async {
    if (ss == null || sheet == null) {
      gsheets = GSheets(_credentials);
      ss = await gsheets?.spreadsheet(_spreadsheetId);
      sheet = ss!.worksheetByTitle('Task Tracker')!;
    }
  }

  Future<List<List<String>>> getValues() async {
    await initService();
    return (await sheet!.values.allRows(fromRow: 2)).toList();
  }

  Future<bool> insertRow(List<String> list) async{
    await initService();
    String previousID = (await sheet!.values.lastRow())![0];
    int id = previousID == 'ID' ? 1 : int.parse(previousID) +1 ;
    
    return sheet!.values.appendRow([id.toString(), ...list]);
  }


}
