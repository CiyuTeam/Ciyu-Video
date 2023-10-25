//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:ciyu_api/src/model/word.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sentence.g.dart';

/// Sentence
///
/// Properties:
/// * [id] 
/// * [content] 
/// * [translation] 
/// * [source_] 
/// * [word] 
abstract class Sentence implements Built<Sentence, SentenceBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'content')
    String? get content;

    @BuiltValueField(wireName: r'translation')
    String? get translation;

    @BuiltValueField(wireName: r'source')
    String? get source_;

    @BuiltValueField(wireName: r'word')
    Word? get word;

    Sentence._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(SentenceBuilder b) => b;

    factory Sentence([void updates(SentenceBuilder b)]) = _$Sentence;

    @BuiltValueSerializer(custom: true)
    static Serializer<Sentence> get serializer => _$SentenceSerializer();
}

class _$SentenceSerializer implements StructuredSerializer<Sentence> {
    @override
    final Iterable<Type> types = const [Sentence, _$Sentence];

    @override
    final String wireName = r'Sentence';

    @override
    Iterable<Object?> serialize(Serializers serializers, Sentence object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.content != null) {
            result
                ..add(r'content')
                ..add(serializers.serialize(object.content,
                    specifiedType: const FullType(String)));
        }
        if (object.translation != null) {
            result
                ..add(r'translation')
                ..add(serializers.serialize(object.translation,
                    specifiedType: const FullType(String)));
        }
        if (object.source_ != null) {
            result
                ..add(r'source')
                ..add(serializers.serialize(object.source_,
                    specifiedType: const FullType(String)));
        }
        if (object.word != null) {
            result
                ..add(r'word')
                ..add(serializers.serialize(object.word,
                    specifiedType: const FullType(Word)));
        }
        return result;
    }

    @override
    Sentence deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = SentenceBuilder();

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
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
                case r'translation':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.translation = valueDes;
                    break;
                case r'source':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.source_ = valueDes;
                    break;
                case r'word':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(Word)) as Word;
                    result.word.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

