import 'dart:convert';
import 'dart:io';

import 'package:crclib/crclib.dart';

import '../utils.dart';

String snakeToCamelCase(String name) {
  final result = name.replaceAllMapped(new RegExp(r'(?:^|_)([a-z])'), (g) => g.group(1).toUpperCase());
  return result.replaceAll(new RegExp(r'_'), '');
}

variableSnakeToCamelCase(String str) {
  var s = str.replaceAllMapped(new RegExp(r'([-_][a-z])'), (group) => group.group(0).toUpperCase().replaceAll('-', '').replaceAll('_', ''));
  if (["final","default"].contains(s)) {
    s += "Var";
  }
  return s;
}

void main() {
  print(snakeToCamelCase("this_game_is_fuun"));
}

final CORE_TYPES = [
  0xbc799737, // boolFalse#bc799737 = Bool;
  0x997275b5, // boolTrue#997275b5 = Bool;
  0x3fedd339, // true#3fedd339 = True;
  0xc4b9f9bb, // error#c4b9f9bb code:int text:string = Error;
  0x56730bcc // null#56730bcc = Null;
];
final AUTH_KEY_TYPES = [
  0x05162463, // resPQ,
  0x83c95aec, // p_q_inner_data
  0xa9f55f95, // p_q_inner_data_dc
  0x3c6a84d4, // p_q_inner_data_temp
  0x56fddf88, // p_q_inner_data_temp_dc
  0xd0e8075c, // server_DH_params_ok
  0xb5890dba, // server_DH_inner_data
  0x6643b654, // client_DH_inner_data
  0xd712e4be, // req_DH_params
  0xf5045f1f, // set_client_DH_params
  0x3072cfa1 // gzip_packed
];

fromLine(String line, bool isFunction) {
  var matches = new RegExp(r'([\w.]+)(?:#([0-9a-fA-F]+))?(?:\s{?\w+:[\w\d<>#.?!]+}?)*\s=\s([\w\d<>#.?]+);$').allMatches(line);
  if (matches.length == 0) {
// Probably "vector#1cb5c415 {t:Type} # [ t ] = Vector t;"
    throw ('Cannot parse TLObject ${line}');
  }
  final match = matches.first;
  final reg = new RegExp(r'({)?(\w+):([\w\d<>#.?!]+)}?');
  final argsMatch = reg.allMatches(line);

  final currentConfig = <String, dynamic>{
    'name': match[1],
    'constructorId': match[2] != null ? int.parse(match[2], radix: 16) : null,
    'argsConfig': new Map<String, dynamic>(),
    'subclassOfId': Crc32Zlib().convert(utf8.encode(match.group(3))),
    'result': match.group(3),
    'isFunction': isFunction,
    'namespace': null
  };

  if (currentConfig['constructorId'] == null) {
    var hexId = '';
    var args;

    if (currentConfig['argsConfig'].length > 0) {
      args = '${currentConfig['argsConfig'].keys.map((arg) => arg.toString()).join(' ')}';
    } else {
      args = '';
    }

    final representation = '${currentConfig['name']}${hexId}${args} = ${currentConfig['result']}'
        .replaceAllMapped(new RegExp(r'([:?])bytes'), (match) => match.group(0) + 'string')
        .replaceAll('<', ' ')
        .replaceAll(new RegExp(r'[>{}]'), '')
        .replaceAll(new RegExp(r'\w+:flags\.\d+\?true'), '');

    if (currentConfig['name'] == 'inputMediaInvoice') {
      if (currentConfig['name'] == 'inputMediaInvoice') {}
    }

    currentConfig['constructorId'] = Crc32Zlib().convert(utf8.encode(representation));
  }

  argsMatch.forEach((element) {
    var brace = element[1];
    var name = element[2];
    var argType = element[3];

    if (brace == null) {
      currentConfig['argsConfig'][variableSnakeToCamelCase(name)] = buildArgConfig(name, argType);
    }
  });

  if (currentConfig['name'].contains('.')) {
    final res = new RegExp(r'(.+)\.(.+)').allMatches(currentConfig['name']).first;
    currentConfig['namespace'] = res.group(1);
    currentConfig['name'] = res.group(2);
  }
  currentConfig['name'] = snakeToCamelCase(currentConfig['name']);
  /*
    for (final arg in currentConfig.argsConfig){
      if (currentConfig.argsConfig.hasOwnProperty(arg)){
        if (currentConfig.argsConfig[arg].flagIndicator){
          delete  currentConfig.argsConfig[arg]
        }
      }
    }*/
  return currentConfig;
}

List<int> serializeBytes(data) {
  if (!(data is List<int>)) {
    if (data is String) {
      data = utf8.decode(data);
    } else {
      throw ("Bytes or str expected, not ${data.constructor.name}");
    }
  }
  final r = [];
  int padding;
  if (data.length < 254) {
    padding = (data.length + 1) % 4;
    if (padding != 0) {
      padding = 4 - padding;
    }
    r.add([data.length]);
    r.add(data);
  } else {
    padding = data.length % 4;
    if (padding != 0) {
      padding = 4 - padding;
    }
    r.add([254, data.length % 256 + (data.length >> 8) % 256 + (data.length >> 16) % 256]);
    r.add(data);
  }
  final s = new List(padding);
  s.fillRange(0, padding, 0);
  r.add(s);

  return r.expand((element) => element).toList();
}

