.class public Lcom/android/server/IntentResolver;
.super Ljava/lang/Object;
.source "IntentResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/IntentResolver$IteratorWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<F:",
        "Landroid/content/IntentFilter;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "IntentResolver"

.field private static final localLOGV:Z

.field private static final mResolvePrioritySorter:Ljava/util/Comparator;


# instance fields
.field private final mActionToFilter:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;"
        }
    .end annotation
.end field

.field private final mBaseTypeToFilter:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;"
        }
    .end annotation
.end field

.field private final mFilters:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<TF;>;"
        }
    .end annotation
.end field

.field private final mSchemeToFilter:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;"
        }
    .end annotation
.end field

.field private final mTypeToFilter:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;"
        }
    .end annotation
.end field

.field private final mTypedActionToFilter:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;"
        }
    .end annotation
.end field

.field private final mWildTypeToFilter:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 535
    new-instance v0, Lcom/android/server/IntentResolver$1;

    invoke-direct {v0}, Lcom/android/server/IntentResolver$1;-><init>()V

    sput-object v0, Lcom/android/server/IntentResolver;->mResolvePrioritySorter:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 546
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mFilters:Ljava/util/HashSet;

    .line 552
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    .line 560
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    .line 570
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    .line 576
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mSchemeToFilter:Ljava/util/HashMap;

    .line 583
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mActionToFilter:Ljava/util/HashMap;

    .line 589
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/IntentResolver;->mTypedActionToFilter:Ljava/util/HashMap;

    return-void
.end method

