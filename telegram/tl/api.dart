import 'class_writer.dart';
import 'generation_helpers.dart';
import 'dart:io';
import '../utils.dart';

buildApiFromTlSchema() {
  var definitions;
  definitions = loadFromTlSchemas();
  final requestSpaces = [];
  final constructorSpaces = [];
  for (final params in definitions['constructors']) {
    if (params["namespace"] != null) {
      constructorSpaces.add(params['namespace']);
    }
  }
  for (final params in definitions['requests']) {
    if (params["namespace"] != null) {
      requestSpaces.add(params['namespace']);
    }
  }

  final file = new File('telegram/tl/all_tl_objects.dart');
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }
  ClassWriter writer = new ClassWriter(file: file);

  for (final x in requestSpaces.toSet()) {
    writer.write("import 'requests/$x.dart' as $x;\n");
  }
  writer.write("import 'requests/requests.dart';\n");
  for (final x in constructorSpaces.toSet()) {
    writer.write("import 'constructors/$x.dart' as $x;\n");
  }
  writer.write("import 'constructors/constructors.dart';\n");

  writer.write("final tlobjects = {");
  for (final tlobject in definitions['constructors']) {
    writer.write(tlobject['constructorId'].toString() + ": ");
    if (tlobject['namespace'] != null) {
      writer.write("${tlobject['namespace']}.");
    }
    writer.write("${tlobject['name']},\n");
  }
  for (final tlobject in definitions['requests']) {
    writer.write(tlobject['constructorId'].toString() + ": ");
    if (tlobject['namespace'] != null) {
      writer.write("${tlobject['namespace']}.");
    }
    writer.write("${tlobject['name']},\n");
  }
  writer.write("};");

  createClasses('constructors', definitions['constructors']);
  createClasses('requests', definitions['requests']);
}

final tlContent = new File('telegram/static/api.tl').readAsStringSync();

final schemeContent = new File('telegram/static/schema.tl').readAsStringSync();

loadFromTlSchemas() {
  var res = extractParams(tlContent);

  final constructorParamsApi = res[0];
  final functionParamsApi = res[1];
  res = extractParams(schemeContent);
  final constructorParamsSchema = res[0];
  final functionParamsSchema = res[1];
  final constructors = [constructorParamsApi, constructorParamsSchema].expand((element) => element).toList();
  final requests = [functionParamsApi, functionParamsSchema].expand((element) => element).toList();

  return {'constructors': constructors, 'requests': requests};
}

// {name: DestroySession, constructorId: 3880853798, argsConfig: {sessionId: {isVector: false, isFlag: false, skipConstructorId: true,
//flagIndex: -1, flagIndicator: false, type: long, useVectorId: null}}, subclassOfId: 2936858557, result:
//DestroySessionRes, isFunction: true, namespace: null}
String getType(String tgType, bool isVector) {
  String result = "";
  if (isVector) {
    result += "List<";
  }

  switch (tgType) {
    case "long":
      result += "BigInt";
      break;
    case "int":
      result += "int";
      break;
    case "int128":
      result += "BigInt";
      break;
    case "int256":
      result += "BigInt";
      break;
    case "double":
      result += "double";
      break;
    case "string":
      result += "String";
      break;
    case "date":
      result += "DateTime";
      break;
    case "bytes":
      result += "List<int>";
      break;
    case "Bool":
      result += "bool";
      break;
    case "true":
      result += "bool";
      break;
    default:
      if (isVector) {
        result += "dynamic";
      } else {
        result += "var";
      }
      break;
  }
  if (isVector) {
    result += ">";
  }
  return result;
}

writeFromReader(writer, name, argsConfig) {
  //fromReader
  writer.write("\t");

  writer.write("static $name fromReader(BinaryReader reader) {");
  writer.write("\n");
  writer.write("\tvar temp,len;");

  final args = {};
  argsConfig.forEach((argName, arg) {
    if (arg['isFlag']) {
      if (arg['type'] == 'true') {
        writer.write("final $argName = " + (((args['flags'] != null ? 1 : 0) & 1 << arg['flagIndex']) == 1).toString() + ";");
        return;
      }
      writer.write("var $argName;");

      writer.write("if ((flags & " + (1 << arg['flagIndex']).toString());
      writer.write(")==1){");
      if (!arg['isVector']) {
        writer.write("var $argName = ");
      }
      getArgFromReader(writer, arg, argName);
      writer.write(" } else {");
      writer.write("$argName=null;");
      writer.write("}");
    } else {
      if (arg['flagIndicator']) {
        writer.write("final flags = ");
      } else {
        if (!arg['isVector']) {
          writer.write("var $argName = ");
        }
      }
      getArgFromReader(writer, arg, argName);
    }
  });
  writer.write("\t\t");

  writer.write("return new $name(${argsConfig.keys.where((element) => element != "flags").map((e) => "$e : $e").join(", ")});");
  writer.write("\n\t");

  writer.write("}");
}

