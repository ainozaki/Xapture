; ModuleID = 'xdp_test_tcp_flags.c'
source_filename = "xdp_test_tcp_flags.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon }
%union.anon = type { i32 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 2, i32 4, i32 16, i32 7, i32 0 }, section "maps", align 4, !dbg !0
@__const.xdp_parse_prog.____fmt = private unnamed_addr constant [14 x i8] c"priority: %d\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !50
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_parse_prog to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_parse_prog(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_generated" !dbg !85 {
  %2 = alloca i32, align 4
  %3 = alloca [14 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !97, metadata !DIExpression()), !dbg !200
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !201
  %5 = load i32, i32* %4, align 4, !dbg !201, !tbaa !202
  %6 = zext i32 %5 to i64, !dbg !207
  %7 = inttoptr i64 %6 to i8*, !dbg !208
  call void @llvm.dbg.value(metadata i8* %7, metadata !98, metadata !DIExpression()), !dbg !200
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !209
  %9 = load i32, i32* %8, align 4, !dbg !209, !tbaa !210
  %10 = zext i32 %9 to i64, !dbg !211
  call void @llvm.dbg.value(metadata i64 %10, metadata !99, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i32 2, metadata !100, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i32 0, metadata !101, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i8* %7, metadata !102, metadata !DIExpression()), !dbg !200
  %11 = inttoptr i64 %6 to %struct.ethhdr*, !dbg !212
  call void @llvm.dbg.value(metadata %struct.ethhdr* %11, metadata !106, metadata !DIExpression()), !dbg !200
  %12 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 1, !dbg !213
  %13 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !215
  %14 = icmp ugt %struct.ethhdr* %12, %13, !dbg !216
  br i1 %14, label %89, label %15, !dbg !217

15:                                               ; preds = %1
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 2, !dbg !218
  %17 = load i16, i16* %16, align 1, !dbg !218, !tbaa !220
  %18 = icmp eq i16 %17, 8, !dbg !223
  br i1 %18, label %19, label %64, !dbg !224

19:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i8* %7, metadata !102, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !200
  call void @llvm.dbg.value(metadata i8* %7, metadata !120, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !200
  %20 = getelementptr i8, i8* %7, i64 34, !dbg !225
  %21 = bitcast i8* %20 to %struct.iphdr*, !dbg !225
  %22 = inttoptr i64 %10 to %struct.iphdr*, !dbg !227
  %23 = icmp ugt %struct.iphdr* %21, %22, !dbg !228
  br i1 %23, label %89, label %24, !dbg !229

24:                                               ; preds = %19
  call void @llvm.dbg.value(metadata i8* %7, metadata !102, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !200
  call void @llvm.dbg.value(metadata i8* %7, metadata !120, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !200
  call void @llvm.dbg.value(metadata i8* %7, metadata !120, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !200
  call void @llvm.dbg.value(metadata i8* %20, metadata !102, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata %struct.tcphdr* null, metadata !139, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata %struct.udphdr* null, metadata !161, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata %struct.icmphdr* null, metadata !170, metadata !DIExpression()), !dbg !200
  %25 = getelementptr i8, i8* %7, i64 23, !dbg !230
  %26 = load i8, i8* %25, align 1, !dbg !230, !tbaa !232
  switch i8 %26, label %63 [
    i8 6, label %27
    i8 17, label %32
    i8 1, label %37
  ], !dbg !234

27:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i8* %20, metadata !139, metadata !DIExpression()), !dbg !200
  %28 = getelementptr i8, i8* %7, i64 54, !dbg !235
  %29 = bitcast i8* %28 to %struct.tcphdr*, !dbg !235
  %30 = inttoptr i64 %10 to %struct.tcphdr*, !dbg !238
  %31 = icmp ugt %struct.tcphdr* %29, %30, !dbg !239
  br i1 %31, label %64, label %42, !dbg !240

32:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i8* %20, metadata !161, metadata !DIExpression()), !dbg !200
  %33 = getelementptr i8, i8* %7, i64 42, !dbg !241
  %34 = bitcast i8* %33 to %struct.udphdr*, !dbg !241
  %35 = inttoptr i64 %10 to %struct.udphdr*, !dbg !245
  %36 = icmp ugt %struct.udphdr* %34, %35, !dbg !246
  br i1 %36, label %64, label %63, !dbg !247

37:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i8* %20, metadata !170, metadata !DIExpression()), !dbg !200
  %38 = getelementptr i8, i8* %7, i64 42, !dbg !248
  %39 = bitcast i8* %38 to %struct.icmphdr*, !dbg !248
  %40 = inttoptr i64 %10 to %struct.icmphdr*, !dbg !252
  %41 = icmp ugt %struct.icmphdr* %39, %40, !dbg !253
  br i1 %41, label %64, label %63, !dbg !254

42:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i8* %20, metadata !139, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i8* %20, metadata !102, metadata !DIExpression(DW_OP_plus_uconst, 20, DW_OP_stack_value)), !dbg !200
  call void @llvm.dbg.value(metadata i8* %20, metadata !139, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i32 1, metadata !101, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i8* %20, metadata !139, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i8* %20, metadata !139, metadata !DIExpression()), !dbg !200
  %43 = getelementptr i8, i8* %7, i64 46, !dbg !255
  %44 = bitcast i8* %43 to i16*, !dbg !255
  %45 = load i16, i16* %44, align 4, !dbg !255
  %46 = and i16 %45, 8192, !dbg !255
  %47 = icmp eq i16 %46, 0, !dbg !257
  br i1 %47, label %48, label %64, !dbg !258

48:                                               ; preds = %42
  call void @llvm.dbg.value(metadata i32 2, metadata !101, metadata !DIExpression()), !dbg !200
  %49 = and i16 %45, 4096, !dbg !259
  %50 = icmp eq i16 %49, 0, !dbg !261
  br i1 %50, label %51, label %64, !dbg !262

51:                                               ; preds = %48
  call void @llvm.dbg.value(metadata i32 3, metadata !101, metadata !DIExpression()), !dbg !200
  %52 = and i16 %45, 2048, !dbg !263
  %53 = icmp eq i16 %52, 0, !dbg !265
  br i1 %53, label %54, label %64, !dbg !266

54:                                               ; preds = %51
  call void @llvm.dbg.value(metadata i32 4, metadata !101, metadata !DIExpression()), !dbg !200
  %55 = and i16 %45, 1024, !dbg !267
  %56 = icmp eq i16 %55, 0, !dbg !269
  br i1 %56, label %57, label %64, !dbg !270

57:                                               ; preds = %54
  call void @llvm.dbg.value(metadata i32 5, metadata !101, metadata !DIExpression()), !dbg !200
  %58 = and i16 %45, 512, !dbg !271
  %59 = icmp eq i16 %58, 0, !dbg !273
  br i1 %59, label %60, label %64, !dbg !274

60:                                               ; preds = %57
  call void @llvm.dbg.value(metadata i32 6, metadata !101, metadata !DIExpression()), !dbg !200
  %61 = and i16 %45, 256, !dbg !275
  %62 = icmp eq i16 %61, 0, !dbg !277
  br i1 %62, label %63, label %64, !dbg !278

63:                                               ; preds = %37, %24, %32, %60
  call void @llvm.dbg.value(metadata i32 7, metadata !101, metadata !DIExpression()), !dbg !200
  br label %64, !dbg !279

64:                                               ; preds = %37, %32, %27, %42, %48, %51, %54, %57, %60, %15, %63
  %65 = phi i32 [ 0, %15 ], [ 1, %42 ], [ 2, %48 ], [ 3, %51 ], [ 4, %54 ], [ 5, %57 ], [ 6, %60 ], [ 7, %63 ], [ 0, %27 ], [ 0, %32 ], [ 0, %37 ], !dbg !200
  %66 = phi i32 [ 2, %15 ], [ 2, %42 ], [ 2, %48 ], [ 2, %51 ], [ 2, %54 ], [ 2, %57 ], [ 2, %60 ], [ 2, %63 ], [ 0, %27 ], [ 0, %32 ], [ 0, %37 ], !dbg !200
  call void @llvm.dbg.value(metadata i32 %66, metadata !100, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i32 %65, metadata !101, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.label(metadata !199), !dbg !280
  %67 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0, !dbg !281
  call void @llvm.lifetime.start.p0i8(i64 14, i8* nonnull %67) #3, !dbg !281
  call void @llvm.dbg.declare(metadata [14 x i8]* %3, metadata !194, metadata !DIExpression()), !dbg !281
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %67, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([14 x i8], [14 x i8]* @__const.xdp_parse_prog.____fmt, i64 0, i64 0), i64 14, i1 false), !dbg !281
  %68 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %67, i32 14, i32 %65) #3, !dbg !281
  call void @llvm.lifetime.end.p0i8(i64 14, i8* nonnull %67) #3, !dbg !282
  %69 = bitcast i32* %2 to i8*, !dbg !283
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %69), !dbg !283
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !288, metadata !DIExpression()) #3, !dbg !283
  call void @llvm.dbg.value(metadata i32 %66, metadata !289, metadata !DIExpression()) #3, !dbg !283
  call void @llvm.dbg.value(metadata i32 %65, metadata !290, metadata !DIExpression()) #3, !dbg !283
  store i32 %65, i32* %2, align 4, !tbaa !303
  %70 = load i32, i32* %8, align 4, !dbg !304, !tbaa !210
  %71 = zext i32 %70 to i64, !dbg !305
  call void @llvm.dbg.value(metadata i64 %71, metadata !291, metadata !DIExpression()) #3, !dbg !283
  %72 = load i32, i32* %4, align 4, !dbg !306, !tbaa !202
  %73 = zext i32 %72 to i64, !dbg !307
  call void @llvm.dbg.value(metadata i64 %73, metadata !292, metadata !DIExpression()) #3, !dbg !283
  %74 = icmp eq i32 %65, 7, !dbg !308
  br i1 %74, label %87, label %75, !dbg !310