.method private buildResolveList(Landroid/content/Intent;ZZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .registers 24
    .parameter "intent"
    .parameter "debug"
    .parameter "defaultOnly"
    .parameter "resolvedType"
    .parameter "scheme"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "ZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<TF;>;",
            "Ljava/util/List",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .line 483
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p6, src:Ljava/util/List;,"Ljava/util/List<TF;>;"
    .local p7, dest:Ljava/util/List;,"Ljava/util/List<TR;>;"
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v8

    .line 485
    .local v8, categories:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz p6, :cond_49

    invoke-interface/range {p6 .. p6}, Ljava/util/List;->size()I

    move-result v4

    move v10, v4

    .line 486
    .local v10, N:I
    :goto_b
    const/4 v11, 0x0

    .line 488
    .local v11, hasNonDefaults:Z
    const/4 v12, 0x0

    .local v12, i:I
    :goto_d
    if-ge v12, v10, :cond_c7

    .line 489
    move-object/from16 v0, p6

    move v1, v12

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/IntentFilter;

    .line 491
    .local v3, filter:Landroid/content/IntentFilter;,"TF;"
    if-eqz p2, :cond_32

    const-string v4, "IntentResolver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Matching against filter "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    :cond_32
    move-object/from16 v0, p0

    move-object v1, v3

    move-object/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lcom/android/server/IntentResolver;->allowFilterResult(Landroid/content/IntentFilter;Ljava/util/List;)Z

    move-result v4

    if-nez v4, :cond_4c

    .line 495
    if-eqz p2, :cond_46

    .line 496
    const-string v4, "IntentResolver"

    const-string v5, "  Filter\'s target already added"

    invoke-static {v4, v5}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    :cond_46
    :goto_46
    add-int/lit8 v12, v12, 0x1

    goto :goto_d

    .line 485
    .end local v3           #filter:Landroid/content/IntentFilter;,"TF;"
    .end local v10           #N:I
    .end local v11           #hasNonDefaults:Z
    .end local v12           #i:I
    :cond_49
    const/4 v4, 0x0

    move v10, v4

    goto :goto_b

    .line 501
    .restart local v3       #filter:Landroid/content/IntentFilter;,"TF;"
    .restart local v10       #N:I
    .restart local v11       #hasNonDefaults:Z
    .restart local v12       #i:I
    :cond_4c
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    const-string v9, "IntentResolver"

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-virtual/range {v3 .. v9}, Landroid/content/IntentFilter;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I

    move-result v13

    .line 503
    .local v13, match:I
    if-ltz v13, :cond_9b

    .line 504
    if-eqz p2, :cond_7e

    const-string v4, "IntentResolver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  Filter matched!  match=0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v13}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    :cond_7e
    if-eqz p3, :cond_88

    const-string v4, "android.intent.category.DEFAULT"

    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->hasCategory(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_99

    .line 507
    :cond_88
    move-object/from16 v0, p0

    move-object v1, v3

    move v2, v13

    invoke-virtual {v0, v1, v2}, Lcom/android/server/IntentResolver;->newResult(Landroid/content/IntentFilter;I)Ljava/lang/Object;

    move-result-object v14

    .line 508
    .local v14, oneResult:Ljava/lang/Object;,"TR;"
    if-eqz v14, :cond_46

    .line 509
    move-object/from16 v0, p7

    move-object v1, v14

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_46

    .line 512
    .end local v14           #oneResult:Ljava/lang/Object;,"TR;"
    :cond_99
    const/4 v11, 0x1

    goto :goto_46

    .line 515
    :cond_9b
    if-eqz p2, :cond_46

    .line 517
    packed-switch v13, :pswitch_data_d8

    .line 522
    const-string v15, "unknown reason"

    .line 524
    .local v15, reason:Ljava/lang/String;
    :goto_a2
    const-string v4, "IntentResolver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  Filter did not match: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_46

    .line 518
    .end local v15           #reason:Ljava/lang/String;
    :pswitch_bb
    const-string v15, "action"

    .restart local v15       #reason:Ljava/lang/String;
    goto :goto_a2

    .line 519
    .end local v15           #reason:Ljava/lang/String;
    :pswitch_be
    const-string v15, "category"

    .restart local v15       #reason:Ljava/lang/String;
    goto :goto_a2

    .line 520
    .end local v15           #reason:Ljava/lang/String;
    :pswitch_c1
    const-string v15, "data"

    .restart local v15       #reason:Ljava/lang/String;
    goto :goto_a2

    .line 521
    .end local v15           #reason:Ljava/lang/String;
    :pswitch_c4
    const-string v15, "type"

    .restart local v15       #reason:Ljava/lang/String;
    goto :goto_a2

    .line 529
    .end local v3           #filter:Landroid/content/IntentFilter;,"TF;"
    .end local v13           #match:I
    .end local v15           #reason:Ljava/lang/String;
    :cond_c7
    invoke-interface/range {p7 .. p7}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_d6

    if-eqz v11, :cond_d6

    .line 530
    const-string v4, "IntentResolver"

    const-string v5, "resolveIntent failed: found match, but none with Intent.CATEGORY_DEFAULT"

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    :cond_d6
    return-void

    .line 517
    nop

    :pswitch_data_d8
    .packed-switch -0x4
        :pswitch_be
        :pswitch_bb
        :pswitch_c1
        :pswitch_c4
    .end packed-switch
.end method

.method private final register_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I
    .registers 9
    .parameter
    .parameter
    .parameter
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 428
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    .local p2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .local p3, dest:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<TF;>;>;"
    if-nez p2, :cond_4

    .line 429
    const/4 v3, 0x0

    .line 445
    :goto_3
    return v3

    .line 432
    :cond_4
    const/4 v2, 0x0

    .line 433
    .local v2, num:I
    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 434
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 435
    .local v1, name:Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    .line 437
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 438
    .local v0, array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-nez v0, :cond_23

    .line 440
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 441
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    invoke-virtual {p3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    :cond_23
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v1           #name:Ljava/lang/String;
    :cond_27
    move v3, v2

    .line 445
    goto :goto_3
.end method

.method private final register_mime_types(Landroid/content/IntentFilter;Ljava/lang/String;)I
    .registers 12
    .parameter
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    const/4 v8, 0x0

    .line 342
    invoke-virtual {p1}, Landroid/content/IntentFilter;->typesIterator()Ljava/util/Iterator;

    move-result-object v2

    .line 343
    .local v2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    if-nez v2, :cond_9

    move v6, v8

    .line 387
    :goto_8
    return v6

    .line 347
    :cond_9
    const/4 v4, 0x0

    .line 348
    .local v4, num:I
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_86

    .line 349
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 350
    .local v3, name:Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    .line 352
    move-object v1, v3

    .line 353
    .local v1, baseName:Ljava/lang/String;
    const/16 v6, 0x2f

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 354
    .local v5, slashpos:I
    if-lez v5, :cond_5a

    .line 355
    invoke-virtual {v3, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    .line 360
    :goto_29
    iget-object v6, p0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 361
    .local v0, array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-nez v0, :cond_3d

    .line 363
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    iget-object v6, p0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v6, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    :cond_3d
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 368
    if-lez v5, :cond_6e

    .line 369
    iget-object v6, p0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v0, Ljava/util/ArrayList;

    .line 370
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-nez v0, :cond_56

    .line 372
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    iget-object v6, p0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v6, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    :cond_56
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 357
    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    :cond_5a
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/*"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_29

    .line 377
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    :cond_6e
    iget-object v6, p0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v0, Ljava/util/ArrayList;

    .line 378
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-nez v0, :cond_82

    .line 380
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 381
    .restart local v0       #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    iget-object v6, p0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v6, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    :cond_82
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .end local v0           #array:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v1           #baseName:Ljava/lang/String;
    .end local v3           #name:Ljava/lang/String;
    .end local v5           #slashpos:I
    :cond_86
    move v6, v4

    .line 387
    goto :goto_8
.end method

.method private final remove_all_objects(Ljava/util/List;Ljava/lang/Object;)Z
    .registers 7
    .parameter
    .parameter "object"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TF;>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, list:Ljava/util/List;,"Ljava/util/List<TF;>;"
    const/4 v3, 0x0

    .line 467
    if-eqz p1, :cond_20

    .line 468
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 469
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, idx:I
    :goto_8
    if-ge v1, v0, :cond_1a

    .line 470
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p2, :cond_17

    .line 471
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 472
    add-int/lit8 v1, v1, -0x1

    .line 473
    add-int/lit8 v0, v0, -0x1

    .line 469
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 476
    :cond_1a
    if-lez v0, :cond_1e

    const/4 v2, 0x1

    .line 478
    .end local v0           #N:I
    .end local v1           #idx:I
    :goto_1d
    return v2

    .restart local v0       #N:I
    .restart local v1       #idx:I
    :cond_1e
    move v2, v3

    .line 476
    goto :goto_1d

    .end local v0           #N:I
    .end local v1           #idx:I
    :cond_20
    move v2, v3

    .line 478
    goto :goto_1d
.end method

.method private final unregister_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I
    .registers 8
    .parameter
    .parameter
    .parameter
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 450
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    .local p2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .local p3, dest:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<TF;>;>;"
    if-nez p2, :cond_4

    .line 451
    const/4 v2, 0x0

    .line 463
    :goto_3
    return v2

    .line 454
    :cond_4
    const/4 v1, 0x0

    .line 455
    .local v1, num:I
    :cond_5
    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 456
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 457
    .local v0, name:Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 459
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-direct {p0, v2, p1}, Lcom/android/server/IntentResolver;->remove_all_objects(Ljava/util/List;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 460
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .end local v0           #name:Ljava/lang/String;
    :cond_23
    move v2, v1

    .line 463
    goto :goto_3
.end method

.method private final unregister_mime_types(Landroid/content/IntentFilter;Ljava/lang/String;)I
    .registers 11
    .parameter
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    const/4 v7, 0x0

    .line 391
    invoke-virtual {p1}, Landroid/content/IntentFilter;->typesIterator()Ljava/util/Iterator;

    move-result-object v1

    .line 392
    .local v1, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    if-nez v1, :cond_9

    move v5, v7

    .line 423
    :goto_8
    return v5

    .line 396
    :cond_9
    const/4 v3, 0x0

    .line 397
    .local v3, num:I
    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7a

    .line 398
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 399
    .local v2, name:Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    .line 401
    move-object v0, v2

    .line 402
    .local v0, baseName:Ljava/lang/String;
    const/16 v5, 0x2f

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 403
    .local v4, slashpos:I
    if-lez v4, :cond_52

    .line 404
    invoke-virtual {v2, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    .line 409
    :goto_29
    iget-object v5, p0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {p0, v5, p1}, Lcom/android/server/IntentResolver;->remove_all_objects(Ljava/util/List;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3c

    .line 410
    iget-object v5, p0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    :cond_3c
    if-lez v4, :cond_66

    .line 414
    iget-object v5, p0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {p0, v5, p1}, Lcom/android/server/IntentResolver;->remove_all_objects(Ljava/util/List;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 415
    iget-object v5, p0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    .line 406
    :cond_52
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/*"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_29

    .line 418
    :cond_66
    iget-object v5, p0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {p0, v5, p1}, Lcom/android/server/IntentResolver;->remove_all_objects(Ljava/util/List;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 419
    iget-object v5, p0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    .end local v0           #baseName:Ljava/lang/String;
    .end local v2           #name:Ljava/lang/String;
    .end local v4           #slashpos:I
    :cond_7a
    move v5, v3

    .line 423
    goto :goto_8
.end method


# virtual methods
.method public addFilter(Landroid/content/IntentFilter;)V
    .registers 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, f:Landroid/content/IntentFilter;,"TF;"
    iget-object v2, p0, Lcom/android/server/IntentResolver;->mFilters:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 57
    invoke-virtual {p1}, Landroid/content/IntentFilter;->schemesIterator()Ljava/util/Iterator;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/IntentResolver;->mSchemeToFilter:Ljava/util/HashMap;

    const-string v4, "      Scheme: "

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/android/server/IntentResolver;->register_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I

    move-result v0

    .line 59
    .local v0, numS:I
    const-string v2, "      Type: "

    invoke-direct {p0, p1, v2}, Lcom/android/server/IntentResolver;->register_mime_types(Landroid/content/IntentFilter;Ljava/lang/String;)I

    move-result v1

    .line 60
    .local v1, numT:I
    if-nez v0, :cond_26

    if-nez v1, :cond_26

    .line 61
    invoke-virtual {p1}, Landroid/content/IntentFilter;->actionsIterator()Ljava/util/Iterator;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/IntentResolver;->mActionToFilter:Ljava/util/HashMap;

    const-string v4, "      Action: "

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/android/server/IntentResolver;->register_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I

    .line 64
    :cond_26
    if-eqz v1, :cond_33

    .line 65
    invoke-virtual {p1}, Landroid/content/IntentFilter;->actionsIterator()Ljava/util/Iterator;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/IntentResolver;->mTypedActionToFilter:Ljava/util/HashMap;

    const-string v4, "      TypedAction: "

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/android/server/IntentResolver;->register_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I

    .line 68
    :cond_33
    return-void
.end method

.method protected allowFilterResult(Landroid/content/IntentFilter;Ljava/util/List;)Z
    .registers 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;",
            "Ljava/util/List",
            "<TR;>;)Z"
        }
    .end annotation

    .prologue
    .line 322
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    .local p2, dest:Ljava/util/List;,"Ljava/util/List<TR;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 15
    .parameter "out"
    .parameter "title"
    .parameter "prefix"
    .parameter "packageName"
    .parameter "printFilter"

    .prologue
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    const-string v3, "\n"

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 135
    .local v4, innerPrefix:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 136
    .local v8, sepPrefix:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, curPrefix:Ljava/lang/String;
    const-string v3, "Full MIME Types:"

    iget-object v5, p0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/IntentResolver;->dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 139
    move-object v2, v8

    .line 141
    :cond_4e
    const-string v3, "Base MIME Types:"

    iget-object v5, p0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/IntentResolver;->dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 143
    move-object v2, v8

    .line 145
    :cond_5d
    const-string v3, "Wild MIME Types:"

    iget-object v5, p0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/IntentResolver;->dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 147
    move-object v2, v8

    .line 149
    :cond_6c
    const-string v3, "Schemes:"

    iget-object v5, p0, Lcom/android/server/IntentResolver;->mSchemeToFilter:Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/IntentResolver;->dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 151
    move-object v2, v8

    .line 153
    :cond_7b
    const-string v3, "Non-Data Actions:"

    iget-object v5, p0, Lcom/android/server/IntentResolver;->mActionToFilter:Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/IntentResolver;->dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_8a

    .line 155
    move-object v2, v8

    .line 157
    :cond_8a
    const-string v3, "MIME Typed Actions:"

    iget-object v5, p0, Lcom/android/server/IntentResolver;->mTypedActionToFilter:Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/IntentResolver;->dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_99

    .line 159
    move-object v2, v8

    .line 161
    :cond_99
    if-ne v2, v8, :cond_9d

    const/4 v0, 0x1

    :goto_9c
    return v0

    :cond_9d
    const/4 v0, 0x0

    goto :goto_9c
.end method

.method protected dumpFilter(Ljava/io/PrintWriter;Ljava/lang/String;Landroid/content/IntentFilter;)V
    .registers 4
    .parameter "out"
    .parameter "prefix"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/PrintWriter;",
            "Ljava/lang/String;",
            "TF;)V"
        }
    .end annotation

    .prologue
    .line 338
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p3, filter:Landroid/content/IntentFilter;,"TF;"
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 339
    return-void
.end method

.method dumpMap(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Z)Z
    .registers 25
    .parameter "out"
    .parameter "titlePrefix"
    .parameter "title"
    .parameter "prefix"
    .parameter
    .parameter "packageName"
    .parameter "printFilter"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/PrintWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<TF;>;>;",
            "Ljava/lang/String;",
            "Z)Z"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p5, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/ArrayList<TF;>;>;"
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, v15

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "  "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 99
    .local v7, eprefix:Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, v15

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "    "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 100
    .local v9, fprefix:Ljava/lang/String;
    const/4 v13, 0x0

    .line 101
    .local v13, printedSomething:Z
    const/4 v14, 0x0

    .line 102
    .local v14, printer:Landroid/util/Printer;
    invoke-interface/range {p5 .. p5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .end local p4
    .local v11, i$:Ljava/util/Iterator;
    :cond_36
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_c4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 103
    .local v6, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<TF;>;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 104
    .local v5, a:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 105
    .local v4, N:I
    const/4 v12, 0x0

    .line 106
    .local v12, printedHeader:Z
    const/4 v10, 0x0

    .local v10, i:I
    :goto_4e
    if-ge v10, v4, :cond_36

    .line 107
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/IntentFilter;

    .line 108
    .local v8, filter:Landroid/content/IntentFilter;,"TF;"
    if-eqz p6, :cond_6b

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-virtual {v0, v1}, Lcom/android/server/IntentResolver;->packageForFilter(Landroid/content/IntentFilter;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p6

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_6b

    .line 106
    :cond_68
    :goto_68
    add-int/lit8 v10, v10, 0x1

    goto :goto_4e

    .line 111
    :cond_6b
    if-eqz p3, :cond_79

    .line 112
    invoke-virtual/range {p1 .. p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 113
    const/16 p3, 0x0

    .line 115
    :cond_79
    if-nez v12, :cond_97

    .line 116
    move-object/from16 v0, p1

    move-object v1, v7

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v15, ":"

    move-object/from16 v0, p1

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 117
    const/4 v12, 0x1

    .line 119
    :cond_97
    const/4 v13, 0x1

    .line 120
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v9

    move-object v3, v8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/IntentResolver;->dumpFilter(Ljava/io/PrintWriter;Ljava/lang/String;Landroid/content/IntentFilter;)V

    .line 121
    if-eqz p7, :cond_68

    .line 122
    if-nez v14, :cond_ad

    .line 123
    new-instance v14, Landroid/util/PrintWriterPrinter;

    .end local v14           #printer:Landroid/util/Printer;
    move-object v0, v14

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/util/PrintWriterPrinter;-><init>(Ljava/io/PrintWriter;)V

    .line 125
    .restart local v14       #printer:Landroid/util/Printer;
    :cond_ad
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "  "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v14, v15}, Landroid/content/IntentFilter;->dump(Landroid/util/Printer;Ljava/lang/String;)V

    goto :goto_68

    .line 129
    .end local v4           #N:I
    .end local v5           #a:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v6           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<TF;>;>;"
    .end local v8           #filter:Landroid/content/IntentFilter;,"TF;"
    .end local v10           #i:I
    .end local v12           #printedHeader:Z
    :cond_c4
    return v13
.end method

.method public filterIterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TF;>;"
        }
    .end annotation

    .prologue
    .line 193
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    new-instance v0, Lcom/android/server/IntentResolver$IteratorWrapper;

    iget-object v1, p0, Lcom/android/server/IntentResolver;->mFilters:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/IntentResolver$IteratorWrapper;-><init>(Lcom/android/server/IntentResolver;Ljava/util/Iterator;)V

    return-object v0
.end method

.method public filterSet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TF;>;"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    iget-object v0, p0, Lcom/android/server/IntentResolver;->mFilters:Ljava/util/HashSet;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected newResult(Landroid/content/IntentFilter;I)Ljava/lang/Object;
    .registers 3
    .parameter
    .parameter "match"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;I)TR;"
        }
    .end annotation

    .prologue
    .line 330
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    return-object p1
.end method

.method protected packageForFilter(Landroid/content/IntentFilter;)Ljava/lang/String;
    .registers 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 326
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, filter:Landroid/content/IntentFilter;,"TF;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public queryIntent(Landroid/content/Intent;Ljava/lang/String;Z)Ljava/util/List;
    .registers 41
    .parameter "intent"
    .parameter "resolvedType"
    .parameter "defaultOnly"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v8

    .line 223
    .local v8, scheme:Ljava/lang/String;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 225
    .local v10, finalList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TR;>;"
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getFlags()I

    move-result v3

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_1dd

    const/4 v3, 0x1

    move v5, v3

    .line 228
    .local v5, debug:Z
    :goto_13
    if-eqz v5, :cond_47

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Resolving type "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " scheme "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " of intent "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_47
    const/4 v9, 0x0

    .line 233
    .local v9, firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    const/16 v17, 0x0

    .line 234
    .local v17, secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    const/16 v24, 0x0

    .line 235
    .local v24, thirdTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    const/16 v31, 0x0

    .line 239
    .local v31, schemeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz p2, :cond_102

    .line 240
    const/16 v3, 0x2f

    move-object/from16 v0, p2

    move v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v36

    .line 241
    .local v36, slashpos:I
    if-lez v36, :cond_102

    .line 242
    const/4 v3, 0x0

    move-object/from16 v0, p2

    move v1, v3

    move/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v33

    .line 243
    .local v33, baseType:Ljava/lang/String;
    const-string v3, "*"

    move-object/from16 v0, v33

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_236

    .line 244
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v4, v36, 0x2

    if-ne v3, v4, :cond_85

    add-int/lit8 v3, v36, 0x1

    move-object/from16 v0, p2

    move v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2a

    if-eq v3, v4, :cond_1e1

    .line 248
    :cond_85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mTypeToFilter:Ljava/util/HashMap;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v9, Ljava/util/ArrayList;

    .line 249
    .restart local v9       #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_ad

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "First type cut: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_ad
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    .end local v17           #secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v17, Ljava/util/ArrayList;

    .line 251
    .restart local v17       #secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_d8

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Second type cut: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    :cond_d8
    :goto_d8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    move-object v3, v0

    const-string v4, "*"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    .end local v24           #thirdTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v24, Ljava/util/ArrayList;

    .line 262
    .restart local v24       #thirdTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_102

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Third type cut: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    .end local v33           #baseType:Ljava/lang/String;
    .end local v36           #slashpos:I
    :cond_102
    :goto_102
    if-eqz v8, :cond_12c

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mSchemeToFilter:Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v3, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    .end local v31           #schemeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v31, Ljava/util/ArrayList;

    .line 278
    .restart local v31       #schemeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_12c

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Scheme list: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    :cond_12c
    if-nez p2, :cond_15f

    if-nez v8, :cond_15f

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_15f

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mActionToFilter:Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v9, Ljava/util/ArrayList;

    .line 286
    .restart local v9       #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_15f

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Action list: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    :cond_15f
    if-eqz v9, :cond_16c

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v6, p3

    move-object/from16 v7, p2

    .line 290
    invoke-direct/range {v3 .. v10}, Lcom/android/server/IntentResolver;->buildResolveList(Landroid/content/Intent;ZZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 293
    :cond_16c
    if-eqz v17, :cond_17e

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move v13, v5

    move/from16 v14, p3

    move-object/from16 v15, p2

    move-object/from16 v16, v8

    move-object/from16 v18, v10

    .line 294
    invoke-direct/range {v11 .. v18}, Lcom/android/server/IntentResolver;->buildResolveList(Landroid/content/Intent;ZZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 297
    :cond_17e
    if-eqz v24, :cond_191

    move-object/from16 v18, p0

    move-object/from16 v19, p1

    move/from16 v20, v5

    move/from16 v21, p3

    move-object/from16 v22, p2

    move-object/from16 v23, v8

    move-object/from16 v25, v10

    .line 298
    invoke-direct/range {v18 .. v25}, Lcom/android/server/IntentResolver;->buildResolveList(Landroid/content/Intent;ZZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 301
    :cond_191
    if-eqz v31, :cond_1a4

    move-object/from16 v25, p0

    move-object/from16 v26, p1

    move/from16 v27, v5

    move/from16 v28, p3

    move-object/from16 v29, p2

    move-object/from16 v30, v8

    move-object/from16 v32, v10

    .line 302
    invoke-direct/range {v25 .. v32}, Lcom/android/server/IntentResolver;->buildResolveList(Landroid/content/Intent;ZZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 305
    :cond_1a4
    move-object/from16 v0, p0

    move-object v1, v10

    invoke-virtual {v0, v1}, Lcom/android/server/IntentResolver;->sortResults(Ljava/util/List;)V

    .line 307
    if-eqz v5, :cond_267

    .line 308
    const-string v3, "IntentResolver"

    const-string v4, "Final result list:"

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v34

    .end local v5           #debug:Z
    .local v34, i$:Ljava/util/Iterator;
    :goto_1b7
    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_267

    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v35

    .line 310
    .local v35, r:Ljava/lang/Object;,"TR;"
    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b7

    .line 225
    .end local v9           #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v17           #secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v24           #thirdTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v31           #schemeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .end local v34           #i$:Ljava/util/Iterator;
    .end local v35           #r:Ljava/lang/Object;,"TR;"
    :cond_1dd
    const/4 v3, 0x0

    move v5, v3

    goto/16 :goto_13

    .line 254
    .restart local v5       #debug:Z
    .restart local v9       #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .restart local v17       #secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .restart local v24       #thirdTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .restart local v31       #schemeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    .restart local v33       #baseType:Ljava/lang/String;
    .restart local v36       #slashpos:I
    :cond_1e1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mBaseTypeToFilter:Ljava/util/HashMap;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v9, Ljava/util/ArrayList;

    .line 255
    .restart local v9       #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_209

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "First type cut: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    :cond_209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mWildTypeToFilter:Ljava/util/HashMap;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    .end local v17           #secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v17, Ljava/util/ArrayList;

    .line 257
    .restart local v17       #secondTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_d8

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Second type cut: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d8

    .line 263
    :cond_236
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_102

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/IntentResolver;->mTypedActionToFilter:Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    check-cast v9, Ljava/util/ArrayList;

    .line 268
    .restart local v9       #firstTypeCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TF;>;"
    if-eqz v5, :cond_102

    const-string v3, "IntentResolver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Typed Action list: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_102

    .line 313
    .end local v5           #debug:Z
    .end local v33           #baseType:Ljava/lang/String;
    .end local v36           #slashpos:I
    :cond_267
    return-object v10
.end method

.method public queryIntentFromList(Landroid/content/Intent;Ljava/lang/String;ZLjava/util/ArrayList;)Ljava/util/List;
    .registers 15
    .parameter "intent"
    .parameter "resolvedType"
    .parameter "defaultOnly"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<TF;>;>;)",
            "Ljava/util/List",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p4, listCut:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/ArrayList<TF;>;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .local v7, resultList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TR;>;"
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_2a

    const/4 v0, 0x1

    move v2, v0

    .line 210
    .local v2, debug:Z
    :goto_f
    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v5

    .line 211
    .local v5, scheme:Ljava/lang/String;
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 212
    .local v8, N:I
    const/4 v9, 0x0

    .local v9, i:I
    :goto_18
    if-ge v9, v8, :cond_2d

    .line 213
    invoke-virtual {p4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move-object v4, p2

    invoke-direct/range {v0 .. v7}, Lcom/android/server/IntentResolver;->buildResolveList(Landroid/content/Intent;ZZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 212
    add-int/lit8 v9, v9, 0x1

    goto :goto_18

    .line 207
    .end local v2           #debug:Z
    .end local v5           #scheme:Ljava/lang/String;
    .end local v8           #N:I
    .end local v9           #i:I
    :cond_2a
    const/4 v0, 0x0

    move v2, v0

    goto :goto_f

    .line 216
    .restart local v2       #debug:Z
    .restart local v5       #scheme:Ljava/lang/String;
    .restart local v8       #N:I
    .restart local v9       #i:I
    :cond_2d
    invoke-virtual {p0, v7}, Lcom/android/server/IntentResolver;->sortResults(Ljava/util/List;)V

    .line 217
    return-object v7
.end method

.method public removeFilter(Landroid/content/IntentFilter;)V
    .registers 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, f:Landroid/content/IntentFilter;,"TF;"
    invoke-virtual {p0, p1}, Lcom/android/server/IntentResolver;->removeFilterInternal(Landroid/content/IntentFilter;)V

    .line 72
    iget-object v0, p0, Lcom/android/server/IntentResolver;->mFilters:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 73
    return-void
.end method

.method removeFilterInternal(Landroid/content/IntentFilter;)V
    .registers 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, f:Landroid/content/IntentFilter;,"TF;"
    invoke-virtual {p1}, Landroid/content/IntentFilter;->schemesIterator()Ljava/util/Iterator;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/IntentResolver;->mSchemeToFilter:Ljava/util/HashMap;

    const-string v4, "      Scheme: "

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/android/server/IntentResolver;->unregister_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I

    move-result v0

    .line 84
    .local v0, numS:I
    const-string v2, "      Type: "

    invoke-direct {p0, p1, v2}, Lcom/android/server/IntentResolver;->unregister_mime_types(Landroid/content/IntentFilter;Ljava/lang/String;)I

    move-result v1

    .line 85
    .local v1, numT:I
    if-nez v0, :cond_21

    if-nez v1, :cond_21

    .line 86
    invoke-virtual {p1}, Landroid/content/IntentFilter;->actionsIterator()Ljava/util/Iterator;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/IntentResolver;->mActionToFilter:Ljava/util/HashMap;

    const-string v4, "      Action: "

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/android/server/IntentResolver;->unregister_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I

    .line 89
    :cond_21
    if-eqz v1, :cond_2e

    .line 90
    invoke-virtual {p1}, Landroid/content/IntentFilter;->actionsIterator()Ljava/util/Iterator;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/IntentResolver;->mTypedActionToFilter:Ljava/util/HashMap;

    const-string v4, "      TypedAction: "

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/android/server/IntentResolver;->unregister_intent_filter(Landroid/content/IntentFilter;Ljava/util/Iterator;Ljava/util/HashMap;Ljava/lang/String;)I

    .line 93
    :cond_2e
    return-void
.end method

.method protected sortResults(Ljava/util/List;)V
    .registers 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p0, this:Lcom/android/server/IntentResolver;,"Lcom/android/server/IntentResolver<TF;TR;>;"
    .local p1, results:Ljava/util/List;,"Ljava/util/List<TR;>;"
    sget-object v0, Lcom/android/server/IntentResolver;->mResolvePrioritySorter:Ljava/util/Comparator;

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 335
    return-void
.end method
