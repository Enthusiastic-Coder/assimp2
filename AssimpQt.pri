CONFIG += exceptions rtti


intel_icc: {
    # warning #310: old-style parameter list (anachronism)
    QMAKE_CFLAGS_WARN_ON += -wd310

    # warning #68: integer conversion resulted in a change of sign
    QMAKE_CFLAGS_WARN_ON += -wd68

    # warning #858: type qualifier on return type is meaningless
    QMAKE_CFLAGS_WARN_ON += -wd858

    QMAKE_CXXFLAGS_WARN_ON += $$QMAKE_CFLAGS_WARN_ON
} else:gcc|clang: {
    # Stop compiler complaining about ignored qualifiers on return types
    QMAKE_CFLAGS_WARN_ON += -Wno-ignored-qualifiers -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated-declarations -Wno-unused-function
    QMAKE_CXXFLAGS_WARN_ON = $$QMAKE_CFLAGS_WARN_ON -Wno-reorder
} else:msvc {
    # Disabled Warnings:
    #   4100: 'identifier' : unreferenced formal parameter
    #   4189: 'identifier' : local variable is initialized but not referenced
    #   4267: coversion from 'size_t' to 'int', possible loss of data
    #   4996: Function call with parameters that may be unsafe
    #   4828: The file contains a character starting at offset 0x167b that
    #         is illegal in the current source character set (codepage 65001)
    QMAKE_CFLAGS_WARN_ON += -wd"4100" -wd"4189" -wd"4267" -wd"4996" -wd"4828"
    QMAKE_CXXFLAGS_WARN_ON = $$QMAKE_CFLAGS_WARN_ON
}

clang: {
    QMAKE_CFLAGS_WARN_ON += -Wno-unused-private-field
    QMAKE_CXXFLAGS_WARN_ON = $$QMAKE_CFLAGS_WARN_ON
}

# Prevents "catastrophic error: Too many segments for object format" for builds using Windows ICC
msvc: QMAKE_CXXFLAGS += /bigobj

CONFIG += warn_on

DEFINES += ASSIMP_BUILD_BOOST_WORKAROUND ASSIMP_BUILD_DLL_EXPORT

DEFINES += \
   ASSIMP_BUILD_NO_OWN_ZLIB \
   ASSIMP_BUILD_NO_COMPRESSED_IFC \
   ASSIMP_BUILD_NO_Q3BSP_IMPORTER \
   ASSIMP_BUILD_NO_C4D_IMPORTER \
   ASSIMP_BUILD_NO_3MF_IMPORTER \
   ASSIMP_BUILD_NO_OPENGEX_IMPORTER \
   ASSIMP_BUILD_NO_3MF_EXPORTER \
   ASSIMP_BUILD_NO3MF_EXPORTER \
   ASSIMP_BUILD_NO_ASSBIN_IMPORTER \
   OPENDDL_STATIC_LIBARY \
   NOUNCRYPT

INCLUDEPATH += .\code\BoostWorkaround \
               .\code\contrib\unzip \
               .\code \
               .\include \
               .\contrib\zlib \
               .\contrib\rapidjson\include \
               .\contrib\irrXML \
               .\contrib\openddlparser\include