bool writeArgToBytes(ClassWriter writer, arg, Map<dynamic, dynamic> argsConfig, {name: null}) {
  if (arg['genericDefinition'] != null && arg['genericDefinition']) {
    return false;
  }
  if (name == null) {
    name = 'this.${arg['name']}';
  }

  name = variableSnakeToCamelCase(name);
  if (arg['isFlag']) {
    if (arg['type'] == 'true') {
      return false;
    } else if (arg['isVector']) {
      writer.write("($name==null||$name==false)?[]:[");
    } else {
      writer.write("($name==null||$name==false)?[]:[");
    }
  }

  if (arg['isVector']) {
    if (arg['useVectorId']) {
      writer.write("readBufferFromBigInt(0x15c4b51c,4),");
    }
    writer.write("readBufferFromBigInt($name.length,4,little:true,signed:true),");

    writer.write(("$name.map((x)=>"));
    final bool oldFlag = arg['isFlag'];
    arg['isVector'] = false;
    arg['isFlag'] = false;
    writeArgToBytes(writer, arg, argsConfig, name: 'x');
    arg['isVector'] = true;
    arg['isFlag'] = oldFlag;
    writer.write(")");
  } else if (arg["flagIndicator"]) {
    bool found = false;
    argsConfig.forEach((key, value) {
      if (found) {
        return;
      }
      if (value['isFlag']) {
        found = true;
        writer.write("[0,0,0,0]");
      }
    });
    if (!found) {
      argsConfig.forEach((key, value) {
        if (value['isFlag']) {
          writer.write(
              "(this.${variableSnakeToCamelCase(value['name'])}==null || this.${variableSnakeToCamelCase(value['name'])}==null ? 0 : ${1 << value['flagIndex']} | ");
        }
      });
      writer.write(")");
    }
  } else if (arg['type'] == 'int') {
    writer.write('readBufferFromBigInt($name,4,little:true,signed:true)');
  } else if (arg['type'] == 'long') {
    writer.write('readBufferFromBigInt($name,8,little:true,signed:true)');
  } else if (arg['type'] == 'int128') {
    writer.write('readBufferFromBigInt($name,16,little:true,signed:true)');
  } else if (arg['type'] == 'int256') {
    writer.write('readBufferFromBigInt($name,32,little:true,signed:true)');
  } else if (arg['type'] == 'double') {
    writer.write('readBufferFromBigInt($name,4)');
  } else if (arg['type'] == 'string') {
    writer.write('serializeBytes($name)');
  } else if (arg['type'] == 'Bool') {
    writer.write('$name ? 0xb5757299 : 0x379779bc');
  } else if (arg['type'] == 'true') {
  } else if (arg['type'] == 'bytes') {
    writer.write('serializeBytes($name)');
  } else if (arg['type'] == 'date') {
    writer.write('serializeDatetime($name)');
  } else {
    writer.write("$name.getBytes()");

    var boxed = arg['type'][arg['type'].indexOf('.') + 1];
    boxed = boxed == boxed.toUpperCase();

    if (!boxed) {
      writer.write('.slice(4)');
    }
  }
  if (arg['isFlag']) {
    writer.write("]");
    if (arg['isVector']) {
      writer.write("");
    }
  }
  return true;
}

writeGetBytes(ClassWriter writer, String name, argsConfig, constructorId) {
  writer.write("List<int> getBytes(){");
  final Map<int, List<dynamic>> repeatedArgs = {};
  argsConfig.forEach((argName, arg) {
    if (arg['isFlag']) {
      if (!repeatedArgs.containsKey([arg['flagIndex']])) {
        repeatedArgs[arg['flagIndex']] = [];
      }
      repeatedArgs[arg['flagIndex']].add(arg);
    }
  });
  writer.write("return [readBufferFromBigInt(" + constructorId.toString() + ",4),");
  argsConfig.forEach((argName, arg) {
    arg["name"] = argName;
    if (writeArgToBytes(writer, arg, argsConfig)) {
      writer.write(",");
    }
  });
  writer.write("].expand((element) => element);");
  writer.write("}");
}

