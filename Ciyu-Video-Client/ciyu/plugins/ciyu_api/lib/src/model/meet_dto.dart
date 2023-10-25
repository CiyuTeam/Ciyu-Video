//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:ciyu_api/src/model/article.dart';
import 'package:ciyu_api/src/model/meaning.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'meet_dto.g.dart';

/// MeetDto
///
/// Properties:
/// * [id] 
/// * [quality] 
/// * [createdTime] 
/// * [meaning] 
/// * [article] 
abstract class MeetDto implements Built<MeetDto, MeetDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'quality')
    double? get quality;

    @BuiltValueField(wireName: r'createdTime')
    DateTime? get createdTime;

    @BuiltValueField(wireName: r'meaning')
    Meaning? get meaning;

    @BuiltValueField(wireName: r'article')
    Article? get article;

    MeetDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(MeetDtoBuilder b) => b;

    factory MeetDto([void updates(MeetDtoBuilder b)]) = _$MeetDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<MeetDto> get serializer => _$MeetDtoSerializer();
}

class _$MeetDtoSerializer implements StructuredSerializer<MeetDto> {
    @override
    final Iterable<Type> types = const [MeetDto, _$MeetDto];

    @override
    final String wireName = r'MeetDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, MeetDto object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.quality != null) {
            result
                ..add(r'quality')
                ..add(serializers.serialize(object.quality,
                    specifiedType: const FullType(double)));
        }
        if (object.createdTime != null) {
            result
                ..add(r'createdTime')
                ..add(serializers.serialize(object.createdTime,
                    specifiedType: const FullType(DateTime)));
        }
        if (object.meaning != null) {
            result
                ..add(r'meaning')
                ..add(serializers.serialize(object.meaning,
                    specifiedType: const FullType(Meaning)));
        }
        if (object.article != null) {
            result
                ..add(r'article')
                ..add(serializers.serialize(object.article,
                    specifiedType: const FullType(Article)));
        }
        return result;
    }

    @override
    MeetDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = MeetDtoBuilder();

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
                case r'quality':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(double)) as double;
                    result.quality = valueDes;
                    break;
                case r'createdTime':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    result.createdTime = valueDes;
                    break;
                case r'meaning':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(Meaning)) as Meaning;
                    result.meaning.replace(valueDes);
                    break;
                case r'article':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(Article)) as Article;
                    result.article.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