serializeDate(dt) {
  if (dt == null) {
    return new List.filled(4, 0);
  }
  if (dt is DateTime) {
    dt = ((DateTime.now().millisecondsSinceEpoch - dt.millisecondsSinceEpoch) / 1000);
  }
  if (dt is int) {
    final t = readBufferFromBigInt(dt, 4, signed: true);
    return t;
  }
  throw ('Cannot interpret "${dt}" as a date');
}

buildArgConfig(name, String argType) {
  name = name == 'self' ? 'is_self' : name;
  // Default values
  final currentConfig = {
    'isVector': false,
    'isFlag': false,
    'skipConstructorId': false,
    'flagIndex': -1,
    'flagIndicator': true,
    'type': null,
    'useVectorId': null
  };

  // Special case: some types can be inferred, which makes it
  // less annoying to type. Currently the only type that can
  // be inferred is if the name is 'random_id', to which a
  // random ID will be assigned if left as None (the default)
  var canBeInferred = name == 'random_id';

  // The type can be an indicator that other arguments will be flags
  if (argType != '#') {
    currentConfig['flagIndicator'] = false;
    // Strip the exclamation mark always to have only the name
    currentConfig['type'] = argType.replaceAll(new RegExp(r'^!+'), '');

    // The type may be a flag (flags.IDX?REAL_TYPE)
    // Note that 'flags' is NOT the flags name; this
    // is determined by a previous argument
    // However, we assume that the argument will always be called 'flags'
    // @ts-ignore
    final flagMatch = new RegExp(r'flags.(\d+)\?([\w<>.]+)').allMatches(currentConfig['type']).toList();

    if (flagMatch.length > 0) {
      currentConfig['isFlag'] = true;
      currentConfig['flagIndex'] = int.parse(flagMatch[0].group(1));
      // Update the type to match the exact type, not the "flagged" one
      currentConfig['type'] = flagMatch[0].group(2);
    }

    // Then check if the type is a Vector<REAL_TYPE>
    final vectorMatch = new RegExp(r'[Vv]ector<([\w\d.]+)>').allMatches(currentConfig['type']).toList();

    if (vectorMatch.length > 0) {
      currentConfig['isVector'] = true;
      // If the type's first letter is not uppercase, then
      // it is a constructor and we use (read/write) its ID.

      currentConfig['useVectorId'] = currentConfig['type'].toString().startsWith('V');

      // Update the type to match the one inside the vector
      currentConfig['type'] = vectorMatch[0].group(1);
    }

    // See use_vector_id. An example of such case is ipPort in
    // help.configSpecial
    // @ts-ignore
    if (new RegExp(r'^[a-z]$').hasMatch(currentConfig['type'].toString().split('.').removeLast().substring(0, 1))) {
      currentConfig['skipConstructorId'] = true;
    }

    // The name may contain "date" in it, if this is the case and
    // the type is "int", we can safely assume that this should be
    // treated as a "date" object. Note that this is not a valid
    // Telegram object, but it's easier to work with
    // if (
    //     this.type === 'int' &&
    //     (/(\b|_)([dr]ate|until|since)(\b|_)/.test(name) ||
    //         ['expires', 'expires_at', 'was_online'].includes(name))
    // ) {
    //     this.type = 'date';
    // }
  }
  return currentConfig;
}

parseTl(content, layer, {methods: null, List<int> ignoreIds: null}) sync* {
  methods ??= [];
  ignoreIds ??= CORE_TYPES;
  /*final methodInfo = (methods ?? []).reduce(
      (o, m) => ({
            ...o,
            [m.name]: m
          }),
      {});*/
  final objAll = [];
  final objByName = {};
  final objByType = {};

  final String file = content;

  var isFunction = false;

  for (var line in file.split('\n')) {
    final commentIndex = line.indexOf('//');

    if (commentIndex != -1) {
      line = line.substring(0, commentIndex);
    }

    line = line.trim();

    if (line == "") {
      continue;
    }

    final match = new RegExp(r'---(\w+)---').allMatches(line);

    if (match.length > 0) {
      //print(match.first.group(1));
      final followingTypes = match.first.group(1);
      isFunction = followingTypes == 'functions';
      continue;
    }

    try {
      final Map<String, dynamic> result = fromLine(line, isFunction);

      if (ignoreIds.contains(result['constructorId'])) {
        continue;
      }

      objAll.add(result);

      if (!result['isFunction']) {
        if (!objByType.containsKey([result['result']])) {
          objByType[result['result']] = [];
        }

        objByName[result['name']] = result;
        objByType[result['result']].add(result);
      }
    } catch (e, stacktrace) {
      if (!e.toString().contains('vector#1cb5c415')) {
        print(stacktrace);
        throw e;
      }
    }
  }

// Once all objects have been parsed, replace the
// string type from the arguments with references
  for (var obj in objAll) {
//console.log(obj)
    if (AUTH_KEY_TYPES.contains(obj['constructorId'])) {
      for (final arg in obj['argsConfig'].keys) {
        if (obj['argsConfig'][arg]['type'] == 'string') {
          obj['argsConfig'][arg]['type'] = 'bytes';
        }
      }
    }
  }
  for (final obj in objAll) {
    yield obj;
  }
}
