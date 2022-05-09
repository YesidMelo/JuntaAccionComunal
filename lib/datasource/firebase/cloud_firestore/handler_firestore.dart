import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jac/datasource/datasource.dart';

abstract class HandlerFirestore {
  Future<CloudFirestoreResponseDTO> addOrUpdateObject({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO});
  Future<List<CloudFirestoreResponseDTO>> getListCollection({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO});
  Future<CloudFirestoreResponseDTO> deleteObject({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO});
}

class HandlerFirestoreImpl extends HandlerFirestore {

  FirebaseFirestore? _firebaseFirestore;

  HandlerFirestoreImpl() {
    Future.delayed( const Duration(milliseconds: 1), () async {
      await Firebase.initializeApp();
      _firebaseFirestore = FirebaseFirestore.instance;
    });
  }

  @override
  Future<CloudFirestoreResponseDTO> addOrUpdateObject({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO}) async {
    if(cloudFirestoreRequestDTO.idElementCollection == null) {
      return await _addElementInCollection(cloudFirestoreRequestDTO: cloudFirestoreRequestDTO);
    }

    return _updateElementInCollection(
      cloudFirestoreRequestDTO: cloudFirestoreRequestDTO
    );
  }

  @override
  Future<List<CloudFirestoreResponseDTO>> getListCollection({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO}) async {
    CollectionReference? reference = _firebaseFirestore
      ?.collection(cloudFirestoreRequestDTO.nameCollection)
    ;
    return await _getListCloudFirestoreResponseDTO(reference: reference);
  }

  @override
  Future<CloudFirestoreResponseDTO> deleteObject({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO}) async {
    if(cloudFirestoreRequestDTO.idElementCollection == null) return CloudFirestoreResponseDTO(isSuccess: false, detailModel: null, error: "not specific document");
    DocumentReference? reference = _firebaseFirestore
      ?.collection(cloudFirestoreRequestDTO.nameCollection)
      .doc(cloudFirestoreRequestDTO.idElementCollection)
    ;
    return _deleteObject(reference: reference);
  }

  /// private methods
  /// add or update
  Future<CloudFirestoreResponseDTO> _addElementInCollection({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO}) async {
    String nameCollection = cloudFirestoreRequestDTO.nameCollection;

    DocumentReference? reference =  await _firebaseFirestore
      ?.collection(nameCollection)
      .add(cloudFirestoreRequestDTO.mapOfModel)
    ;

    return await _generateCloudResponseDTO(reference: reference);
  }

  Future<CloudFirestoreResponseDTO> _updateElementInCollection({required CloudFirestoreRequestDTO cloudFirestoreRequestDTO}) async {
    String nameCollection = cloudFirestoreRequestDTO.nameCollection;


    DocumentReference? reference =   _firebaseFirestore
        ?.collection(nameCollection)
        .doc(cloudFirestoreRequestDTO.idElementCollection)
      ;

    await reference?.set(cloudFirestoreRequestDTO.mapOfModel);

    return await _generateCloudResponseDTO(reference: reference);
  }

  Future<CloudFirestoreResponseDTO> _generateCloudResponseDTO({DocumentReference? reference}) async {
    CloudFirestoreResponseDTO? response = await reference?.get().then((DocumentSnapshot snapshot){
      Map<String, dynamic>? data = snapshot.data();

      return CloudFirestoreResponseDTO(
          isSuccess: true,
          detailModel: data
      );
    });

    if(response == null) {
      return CloudFirestoreResponseDTO(isSuccess: false, detailModel: null);
    }
    return response;
  }

  /// load object objects
  Future<List<CloudFirestoreResponseDTO>> _getListCloudFirestoreResponseDTO({CollectionReference? reference}) async {
    if(reference == null) return <CloudFirestoreResponseDTO>[];
    QuerySnapshot query = await reference.get();

    return query.docs.map((doc) {
      Map<String, dynamic> map = doc.data();
      map["id"] = doc.id;
      return CloudFirestoreResponseDTO(
        isSuccess: true,
        detailModel: map
      );
    }).toList();
  }

  /// delete
  Future<CloudFirestoreResponseDTO> _deleteObject({required DocumentReference? reference}) async {
    await reference?.delete();
    return CloudFirestoreResponseDTO(isSuccess: true, detailModel: null);
  }
}