HEADERS += ./code/BoostWorkaround/boost/math/common_factor_rt.hpp  \
./code/BoostWorkaround/boost/tuple/tuple.hpp \
./code/BoostWorkaround/boost/foreach.hpp \
./code/BoostWorkaround/boost/format.hpp \
./code/BoostWorkaround/boost/lexical_cast.hpp \
./code/BoostWorkaround/boost/make_shared.hpp \
./code/BoostWorkaround/boost/noncopyable.hpp \
./code/BoostWorkaround/boost/pointer_cast.hpp \
./code/BoostWorkaround/boost/scoped_array.hpp \
./code/BoostWorkaround/boost/scoped_ptr.hpp \
./code/BoostWorkaround/boost/shared_array.hpp \
./code/BoostWorkaround/boost/shared_ptr.hpp \
./code/BoostWorkaround/boost/static_assert.hpp \
./code/BoostWorkaround/boost/timer.hpp \
./code/res/resource.h \
./code/3DSHelper.h \
./code/3DSLoader.h \
./code/ACLoader.h \
./code/ASELoader.h \
./code/ASEParser.h \
./code/assbin_chunks.h \
./code/AssimpPCH.h \
./code/B3DImporter.h \
./code/BaseImporter.h \
./code/BaseProcess.h \
./code/BlenderDNA.h  \
./code/BlenderIntermediate.h  \
./code/BlenderLoader.h  \
./code/BlenderModifier.h  \
./code/BlenderScene.h  \
./code/BlenderSceneGen.h  \
./code/BlobIOSystem.h  \
./code/BVHLoader.h  \
./code/ByteSwap.h  \
./code/CalcTangentsProcess.h  \
./code/CInterfaceIOWrapper.h  \
./code/COBLoader.h  \
./code/COBScene.h  \
./code/ColladaExporter.h  \
./code/ColladaHelper.h  \
./code/ColladaLoader.h  \
./code/ColladaParser.h  \
./code/ComputeUVMappingProcess.h  \
./code/ConvertToLHProcess.h  \
./code/CSMLoader.h  \
./code/DeboneProcess.h  \
./code/DefaultIOStream.h  \
./code/DefaultIOSystem.h  \
./code/DefaultProgressHandler.h  \
./code/DXFHelper.h  \
./code/DXFLoader.h  \
./code/Exceptional.h  \
./code/fast_atof.h  \
./code/FileLogStream.h  \
./code/FileSystemFilter.h  \
./code/FindDegenerates.h  \
./code/FindInstancesProcess.h  \
./code/FindInvalidDataProcess.h  \
./code/FixNormalsStep.h  \
./code/GenericProperty.h  \
./code/GenFaceNormalsProcess.h  \
./code/GenVertexNormalsProcess.h  \
./code/HalfLifeFileData.h  \
./code/Hash.h  \
./code/HMPFileData.h  \
./code/HMPLoader.h  \
./code/IFCLoader.h  \
./code/IFCReaderGen.h  \
./code/IFCUtil.h  \
./code/IFF.h  \
./code/Importer.h  \
./code/ImproveCacheLocality.h  \
./code/IRRLoader.h  \
./code/IRRMeshLoader.h  \
./code/IRRShared.h  \
./code/irrXMLWrapper.h  \
./code/JoinVerticesProcess.h  \
./code/LimitBoneWeightsProcess.h  \
./code/LineSplitter.h  \
./code/LogAux.h  \
./code/LWOAnimation.h  \
./code/LWOFileData.h  \
./code/LWOLoader.h  \
./code/LWSLoader.h  \
./code/M3Importer.h  \
./code/MakeVerboseFormat.h  \
./code/MaterialSystem.h  \
./code/MD2FileData.h  \
./code/MD2Loader.h  \
./code/MD2NormalTable.h  \
./code/MD3FileData.h  \
./code/MD3Loader.h  \
./code/MD4FileData.h  \
./code/MD5Loader.h  \
./code/MD5Parser.h  \
./code/MDCFileData.h  \
./code/MDCLoader.h  \
./code/MDCNormalTable.h  \
./code/MDLDefaultColorMap.h  \
./code/MDLFileData.h  \
./code/MDLLoader.h  \
./code/MemoryIOWrapper.h  \
./code/MS3DLoader.h  \
./code/NDOLoader.h  \
./code/NFFLoader.h  \
./code/ObjExporter.h  \
./code/ObjFileData.h  \
./code/ObjFileImporter.h  \
./code/ObjFileMtlImporter.h  \
./code/ObjFileParser.h  \
./code/ObjTools.h  \
./code/OFFLoader.h  \
./code/OgreImporter.hpp  \
./code/OgreXmlHelper.hpp  \
./code/OptimizeGraph.h  \
./code/OptimizeMeshes.h  \
./code/ParsingUtils.h  \
./code/PlyExporter.h  \
./code/PlyLoader.h  \
./code/PlyParser.h  \
./code/PolyTools.h  \
./code/PretransformVertices.h  \
./code/ProcessHelper.h  \
./code/Profiler.h  \
./code/pstdint.h  \
./code/Q3BSPFileData.h  \
./code/Q3BSPFileImporter.h  \
./code/Q3BSPFileParser.h  \
./code/Q3BSPZipArchive.h  \
./code/Q3DLoader.h  \
./code/qnan.h  \
./code/RawLoader.h  \
./code/RemoveComments.h  \
./code/RemoveRedundantMaterials.h  \
./code/RemoveVCProcess.h  \
./code/SceneCombiner.h  \
./code/ScenePreprocessor.h  \
./code/ScenePrivate.h  \
./code/SGSpatialSort.h  \
./code/SkeletonMeshBuilder.h  \
./code/SMDLoader.h  \
./code/SmoothingGroups.h  \
./code/SortByPTypeProcess.h  \
./code/SpatialSort.h  \
./code/SplitByBoneCountProcess.h  \
./code/SplitLargeMeshes.h  \
./code/StandardShapes.h  \
./code/StdOStreamLogStream.h  \
./code/STEPFile.h  \
./code/STEPFileReader.h  \
./code/STLExporter.h  \
./code/STLLoader.h  \
./code/StreamReader.h  \
./code/StringComparison.h  \
./code/Subdivision.h  \
./code/TargetAnimation.h \
./code/TerragenLoader.h  \
./code/TextureTransform.h  \
./code/TinyFormatter.h  \
./code/TriangulateProcess.h  \
./code/UnrealLoader.h  \
./code/ValidateDataStructure.h  \
./code/Vertex.h  \
./code/VertexTriangleAdjacency.h  \
./code/Win32DebugLogStream.h  \
./code/XFileHelper.h  \
./code/XFileImporter.h  \
./code/XFileParser.h  \
./code/XGLLoader.h  \
./include/assimp/Compiler/poppack1.h  \
./include/assimp/Compiler/pushpack1.h  \
./include/assimp/ai_assert.h  \
./include/assimp/anim.h  \
./include/assimp/camera.h  \
./include/assimp/cexport.h  \
./include/assimp/cfileio.h  \
./include/assimp/cimport.h  \
./include/assimp/color4.h  \
./include/assimp/config.h  \
./include/assimp/DefaultLogger.hpp  \
./include/assimp/defs.h  \
./include/assimp/Exporter.hpp  \
./include/assimp/Importer.hpp  \
./include/assimp/importerdesc.h  \
./include/assimp/IOStream.hpp  \
./include/assimp/IOSystem.hpp  \
./include/assimp/light.h  \
./include/assimp/Logger.hpp  \
./include/assimp/LogStream.hpp  \
./include/assimp/material.h  \
./include/assimp/matrix3x3.h  \
./include/assimp/matrix4x4.h  \
./include/assimp/mesh.h  \
./include/assimp/NullLogger.hpp  \
./include/assimp/postprocess.h  \
./include/assimp/ProgressHandler.hpp  \
./include/assimp/quaternion.h  \
./include/assimp/scene.h  \
./include/assimp/texture.h  \
./include/assimp/types.h  \
./include/assimp/vector2.h  \
./include/assimp/vector3.h  \
./include/assimp/version.h  \
./revision.h \
contrib/clipper/clipper.hpp \
contrib/ConvertUTF/ConvertUTF.h \
contrib/irrXML/CXMLReaderImpl.h \
contrib/irrXML/heapsort.h \
contrib/irrXML/irrArray.h \
contrib/irrXML/irrString.h \
contrib/irrXML/irrTypes.h \
contrib/irrXML/irrXML.h \
contrib/poly2tri/poly2tri/common/shapes.h \
contrib/poly2tri/poly2tri/common/utils.h \
contrib/poly2tri/poly2tri/sweep/advancing_front.h \
contrib/poly2tri/poly2tri/sweep/cdt.h \
contrib/poly2tri/poly2tri/sweep/sweep.h \
contrib/poly2tri/poly2tri/sweep/sweep_context.h \
contrib/poly2tri/poly2tri/poly2tri.h \
contrib/unzip/crypt.h \
contrib/unzip/ioapi.h \
contrib/unzip/unzip.h \
contrib/zlib/crc32.h \
contrib/zlib/deflate.h \
contrib/zlib/inffast.h \
contrib/zlib/inffixed.h \
contrib/zlib/inflate.h \
contrib/zlib/inftrees.h \
contrib/zlib/trees.h \
contrib/zlib/zconf.h \
contrib/zlib/zconf.in.h \
contrib/zlib/zlib.h \
contrib/zlib/zutil.h

