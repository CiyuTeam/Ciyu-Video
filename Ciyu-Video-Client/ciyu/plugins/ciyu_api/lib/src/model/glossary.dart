//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:ciyu_api/src/model/word.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'glossary.g.dart';

/// Glossary
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [words] 
abstract class Glossary implements Built<Glossary, GlossaryBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'name')
    String? get name;

    @BuiltValueField(wireName: r'words')
    BuiltList<Word>? get words;

    Glossary._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(GlossaryBuilder b) => b;

    factory Glossary([void updates(GlossaryBuilder b)]) = _$Glossary;

    @BuiltValueSerializer(custom: true)
    static Serializer<Glossary> get serializer => _$GlossarySerializer();
}

class _$GlossarySerializer implements StructuredSerializer<Glossary> {
    @override
    final Iterable<Type> types = const [Glossary, _$Glossary];

    @override
    final String wireName = r'Glossary';

    @override
    Iterable<Object?> serialize(Serializers serializers, Glossary object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.name != null) {
            result
                ..add(r'name')
                ..add(serializers.serialize(object.name,
                    specifiedType: const FullType(String)));
        }
        if (object.words != null) {
            result
                ..add(r'words')
                ..add(serializers.serialize(object.words,
                    specifiedType: const FullType(BuiltList, [FullType(Word)])));
        }
        return result;
    }

    @override
    Glossary deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = GlossaryBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'id':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.id = valueDes;
                    break;
                case r'name':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.name = valueDes;
                    break;
                case r'words':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(Word)])) as BuiltList<Word>;
                    result.words.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