75:                                               ; preds = %64
  call void @llvm.dbg.value(metadata i32* %2, metadata !290, metadata !DIExpression(DW_OP_deref)) #3, !dbg !283
  %76 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %69) #3, !dbg !311
  call void @llvm.dbg.value(metadata i8* %76, metadata !293, metadata !DIExpression()) #3, !dbg !283
  %77 = icmp eq i8* %76, null, !dbg !312
  br i1 %77, label %87, label %78, !dbg !314

78:                                               ; preds = %75
  call void @llvm.dbg.value(metadata i8* %76, metadata !293, metadata !DIExpression()) #3, !dbg !283
  %79 = sub nsw i64 %71, %73, !dbg !315
  call void @llvm.dbg.value(metadata i64 %79, metadata !301, metadata !DIExpression()) #3, !dbg !283
  %80 = bitcast i8* %76 to i64*, !dbg !316
  %81 = load i64, i64* %80, align 8, !dbg !317, !tbaa !318
  %82 = add i64 %81, 1, !dbg !317
  store i64 %82, i64* %80, align 8, !dbg !317, !tbaa !318
  %83 = getelementptr inbounds i8, i8* %76, i64 8, !dbg !321
  %84 = bitcast i8* %83 to i64*, !dbg !321
  %85 = load i64, i64* %84, align 8, !dbg !322, !tbaa !323
  %86 = add i64 %79, %85, !dbg !322
  store i64 %86, i64* %84, align 8, !dbg !322, !tbaa !323
  br label %87