SOURCES += \
./code/3DSConverter.cpp \
./code/XGLLoader.cpp \
./code/XFileParser.cpp \
./code/XFileImporter.cpp \
./code/XFileExporter.cpp \
./code/X3DVocabulary.cpp \
./code/X3DImporter_Texturing.cpp \
./code/X3DImporter_Shape.cpp \
./code/X3DImporter_Rendering.cpp \
./code/X3DImporter_Postprocess.cpp \
./code/X3DImporter_Networking.cpp \
./code/X3DImporter_Metadata.cpp \
./code/X3DImporter_Light.cpp \
./code/X3DImporter_Group.cpp \
./code/X3DImporter_Geometry3D.cpp \
./code/X3DImporter_Geometry2D.cpp \
./code/X3DImporter.cpp \
./code/X3DExporter.cpp \
./code/VertexTriangleAdjacency.cpp \
./code/Version.cpp \
./code/ValidateDataStructure.cpp \
./code/UnrealLoader.cpp \
./code/TriangulateProcess.cpp \
./code/TextureTransform.cpp \
./code/TerragenLoader.cpp \
./code/TargetAnimation.cpp \
./code/Subdivision.cpp \
./code/STLLoader.cpp \
./code/STLExporter.cpp \
./code/STEPFileReader.cpp \
./code/STEPFileEncoding.cpp \
./code/StepExporter.cpp \
./code/StandardShapes.cpp \
./code/SplitLargeMeshes.cpp \
./code/SplitByBoneCountProcess.cpp \
./code/SpatialSort.cpp \
./code/SortByPTypeProcess.cpp \
./code/SMDLoader.cpp \
./code/SkeletonMeshBuilder.cpp \
./code/SIBImporter.cpp \
./code/SGSpatialSort.cpp \
./code/ScenePreprocessor.cpp \
./code/SceneCombiner.cpp \
./code/scene.cpp \
./code/ScaleProcess.cpp \
./code/RemoveVCProcess.cpp \
./code/RemoveRedundantMaterials.cpp \
./code/RemoveComments.cpp \
./code/RawLoader.cpp \
./code/Q3DLoader.cpp \
./code/Q3BSPZipArchive.cpp \
./code/Q3BSPFileParser.cpp \
./code/Q3BSPFileImporter.cpp \
./code/ProcessHelper.cpp \
./code/PretransformVertices.cpp \
./code/PostStepRegistry.cpp \
./code/PlyParser.cpp \
./code/PlyLoader.cpp \
./code/PlyExporter.cpp \
./code/OptimizeMeshes.cpp \
./code/OptimizeGraph.cpp \
./code/OpenGEXImporter.cpp \
./code/OpenGEXExporter.cpp \
./code/OgreXmlSerializer.cpp \
./code/OgreStructs.cpp \
./code/OgreMaterial.cpp \
./code/OgreImporter.cpp \
./code/OgreBinarySerializer.cpp \
./code/OFFLoader.cpp \
./code/ObjFileParser.cpp \
./code/ObjFileMtlImporter.cpp \
./code/ObjFileImporter.cpp \
./code/ObjExporter.cpp \
./code/NFFLoader.cpp \
./code/NDOLoader.cpp \
./code/MS3DLoader.cpp \
./code/MMDPmxParser.cpp \
./code/MMDImporter.cpp \
./code/MDLMaterialLoader.cpp \
./code/MDLLoader.cpp \
./code/MDCLoader.cpp \
./code/MD5Parser.cpp \
./code/MD5Loader.cpp \
./code/MD3Loader.cpp \
./code/MD2Loader.cpp \
./code/MaterialSystem.cpp \
./code/MakeVerboseFormat.cpp \
./code/LWSLoader.cpp \
./code/LWOMaterial.cpp \
./code/LWOLoader.cpp \
./code/LWOBLoader.cpp \
./code/LWOAnimation.cpp \
./code/LimitBoneWeightsProcess.cpp \
./code/JoinVerticesProcess.cpp \
./code/IRRShared.cpp \
./code/IRRMeshLoader.cpp \
./code/IRRLoader.cpp \
./code/ImproveCacheLocality.cpp \
./code/ImporterRegistry.cpp \
./code/Importer.cpp \
./code/IFCUtil.cpp \
./code/IFCReaderGen2.cpp \
./code/IFCReaderGen1.cpp \
./code/IFCProfile.cpp \
./code/IFCOpenings.cpp \
./code/IFCMaterial.cpp \
./code/IFCLoader.cpp \
./code/IFCGeometry.cpp \
./code/IFCCurve.cpp \
./code/IFCBoolean.cpp \
./code/HMPLoader.cpp \
./code/glTFImporter.cpp \
./code/glTFExporter.cpp \
./code/glTF2Importer.cpp \
./code/glTF2Exporter.cpp \
./code/GenVertexNormalsProcess.cpp \
./code/GenFaceNormalsProcess.cpp \
./code/FixNormalsStep.cpp \
./code/FIReader.cpp \
./code/FindInvalidDataProcess.cpp \
./code/FindInstancesProcess.cpp \
./code/FindDegenerates.cpp \
./code/FBXUtil.cpp \
./code/FBXTokenizer.cpp \
./code/FBXProperties.cpp \
./code/FBXParser.cpp \
./code/FBXNodeAttribute.cpp \
./code/FBXModel.cpp \
./code/FBXMeshGeometry.cpp \
./code/FBXMaterial.cpp \
./code/FBXImporter.cpp \
./code/FBXDocumentUtil.cpp \
./code/FBXDocument.cpp \
./code/FBXDeformer.cpp \
./code/FBXConverter.cpp \
./code/FBXBinaryTokenizer.cpp \
./code/FBXAnimation.cpp \
./code/Exporter.cpp \
./code/DXFLoader.cpp \
./code/DefaultLogger.cpp \
./code/DefaultIOSystem.cpp \
./code/DefaultIOStream.cpp \
./code/DeboneProcess.cpp \
./code/D3MFOpcPackage.cpp \
./code/D3MFImporter.cpp \
./code/D3MFExporter.cpp \
./code/CSMLoader.cpp \
./code/CreateAnimMesh.cpp \
./code/ConvertToLHProcess.cpp \
./code/ComputeUVMappingProcess.cpp \
./code/ColladaParser.cpp \
./code/ColladaLoader.cpp \
./code/ColladaExporter.cpp \
./code/COBLoader.cpp \
./code/CInterfaceIOWrapper.cpp \
./code/CalcTangentsProcess.cpp \
./code/C4DImporter.cpp \
./code/BVHLoader.cpp \
./code/BlenderTessellator.cpp \
./code/BlenderScene.cpp \
./code/BlenderModifier.cpp \
./code/BlenderLoader.cpp \
./code/BlenderDNA.cpp \
./code/BlenderBMesh.cpp \
./code/Bitmap.cpp \
./code/BaseProcess.cpp \
./code/BaseImporter.cpp \
./code/B3DImporter.cpp \
./code/AssxmlExporter.cpp \
./code/AssimpCExport.cpp \
./code/Assimp.cpp \
./code/AssbinLoader.cpp \
./code/AssbinExporter.cpp \
./code/ASEParser.cpp \
./code/ASELoader.cpp \
./code/AMFImporter_Postprocess.cpp \
./code/AMFImporter_Material.cpp \
./code/AMFImporter_Geometry.cpp \
./code/AMFImporter.cpp \
./code/ACLoader.cpp \
./code/3DSLoader.cpp \
./code/3DSExporter.cpp \
##contrib/openddlparser/code/Value.cpp \
##contrib/openddlparser/code/DDLNode.cpp \
##contrib/openddlparser/code/OpenDDLCommon.cpp \
##contrib/openddlparser/code/OpenDDLExport.cpp \
##contrib/openddlparser/code/OpenDDLParser.cpp \
##contrib/openddlparser/code/OpenDDLStream.cpp \
#contrib/clipper/clipper.cpp \
contrib/clipper/clipper.cpp \
contrib/poly2tri/poly2tri/sweep/advancing_front.cc \
contrib/poly2tri/poly2tri/sweep/cdt.cc \
contrib/poly2tri/poly2tri/sweep/sweep.cc \
contrib/poly2tri/poly2tri/sweep/sweep_context.cc \
contrib/unzip/ioapi.c \
contrib/unzip/unzip.c \
contrib/zlib/adler32.c \
contrib/zlib/compress.c \
contrib/zlib/crc32.c \
contrib/zlib/deflate.c \
contrib/zlib/inffast.c \
contrib/zlib/inflate.c \
contrib/zlib/inftrees.c \
contrib/zlib/trees.c \
contrib/zlib/zutil.c \
contrib/irrXML/irrXML.cpp \
contrib/poly2tri/poly2tri/common/shapes.cc