createClasses(classesType, params) {
  for (final classParams in params) {
    final name = classParams['name'];
    final constructorId = classParams['constructorId'];
    final subclassOfId = classParams['subclassOfId'];
    final Map<String, dynamic> argsConfig = classParams['argsConfig'];
    final namespace = classParams['namespace'];
    final file = new File('telegram/tl/${classesType}/${namespace ?? classesType}.dart');
    var append = "\n\n";
    //Creating files
    if (!file.existsSync()) {
      // append = "part of ${classesType == "requests" ? "request" : "constructor"};\n";
      append = "import '../../utils.dart';\n";
      append += "import '../../extensions/binary_reader.dart';\n\n";
      file.createSync(recursive: true);
    }
    ClassWriter writer = new ClassWriter(file: file);
    writer.write(append);
    //Declaring classes
    writer.write("""class $name {\n""");
    writer.write("""    static const CONSTRUCTOR_ID = $constructorId;
    static const SUBCLASS_OF_ID = $subclassOfId;
""");
    //Declaring types
    final filtered = [];

    argsConfig.forEach((key, value) {
      if (key == "flags" && value['flagIndicator']) {
        return;
      }
      filtered.add("this.$key");
      writer.write("""\t${getType(value['type'], value['isVector'])} $key;\n""");
    });
    //Constructor
    argsConfig.forEach((key, value) {});
    writer.write("""\n\n\t$name(${argsConfig.length > 0 ? '{${filtered.join(", ")}}' : ''});""");
    writer.write("""\n\n""");
    writeFromReader(writer, name, argsConfig);
    writeGetBytes(writer, name, argsConfig, constructorId);
    writer.write("\n\n");
    writer.write("}");
  }
}

getArgFromReader(ClassWriter writer, arg, argName, {end: true}) {
  if (arg['isVector']) {
    if (arg['useVectorId']) {
      writer.write("reader.readInt();");
      writer.write("\n");
    }
    arg['isVector'] = false;
    writer.write("var $argName = [];");
    writer.write("len = reader.readInt();");
    writer.write("\n\t");
    writer.write("for (var i=0;i<len;i++){");
    writer.write("\n\t\t");
    writer.write("$argName.add(");

    getArgFromReader(writer, arg, argName, end: false);
    writer.write(");");

    writer.write("\n}");
    arg['isVector'] = true;
  } else if (arg['flagIndicator']) {
    writer.write("reader.readInt();");
  } else {
    switch (arg['type']) {
      case 'int':
        writer.write("reader.readInt()");
        break;
      case 'long':
        writer.write("reader.readLong()");
        break;
      case 'int128':
        writer.write("reader.readLargeInt(128)");
        break;
      case 'int256':
        writer.write("reader.readLargeInt(256)");
        break;
      case 'double':
        writer.write("reader.readDouble()");
        break;
      case 'string':
        writer.write("reader.tgReadString()");
        break;
      case 'Bool':
        writer.write("reader.tgReadBool()");
        break;
      case 'true':
        writer.write("true");
        break;
      case 'bytes':
        writer.write("reader.tgReadBytes()");
        break;
      case 'date':
        writer.write("reader.tgReadDate()");
        break;
      default:
        if (!arg["skipConstructorId"]) {
          writer.write("reader.tgReadObject()");
        } else {
          writer.write("${snakeToCamelCase(arg['type'])}.fromReader(reader)");
        }
    }
    if (end) {
      writer.write(";");
    }
  }
}

mergeWithNamespaces(obj1, obj2) {
  final result = obj1;
  for (var key in obj2) {
    if (obj2[key] == 'function' || !result[key]) {
      result[key] = obj2[key];
    } else {
      result[key].addAll(obj2[key]);
    }
  }

  return result;
}

extractParams(fileContent) {
  final f = parseTl(fileContent, 109);

  final constructors = [];
  final functions = [];
  for (final d in f) {
    d['isFunction'] ? functions.add(d) : constructors.add(d);
  }
  return [constructors, functions];
}

void main() {
  try {
    new Directory('telegram/tl/constructors').deleteSync(recursive: true);
    new Directory('telegram/tl/requests').deleteSync(recursive: true);
    new File('telegram/tl/all_tl_objects.dart').deleteSync(recursive: true);
  } catch (e) {}
  buildApiFromTlSchema();
}