87:                                               ; preds = %64, %75, %78
  %88 = phi i32 [ %66, %78 ], [ 0, %64 ], [ 0, %75 ], !dbg !283
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %69), !dbg !324
  br label %89, !dbg !325

89:                                               ; preds = %19, %1, %87
  %90 = phi i32 [ %88, %87 ], [ -1, %1 ], [ -1, %19 ], !dbg !200
  ret i32 %90, !dbg !326
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!81, !82, !83}
!llvm.ident = !{!84}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 21, type: !73, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !43, globals: !49, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_test_tcp_flags.c", directory: "/home/aino/Projects/xapture/filter/filter-test")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 3150, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!41 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!42 = !DIEnumerator(name: "IPPROTO_MAX", value: 256, isUnsigned: true)
!43 = !{!44, !45, !46}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !47, line: 24, baseType: !48)
!47 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!48 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!49 = !{!0, !50, !56, !66}
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 157, type: !52, isLocal: false, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 32, elements: !54)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !{!55}
!55 = !DISubrange(count: 4)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !58, line: 152, type: !59, isLocal: true, isDefinition: true)
!58 = !DIFile(filename: "../../deps/include/bpf/bpf_helper_defs.h", directory: "/home/aino/Projects/xapture/filter/filter-test")
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !63, !65, null}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !53)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !47, line: 27, baseType: !7)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !58, line: 33, type: !68, isLocal: true, isDefinition: true)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DISubroutineType(types: !70)
!70 = !{!44, !44, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !74, line: 33, size: 160, elements: !75)
!74 = !DIFile(filename: "../../deps/include/bpf/bpf_helpers.h", directory: "/home/aino/Projects/xapture/filter/filter-test")
!75 = !{!76, !77, !78, !79, !80}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !73, file: !74, line: 34, baseType: !7, size: 32)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !73, file: !74, line: 35, baseType: !7, size: 32, offset: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !73, file: !74, line: 36, baseType: !7, size: 32, offset: 64)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !73, file: !74, line: 37, baseType: !7, size: 32, offset: 96)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !73, file: !74, line: 38, baseType: !7, size: 32, offset: 128)
!81 = !{i32 7, !"Dwarf Version", i32 4}
!82 = !{i32 2, !"Debug Info Version", i32 3}
!83 = !{i32 1, !"wchar_size", i32 4}
!84 = !{!"clang version 10.0.0-4ubuntu1 "}
!85 = distinct !DISubprogram(name: "xdp_parse_prog", scope: !3, file: !3, line: 60, type: !86, scopeLine: 60, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !96)
!86 = !DISubroutineType(types: !87)
!87 = !{!62, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3161, size: 160, elements: !90)
!90 = !{!91, !92, !93, !94, !95}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !89, file: !6, line: 3162, baseType: !65, size: 32)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !89, file: !6, line: 3163, baseType: !65, size: 32, offset: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !89, file: !6, line: 3164, baseType: !65, size: 32, offset: 64)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !89, file: !6, line: 3166, baseType: !65, size: 32, offset: 96)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !89, file: !6, line: 3167, baseType: !65, size: 32, offset: 128)
!96 = !{!97, !98, !99, !100, !101, !102, !106, !120, !139, !161, !170, !194, !199}
!97 = !DILocalVariable(name: "ctx", arg: 1, scope: !85, file: !3, line: 60, type: !88)
!98 = !DILocalVariable(name: "data", scope: !85, file: !3, line: 61, type: !44)
!99 = !DILocalVariable(name: "data_end", scope: !85, file: !3, line: 62, type: !44)
!100 = !DILocalVariable(name: "action", scope: !85, file: !3, line: 64, type: !65)
!101 = !DILocalVariable(name: "priority", scope: !85, file: !3, line: 65, type: !65)
!102 = !DILocalVariable(name: "nh", scope: !85, file: !3, line: 66, type: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !3, line: 28, size: 64, elements: !104)
!104 = !{!105}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !103, file: !3, line: 29, baseType: !44, size: 64)
!106 = !DILocalVariable(name: "eth", scope: !85, file: !3, line: 69, type: !107)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !109, line: 163, size: 112, elements: !110)
!109 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!110 = !{!111, !116, !117}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !108, file: !109, line: 164, baseType: !112, size: 48)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !113, size: 48, elements: !114)
!113 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!114 = !{!115}
!115 = !DISubrange(count: 6)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !108, file: !109, line: 165, baseType: !112, size: 48, offset: 48)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !108, file: !109, line: 166, baseType: !118, size: 16, offset: 96)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !119, line: 25, baseType: !46)
!119 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!120 = !DILocalVariable(name: "iph", scope: !85, file: !3, line: 78, type: !121)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !123, line: 86, size: 160, elements: !124)
!123 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!124 = !{!125, !127, !128, !129, !130, !131, !132, !133, !134, !136, !138}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !122, file: !123, line: 88, baseType: !126, size: 4, flags: DIFlagBitField, extraData: i64 0)
!126 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !47, line: 21, baseType: !113)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !122, file: !123, line: 89, baseType: !126, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !122, file: !123, line: 96, baseType: !126, size: 8, offset: 8)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !122, file: !123, line: 97, baseType: !118, size: 16, offset: 16)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !122, file: !123, line: 98, baseType: !118, size: 16, offset: 32)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !122, file: !123, line: 99, baseType: !118, size: 16, offset: 48)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !122, file: !123, line: 100, baseType: !126, size: 8, offset: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !122, file: !123, line: 101, baseType: !126, size: 8, offset: 72)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !122, file: !123, line: 102, baseType: !135, size: 16, offset: 80)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !119, line: 31, baseType: !46)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !122, file: !123, line: 103, baseType: !137, size: 32, offset: 96)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !119, line: 27, baseType: !65)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !122, file: !123, line: 104, baseType: !137, size: 32, offset: 128)
!139 = !DILocalVariable(name: "tcph", scope: !85, file: !3, line: 84, type: !140)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !142, line: 25, size: 160, elements: !143)
!142 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "")
!143 = !{!144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !141, file: !142, line: 26, baseType: !118, size: 16)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !141, file: !142, line: 27, baseType: !118, size: 16, offset: 16)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !141, file: !142, line: 28, baseType: !137, size: 32, offset: 32)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !141, file: !142, line: 29, baseType: !137, size: 32, offset: 64)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !141, file: !142, line: 31, baseType: !46, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !141, file: !142, line: 32, baseType: !46, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !141, file: !142, line: 33, baseType: !46, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !141, file: !142, line: 34, baseType: !46, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !141, file: !142, line: 35, baseType: !46, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !141, file: !142, line: 36, baseType: !46, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !141, file: !142, line: 37, baseType: !46, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !141, file: !142, line: 38, baseType: !46, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !141, file: !142, line: 39, baseType: !46, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !141, file: !142, line: 40, baseType: !46, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !141, file: !142, line: 55, baseType: !118, size: 16, offset: 112)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !141, file: !142, line: 56, baseType: !135, size: 16, offset: 128)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !141, file: !142, line: 57, baseType: !118, size: 16, offset: 144)
!161 = !DILocalVariable(name: "udph", scope: !85, file: !3, line: 85, type: !162)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !164, line: 23, size: 64, elements: !165)
!164 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "")
!165 = !{!166, !167, !168, !169}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !163, file: !164, line: 24, baseType: !118, size: 16)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !163, file: !164, line: 25, baseType: !118, size: 16, offset: 16)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !163, file: !164, line: 26, baseType: !118, size: 16, offset: 32)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !163, file: !164, line: 27, baseType: !135, size: 16, offset: 48)
!170 = !DILocalVariable(name: "icmph", scope: !85, file: !3, line: 86, type: !171)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !173, line: 69, size: 64, elements: !174)
!173 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "")
!174 = !{!175, !176, !177, !178}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !172, file: !173, line: 70, baseType: !126, size: 8)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !172, file: !173, line: 71, baseType: !126, size: 8, offset: 8)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !172, file: !173, line: 72, baseType: !135, size: 16, offset: 16)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !172, file: !173, line: 84, baseType: !179, size: 32, offset: 32)
!179 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !172, file: !173, line: 73, size: 32, elements: !180)
!180 = !{!181, !186, !187, !192}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !179, file: !173, line: 77, baseType: !182, size: 32)
!182 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !179, file: !173, line: 74, size: 32, elements: !183)
!183 = !{!184, !185}
!184 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !182, file: !173, line: 75, baseType: !118, size: 16)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !182, file: !173, line: 76, baseType: !118, size: 16, offset: 16)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !179, file: !173, line: 78, baseType: !137, size: 32)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !179, file: !173, line: 82, baseType: !188, size: 32)
!188 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !179, file: !173, line: 79, size: 32, elements: !189)
!189 = !{!190, !191}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !188, file: !173, line: 80, baseType: !118, size: 16)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !188, file: !173, line: 81, baseType: !118, size: 16, offset: 16)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !179, file: !173, line: 83, baseType: !193, size: 32)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !126, size: 32, elements: !54)
!194 = !DILocalVariable(name: "____fmt", scope: !195, file: !3, line: 153, type: !196)
!195 = distinct !DILexicalBlock(scope: !85, file: !3, line: 153, column: 2)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 112, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 14)
!199 = !DILabel(scope: !85, name: "out", file: !3, line: 152)
!200 = !DILocation(line: 0, scope: !85)
!201 = !DILocation(line: 61, column: 34, scope: !85)
!202 = !{!203, !204, i64 0}
!203 = !{!"xdp_md", !204, i64 0, !204, i64 4, !204, i64 8, !204, i64 12, !204, i64 16}
!204 = !{!"int", !205, i64 0}
!205 = !{!"omnipotent char", !206, i64 0}
!206 = !{!"Simple C/C++ TBAA"}
!207 = !DILocation(line: 61, column: 23, scope: !85)
!208 = !DILocation(line: 61, column: 15, scope: !85)
!209 = !DILocation(line: 62, column: 38, scope: !85)
!210 = !{!203, !204, i64 4}
!211 = !DILocation(line: 62, column: 27, scope: !85)
!212 = !DILocation(line: 69, column: 23, scope: !85)
!213 = !DILocation(line: 70, column: 10, scope: !214)
!214 = distinct !DILexicalBlock(scope: !85, file: !3, line: 70, column: 6)
!215 = !DILocation(line: 70, column: 16, scope: !214)
!216 = !DILocation(line: 70, column: 14, scope: !214)
!217 = !DILocation(line: 70, column: 6, scope: !85)
!218 = !DILocation(line: 73, column: 11, scope: !219)
!219 = distinct !DILexicalBlock(scope: !85, file: !3, line: 73, column: 6)
!220 = !{!221, !222, i64 12}
!221 = !{!"ethhdr", !205, i64 0, !205, i64 6, !222, i64 12}
!222 = !{!"short", !205, i64 0}
!223 = !DILocation(line: 73, column: 19, scope: !219)
!224 = !DILocation(line: 73, column: 6, scope: !85)
!225 = !DILocation(line: 79, column: 11, scope: !226)
!226 = distinct !DILexicalBlock(scope: !85, file: !3, line: 79, column: 7)
!227 = !DILocation(line: 79, column: 17, scope: !226)
!228 = !DILocation(line: 79, column: 15, scope: !226)
!229 = !DILocation(line: 79, column: 7, scope: !85)
!230 = !DILocation(line: 88, column: 11, scope: !231)
!231 = distinct !DILexicalBlock(scope: !85, file: !3, line: 88, column: 6)
!232 = !{!233, !205, i64 9}
!233 = !{!"iphdr", !205, i64 0, !205, i64 0, !205, i64 1, !222, i64 2, !222, i64 4, !222, i64 6, !205, i64 8, !205, i64 9, !222, i64 10, !204, i64 12, !204, i64 16}
!234 = !DILocation(line: 88, column: 6, scope: !85)
!235 = !DILocation(line: 91, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !3, line: 91, column: 8)
!237 = distinct !DILexicalBlock(scope: !231, file: !3, line: 88, column: 35)
!238 = !DILocation(line: 91, column: 19, scope: !236)
!239 = !DILocation(line: 91, column: 17, scope: !236)
!240 = !DILocation(line: 91, column: 8, scope: !237)
!241 = !DILocation(line: 99, column: 12, scope: !242)
!242 = distinct !DILexicalBlock(scope: !243, file: !3, line: 99, column: 7)
!243 = distinct !DILexicalBlock(scope: !244, file: !3, line: 96, column: 41)
!244 = distinct !DILexicalBlock(scope: !231, file: !3, line: 96, column: 12)
!245 = !DILocation(line: 99, column: 18, scope: !242)
!246 = !DILocation(line: 99, column: 16, scope: !242)
!247 = !DILocation(line: 99, column: 7, scope: !243)
!248 = !DILocation(line: 107, column: 14, scope: !249)
!249 = distinct !DILexicalBlock(scope: !250, file: !3, line: 107, column: 8)
!250 = distinct !DILexicalBlock(scope: !251, file: !3, line: 104, column: 42)
!251 = distinct !DILexicalBlock(scope: !244, file: !3, line: 104, column: 12)
!252 = !DILocation(line: 107, column: 20, scope: !249)
!253 = !DILocation(line: 107, column: 18, scope: !249)
!254 = !DILocation(line: 107, column: 8, scope: !250)
!255 = !DILocation(line: 117, column: 21, scope: !256)
!256 = distinct !DILexicalBlock(scope: !85, file: !3, line: 117, column: 6)
!257 = !DILocation(line: 117, column: 25, scope: !256)
!258 = !DILocation(line: 117, column: 6, scope: !85)
!259 = !DILocation(line: 123, column: 21, scope: !260)
!260 = distinct !DILexicalBlock(scope: !85, file: !3, line: 123, column: 6)
!261 = !DILocation(line: 123, column: 25, scope: !260)
!262 = !DILocation(line: 123, column: 6, scope: !85)
!263 = !DILocation(line: 129, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !85, file: !3, line: 129, column: 6)
!265 = !DILocation(line: 129, column: 25, scope: !264)
!266 = !DILocation(line: 129, column: 6, scope: !85)
!267 = !DILocation(line: 135, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !85, file: !3, line: 135, column: 6)
!269 = !DILocation(line: 135, column: 25, scope: !268)
!270 = !DILocation(line: 135, column: 6, scope: !85)
!271 = !DILocation(line: 141, column: 21, scope: !272)
!272 = distinct !DILexicalBlock(scope: !85, file: !3, line: 141, column: 6)
!273 = !DILocation(line: 141, column: 25, scope: !272)
!274 = !DILocation(line: 141, column: 6, scope: !85)
!275 = !DILocation(line: 147, column: 21, scope: !276)
!276 = distinct !DILexicalBlock(scope: !85, file: !3, line: 147, column: 6)
!277 = !DILocation(line: 147, column: 25, scope: !276)
!278 = !DILocation(line: 147, column: 6, scope: !85)
!279 = !DILocation(line: 151, column: 2, scope: !85)
!280 = !DILocation(line: 152, column: 1, scope: !85)
!281 = !DILocation(line: 153, column: 2, scope: !195)
!282 = !DILocation(line: 153, column: 2, scope: !85)
!283 = !DILocation(line: 0, scope: !284, inlinedAt: !302)
!284 = distinct !DISubprogram(name: "xdp_stats_func", scope: !3, file: !3, line: 32, type: !285, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !287)
!285 = !DISubroutineType(types: !286)
!286 = !{!65, !88, !65, !65}
!287 = !{!288, !289, !290, !291, !292, !293, !301}
!288 = !DILocalVariable(name: "ctx", arg: 1, scope: !284, file: !3, line: 32, type: !88)
!289 = !DILocalVariable(name: "action", arg: 2, scope: !284, file: !3, line: 32, type: !65)
!290 = !DILocalVariable(name: "priority", arg: 3, scope: !284, file: !3, line: 32, type: !65)
!291 = !DILocalVariable(name: "data_end", scope: !284, file: !3, line: 33, type: !44)
!292 = !DILocalVariable(name: "data", scope: !284, file: !3, line: 34, type: !44)
!293 = !DILocalVariable(name: "rec", scope: !284, file: !3, line: 35, type: !294)
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!295 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !3, line: 16, size: 128, elements: !296)
!296 = !{!297, !300}
!297 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !295, file: !3, line: 17, baseType: !298, size: 64)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !47, line: 31, baseType: !299)
!299 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !295, file: !3, line: 18, baseType: !298, size: 64, offset: 64)
!301 = !DILocalVariable(name: "bytes", scope: !284, file: !3, line: 52, type: !298)
!302 = distinct !DILocation(line: 154, column: 9, scope: !85)
!303 = !{!204, !204, i64 0}
!304 = !DILocation(line: 33, column: 37, scope: !284, inlinedAt: !302)
!305 = !DILocation(line: 33, column: 26, scope: !284, inlinedAt: !302)
!306 = !DILocation(line: 34, column: 33, scope: !284, inlinedAt: !302)
!307 = !DILocation(line: 34, column: 22, scope: !284, inlinedAt: !302)
!308 = !DILocation(line: 41, column: 15, scope: !309, inlinedAt: !302)
!309 = distinct !DILexicalBlock(scope: !284, file: !3, line: 41, column: 6)
!310 = !DILocation(line: 37, column: 6, scope: !284, inlinedAt: !302)
!311 = !DILocation(line: 46, column: 8, scope: !284, inlinedAt: !302)
!312 = !DILocation(line: 47, column: 7, scope: !313, inlinedAt: !302)
!313 = distinct !DILexicalBlock(scope: !284, file: !3, line: 47, column: 6)
!314 = !DILocation(line: 47, column: 6, scope: !284, inlinedAt: !302)
!315 = !DILocation(line: 52, column: 25, scope: !284, inlinedAt: !302)
!316 = !DILocation(line: 53, column: 7, scope: !284, inlinedAt: !302)
!317 = !DILocation(line: 53, column: 17, scope: !284, inlinedAt: !302)
!318 = !{!319, !320, i64 0}
!319 = !{!"datarec", !320, i64 0, !320, i64 8}
!320 = !{!"long long", !205, i64 0}
!321 = !DILocation(line: 54, column: 7, scope: !284, inlinedAt: !302)
!322 = !DILocation(line: 54, column: 16, scope: !284, inlinedAt: !302)
!323 = !{!319, !320, i64 8}
!324 = !DILocation(line: 57, column: 1, scope: !284, inlinedAt: !302)
!325 = !DILocation(line: 154, column: 2, scope: !85)
!326 = !DILocation(line: 155, column: 1, scope: !85)