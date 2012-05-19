.class public final Lcom/android/server/DropBoxManagerService;
.super Lcom/android/internal/os/IDropBoxManagerService$Stub;
.source "DropBoxManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/DropBoxManagerService$EntryFile;,
        Lcom/android/server/DropBoxManagerService$FileList;
    }
.end annotation


# static fields
.field private static final DEFAULT_AGE_SECONDS:I = 0x3f480

.field private static final DEFAULT_MAX_FILES:I = 0x3e8

.field private static final DEFAULT_QUOTA_KB:I = 0x1400

.field private static final DEFAULT_QUOTA_PERCENT:I = 0xa

.field private static final DEFAULT_RESERVE_PERCENT:I = 0xa

.field private static final PROFILE_DUMP:Z = false

.field private static final QUOTA_RESCAN_MILLIS:I = 0x1388

.field private static final TAG:Ljava/lang/String; = "DropBoxManagerService"


# instance fields
.field private mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

.field private mBlockSize:I

.field private mCachedQuotaBlocks:I

.field private mCachedQuotaUptimeMillis:J

.field private final mContentResolver:Landroid/content/ContentResolver;

.field private final mContext:Landroid/content/Context;

.field private final mDropBoxDir:Ljava/io/File;

.field private mFilesByTag:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/DropBoxManagerService$FileList;",
            ">;"
        }
    .end annotation
.end field

.field private mLastTimestamp:J

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStatFs:Landroid/os/StatFs;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .registers 8
    .parameter "context"
    .parameter "path"

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 129
    invoke-direct {p0}, Lcom/android/internal/os/IDropBoxManagerService$Stub;-><init>()V

    .line 87
    iput-object v0, p0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    .line 88
    iput-object v0, p0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    .line 92
    iput-object v0, p0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    .line 93
    iput v1, p0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    .line 94
    iput v1, p0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    .line 95
    iput-wide v2, p0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaUptimeMillis:J

    .line 98
    iput-wide v2, p0, Lcom/android/server/DropBoxManagerService;->mLastTimestamp:J

    .line 101
    new-instance v0, Lcom/android/server/DropBoxManagerService$1;

    invoke-direct {v0, p0}, Lcom/android/server/DropBoxManagerService$1;-><init>(Lcom/android/server/DropBoxManagerService;)V

    iput-object v0, p0, Lcom/android/server/DropBoxManagerService;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 130
    iput-object p2, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    .line 133
    iput-object p1, p0, Lcom/android/server/DropBoxManagerService;->mContext:Landroid/content/Context;

    .line 134
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    .line 135
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 137
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-instance v3, Lcom/android/server/DropBoxManagerService$2;

    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    invoke-direct {v3, p0, v4, p1}, Lcom/android/server/DropBoxManagerService$2;-><init>(Lcom/android/server/DropBoxManagerService;Landroid/os/Handler;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 147
    return-void
.end method

.method static synthetic access$002(Lcom/android/server/DropBoxManagerService;J)J
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-wide p1, p0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaUptimeMillis:J

    return-wide p1
.end method

.method static synthetic access$100(Lcom/android/server/DropBoxManagerService;)V
    .registers 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/android/server/DropBoxManagerService;->init()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/DropBoxManagerService;)J
    .registers 3
    .parameter "x0"

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/android/server/DropBoxManagerService;->trimToFit()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300(Lcom/android/server/DropBoxManagerService;)Landroid/content/BroadcastReceiver;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method private declared-synchronized createEntry(Ljava/io/File;Ljava/lang/String;I)V
    .registers 26
    .parameter "temp"
    .parameter "tag"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 601
    monitor-enter p0

    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 607
    .local v9, t:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    new-instance v6, Lcom/android/server/DropBoxManagerService$EntryFile;

    const-wide/16 v7, 0x2710

    add-long/2addr v7, v9

    invoke-direct {v6, v7, v8}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/util/TreeSet;->tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object v21

    .line 608
    .local v21, tail:Ljava/util/SortedSet;,"Ljava/util/SortedSet<Lcom/android/server/DropBoxManagerService$EntryFile;>;"
    const/4 v14, 0x0

    .line 609
    .local v14, future:[Lcom/android/server/DropBoxManagerService$EntryFile;
    invoke-interface/range {v21 .. v21}, Ljava/util/SortedSet;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_31

    .line 610
    invoke-interface/range {v21 .. v21}, Ljava/util/SortedSet;->size()I

    move-result v5

    new-array v5, v5, [Lcom/android/server/DropBoxManagerService$EntryFile;

    move-object/from16 v0, v21

    move-object v1, v5

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v14

    .end local v14           #future:[Lcom/android/server/DropBoxManagerService$EntryFile;
    check-cast v14, [Lcom/android/server/DropBoxManagerService$EntryFile;

    .line 611
    .restart local v14       #future:[Lcom/android/server/DropBoxManagerService$EntryFile;
    invoke-interface/range {v21 .. v21}, Ljava/util/SortedSet;->clear()V

    .line 614
    :cond_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    invoke-virtual {v5}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_54

    .line 615
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    invoke-virtual {v5}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/DropBoxManagerService$EntryFile;

    iget-wide v5, v5, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    invoke-static {v9, v10, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    .line 618
    :cond_54
    if-eqz v14, :cond_f4

    .line 619
    move-object v13, v14

    .local v13, arr$:[Lcom/android/server/DropBoxManagerService$EntryFile;
    move-object v0, v13

    array-length v0, v0

    move/from16 v17, v0

    .local v17, len$:I
    const/4 v15, 0x0

    .local v15, i$:I
    :goto_5c
    move v0, v15

    move/from16 v1, v17

    if-ge v0, v1, :cond_f4

    aget-object v16, v13, v15

    .line 620
    .local v16, late:Lcom/android/server/DropBoxManagerService$EntryFile;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object v5, v0

    iget v6, v5, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    move v7, v0

    sub-int/2addr v6, v7

    iput v6, v5, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    .line 621
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    move-object v5, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v6, v0

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/android/server/DropBoxManagerService$FileList;

    .line 622
    .local v20, tagFiles:Lcom/android/server/DropBoxManagerService$FileList;
    if-eqz v20, :cond_a2

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a2

    .line 623
    move-object/from16 v0, v20

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move v5, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    move v6, v0

    sub-int/2addr v5, v6

    move v0, v5

    move-object/from16 v1, v20

    iput v0, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    .line 625
    :cond_a2
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v5, v0

    and-int/lit8 v5, v5, 0x1

    if-nez v5, :cond_d8

    .line 626
    new-instance v5, Lcom/android/server/DropBoxManagerService$EntryFile;

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object v6, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object v7, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v8, v0

    const-wide/16 v11, 0x1

    add-long v18, v9, v11

    .end local v9           #t:J
    .local v18, t:J
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v11, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    move v12, v0

    invoke-direct/range {v5 .. v12}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;JII)V

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/android/server/DropBoxManagerService;->enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V

    move-wide/from16 v9, v18

    .line 619
    .end local v18           #t:J
    .restart local v9       #t:J
    :goto_d5
    add-int/lit8 v15, v15, 0x1

    goto :goto_5c

    .line 629
    :cond_d8
    new-instance v5, Lcom/android/server/DropBoxManagerService$EntryFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object v6, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v7, v0

    const-wide/16 v11, 0x1

    add-long v18, v9, v11

    .end local v9           #t:J
    .restart local v18       #t:J
    invoke-direct {v5, v6, v7, v9, v10}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(Ljava/io/File;Ljava/lang/String;J)V

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/android/server/DropBoxManagerService;->enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V

    move-wide/from16 v9, v18

    .end local v18           #t:J
    .restart local v9       #t:J
    goto :goto_d5

    .line 634
    .end local v13           #arr$:[Lcom/android/server/DropBoxManagerService$EntryFile;
    .end local v15           #i$:I
    .end local v16           #late:Lcom/android/server/DropBoxManagerService$EntryFile;
    .end local v17           #len$:I
    .end local v20           #tagFiles:Lcom/android/server/DropBoxManagerService$FileList;
    :cond_f4
    if-nez p1, :cond_10d

    .line 635
    new-instance v5, Lcom/android/server/DropBoxManagerService$EntryFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object v6, v0

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, p2

    move-wide v3, v9

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(Ljava/io/File;Ljava/lang/String;J)V

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/android/server/DropBoxManagerService;->enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V
    :try_end_10b
    .catchall {:try_start_1 .. :try_end_10b} :catchall_129

    .line 639
    :goto_10b
    monitor-exit p0

    return-void

    .line 637
    :cond_10d
    :try_start_10d
    new-instance v5, Lcom/android/server/DropBoxManagerService$EntryFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object v7, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    move v12, v0

    move-object/from16 v6, p1

    move-object/from16 v8, p2

    move/from16 v11, p3

    invoke-direct/range {v5 .. v12}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;JII)V

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/android/server/DropBoxManagerService;->enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V
    :try_end_128
    .catchall {:try_start_10d .. :try_end_128} :catchall_129

    goto :goto_10b

    .line 601
    .end local v9           #t:J
    .end local v14           #future:[Lcom/android/server/DropBoxManagerService$EntryFile;
    .end local v21           #tail:Ljava/util/SortedSet;,"Ljava/util/SortedSet<Lcom/android/server/DropBoxManagerService$EntryFile;>;"
    :catchall_129
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private declared-synchronized enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V
    .registers 6
    .parameter "entry"

    .prologue
    .line 582
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    iget-object v1, v1, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    invoke-virtual {v1, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 583
    iget-object v1, p0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    iget v2, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    iget v3, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    add-int/2addr v2, v3

    iput v2, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    .line 588
    iget-object v1, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    if-eqz v1, :cond_42

    iget-object v1, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    if-eqz v1, :cond_42

    iget v1, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    if-lez v1, :cond_42

    .line 589
    iget-object v1, p0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/DropBoxManagerService$FileList;

    .line 590
    .local v0, tagFiles:Lcom/android/server/DropBoxManagerService$FileList;
    if-nez v0, :cond_36

    .line 591
    new-instance v0, Lcom/android/server/DropBoxManagerService$FileList;

    .end local v0           #tagFiles:Lcom/android/server/DropBoxManagerService$FileList;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/server/DropBoxManagerService$FileList;-><init>(Lcom/android/server/DropBoxManagerService$1;)V

    .line 592
    .restart local v0       #tagFiles:Lcom/android/server/DropBoxManagerService$FileList;
    iget-object v1, p0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    :cond_36
    iget-object v1, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    invoke-virtual {v1, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 595
    iget v1, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    iget v2, p1, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I
    :try_end_42
    .catchall {:try_start_1 .. :try_end_42} :catchall_44

    .line 597
    .end local v0           #tagFiles:Lcom/android/server/DropBoxManagerService$FileList;
    :cond_42
    monitor-exit p0

    return-void

    .line 582
    :catchall_44
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized init()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v7, "DropBoxManagerService"

    .line 538
    monitor-enter p0

    :try_start_3
    iget-object v7, p0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    if-nez v7, :cond_4a

    .line 539
    iget-object v7, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_35

    iget-object v7, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_35

    .line 540
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t mkdir: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_32

    .line 538
    :catchall_32
    move-exception v7

    monitor-exit p0

    throw v7

    .line 543
    :cond_35
    :try_start_35
    new-instance v7, Landroid/os/StatFs;

    iget-object v8, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    .line 544
    iget-object v7, p0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    invoke-virtual {v7}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    iput v7, p0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I
    :try_end_4a
    .catchall {:try_start_35 .. :try_end_4a} :catchall_32
    .catch Ljava/lang/IllegalArgumentException; {:try_start_35 .. :try_end_4a} :catch_71

    .line 550
    :cond_4a
    :try_start_4a
    iget-object v7, p0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    if-nez v7, :cond_11a

    .line 551
    iget-object v7, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 552
    .local v4, files:[Ljava/io/File;
    if-nez v4, :cond_8e

    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t list files: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 545
    .end local v4           #files:[Ljava/io/File;
    :catch_71
    move-exception v7

    move-object v1, v7

    .line 546
    .local v1, e:Ljava/lang/IllegalArgumentException;
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t statfs: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 554
    .end local v1           #e:Ljava/lang/IllegalArgumentException;
    .restart local v4       #files:[Ljava/io/File;
    :cond_8e
    new-instance v7, Lcom/android/server/DropBoxManagerService$FileList;

    const/4 v8, 0x0

    invoke-direct {v7, v8}, Lcom/android/server/DropBoxManagerService$FileList;-><init>(Lcom/android/server/DropBoxManagerService$1;)V

    iput-object v7, p0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    .line 555
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    .line 558
    move-object v0, v4

    .local v0, arr$:[Ljava/io/File;
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_a0
    if-ge v5, v6, :cond_11a

    aget-object v3, v0, v5

    .line 559
    .local v3, file:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, ".tmp"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_ce

    .line 560
    const-string v7, "DropBoxManagerService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cleaning temp file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 558
    :goto_cb
    add-int/lit8 v5, v5, 0x1

    goto :goto_a0

    .line 565
    :cond_ce
    new-instance v2, Lcom/android/server/DropBoxManagerService$EntryFile;

    iget v7, p0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    invoke-direct {v2, v3, v7}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(Ljava/io/File;I)V

    .line 566
    .local v2, entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    iget-object v7, v2, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    if-nez v7, :cond_f2

    .line 567
    const-string v7, "DropBoxManagerService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unrecognized file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_cb

    .line 569
    :cond_f2
    iget-wide v7, v2, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-nez v7, :cond_116

    .line 570
    const-string v7, "DropBoxManagerService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid filename: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_cb

    .line 575
    :cond_116
    invoke-direct {p0, v2}, Lcom/android/server/DropBoxManagerService;->enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V
    :try_end_119
    .catchall {:try_start_4a .. :try_end_119} :catchall_32

    goto :goto_cb

    .line 578
    .end local v0           #arr$:[Ljava/io/File;
    .end local v2           #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    .end local v3           #file:Ljava/io/File;
    .end local v4           #files:[Ljava/io/File;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :cond_11a
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized trimToFit()J
    .registers 29

    .prologue
    .line 648
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v23, v0

    const-string v24, "dropbox_age_seconds"

    const v25, 0x3f480

    invoke-static/range {v23 .. v25}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 650
    .local v3, ageSeconds:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v23, v0

    const-string v24, "dropbox_max_files"

    const/16 v25, 0x3e8

    invoke-static/range {v23 .. v25}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v10

    .line 652
    .local v10, maxFiles:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v23

    move v0, v3

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    sub-long v5, v23, v25

    .line 653
    .local v5, cutoffMillis:J
    :cond_2e
    :goto_2e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v23

    if-nez v23, :cond_70

    .line 654
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/DropBoxManagerService$EntryFile;

    .line 655
    .local v8, entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    move-object v0, v8

    iget-wide v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    move-wide/from16 v23, v0

    cmp-long v23, v23, v5

    if-lez v23, :cond_1ab

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/TreeSet;->size()I

    move-result v23

    move/from16 v0, v23

    move v1, v10

    if-ge v0, v1, :cond_1ab

    .line 668
    .end local v8           #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    :cond_70
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v21

    .line 669
    .local v21, uptimeMillis:J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaUptimeMillis:J

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x1388

    add-long v23, v23, v25

    cmp-long v23, v21, v23

    if-lez v23, :cond_103

    .line 670
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v23, v0

    const-string v24, "dropbox_quota_percent"

    const/16 v25, 0xa

    invoke-static/range {v23 .. v25}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v14

    .line 672
    .local v14, quotaPercent:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v23, v0

    const-string v24, "dropbox_reserve_percent"

    const/16 v25, 0xa

    invoke-static/range {v23 .. v25}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v15

    .line 674
    .local v15, reservePercent:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    move-object/from16 v23, v0

    const-string v24, "dropbox_quota_kb"

    const/16 v25, 0x1400

    invoke-static/range {v23 .. v25}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v13

    .line 677
    .local v13, quotaKb:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/os/StatFs;->restat(Ljava/lang/String;)V

    .line 678
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v4

    .line 679
    .local v4, available:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mStatFs:Landroid/os/StatFs;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/os/StatFs;->getBlockCount()I

    move-result v23

    mul-int v23, v23, v15

    div-int/lit8 v23, v23, 0x64

    sub-int v12, v4, v23

    .line 680
    .local v12, nonreserved:I
    move v0, v13

    mul-int/lit16 v0, v0, 0x400

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    move/from16 v24, v0

    div-int v11, v23, v24

    .line 681
    .local v11, maximum:I
    const/16 v23, 0x0

    mul-int v24, v12, v14

    div-int/lit8 v24, v24, 0x64

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->max(II)I

    move-result v23

    move v0, v11

    move/from16 v1, v23

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v23

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    .line 682
    move-wide/from16 v0, v21

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/server/DropBoxManagerService;->mCachedQuotaUptimeMillis:J

    .line 699
    .end local v4           #available:I
    .end local v11           #maximum:I
    .end local v12           #nonreserved:I
    .end local v13           #quotaKb:I
    .end local v14           #quotaPercent:I
    .end local v15           #reservePercent:I
    :cond_103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_196

    .line 701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v20, v0

    .local v20, unsqueezed:I
    const/16 v16, 0x0

    .line 702
    .local v16, squeezed:I
    new-instance v19, Ljava/util/TreeSet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v23

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 703
    .local v19, tags:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Lcom/android/server/DropBoxManagerService$FileList;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_140
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_164

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/server/DropBoxManagerService$FileList;

    .line 704
    .local v17, tag:Lcom/android/server/DropBoxManagerService$FileList;
    if-lez v16, :cond_222

    move-object/from16 v0, v17

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    move/from16 v24, v0

    sub-int v24, v24, v20

    div-int v24, v24, v16

    move/from16 v0, v23

    move/from16 v1, v24

    if-gt v0, v1, :cond_222

    .line 710
    .end local v17           #tag:Lcom/android/server/DropBoxManagerService$FileList;
    :cond_164
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    move/from16 v23, v0

    sub-int v23, v23, v20

    div-int v18, v23, v16

    .line 713
    .local v18, tagQuota:I
    invoke-virtual/range {v19 .. v19}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_172
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_196

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/server/DropBoxManagerService$FileList;

    .line 714
    .restart local v17       #tag:Lcom/android/server/DropBoxManagerService$FileList;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_22e

    .line 730
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v16           #squeezed:I
    .end local v17           #tag:Lcom/android/server/DropBoxManagerService$FileList;
    .end local v18           #tagQuota:I
    .end local v19           #tags:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Lcom/android/server/DropBoxManagerService$FileList;>;"
    .end local v20           #unsqueezed:I
    :cond_196
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mCachedQuotaBlocks:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    move/from16 v24, v0
    :try_end_1a2
    .catchall {:try_start_1 .. :try_end_1a2} :catchall_21f

    mul-int v23, v23, v24

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    monitor-exit p0

    return-wide v23

    .line 657
    .end local v21           #uptimeMillis:J
    .restart local v8       #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    :cond_1ab
    :try_start_1ab
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    move-object/from16 v23, v0

    move-object v0, v8

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/server/DropBoxManagerService$FileList;

    .line 658
    .restart local v17       #tag:Lcom/android/server/DropBoxManagerService$FileList;
    if-eqz v17, :cond_1e0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1e0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    move-object v0, v8

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    move/from16 v24, v0

    sub-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, v17

    iput v0, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    .line 659
    :cond_1e0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_20e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v24, v0

    move-object v0, v8

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    move/from16 v25, v0

    sub-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    .line 660
    :cond_20e
    move-object v0, v8

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object/from16 v23, v0

    if-eqz v23, :cond_2e

    move-object v0, v8

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z
    :try_end_21d
    .catchall {:try_start_1ab .. :try_end_21d} :catchall_21f

    goto/16 :goto_2e

    .line 648
    .end local v3           #ageSeconds:I
    .end local v5           #cutoffMillis:J
    .end local v8           #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    .end local v10           #maxFiles:I
    .end local v17           #tag:Lcom/android/server/DropBoxManagerService$FileList;
    :catchall_21f
    move-exception v23

    monitor-exit p0

    throw v23

    .line 707
    .restart local v3       #ageSeconds:I
    .restart local v5       #cutoffMillis:J
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v10       #maxFiles:I
    .restart local v16       #squeezed:I
    .restart local v17       #tag:Lcom/android/server/DropBoxManagerService$FileList;
    .restart local v19       #tags:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Lcom/android/server/DropBoxManagerService$FileList;>;"
    .restart local v20       #unsqueezed:I
    .restart local v21       #uptimeMillis:J
    :cond_222
    :try_start_222
    move-object/from16 v0, v17

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    sub-int v20, v20, v23

    .line 708
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_140

    .line 715
    .restart local v18       #tagQuota:I
    :cond_22e
    :goto_22e
    move-object/from16 v0, v17

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    move/from16 v0, v23

    move/from16 v1, v18

    if-le v0, v1, :cond_172

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v23

    if-nez v23, :cond_172

    .line 716
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/DropBoxManagerService$EntryFile;

    .line 717
    .restart local v8       #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_274

    move-object/from16 v0, v17

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v23, v0

    move-object v0, v8

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    move/from16 v24, v0

    sub-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, v17

    iput v0, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    .line 718
    :cond_274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_2a2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I

    move/from16 v24, v0

    move-object v0, v8

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->blocks:I

    move/from16 v25, v0

    sub-int v24, v24, v25

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lcom/android/server/DropBoxManagerService$FileList;->blocks:I
    :try_end_2a2
    .catchall {:try_start_222 .. :try_end_2a2} :catchall_21f

    .line 721
    :cond_2a2
    :try_start_2a2
    move-object v0, v8

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object/from16 v23, v0

    if-eqz v23, :cond_2b1

    move-object v0, v8

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    .line 722
    :cond_2b1
    new-instance v23, Lcom/android/server/DropBoxManagerService$EntryFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object/from16 v24, v0

    move-object v0, v8

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object v0, v8

    iget-wide v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    move-wide/from16 v26, v0

    invoke-direct/range {v23 .. v27}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(Ljava/io/File;Ljava/lang/String;J)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/android/server/DropBoxManagerService;->enrollEntry(Lcom/android/server/DropBoxManagerService$EntryFile;)V
    :try_end_2cd
    .catchall {:try_start_2a2 .. :try_end_2cd} :catchall_21f
    .catch Ljava/io/IOException; {:try_start_2a2 .. :try_end_2cd} :catch_2cf

    goto/16 :goto_22e

    .line 723
    :catch_2cf
    move-exception v23

    move-object/from16 v7, v23

    .line 724
    .local v7, e:Ljava/io/IOException;
    :try_start_2d2
    const-string v23, "DropBoxManagerService"

    const-string v24, "Can\'t write tombstone file"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object v2, v7

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2de
    .catchall {:try_start_2d2 .. :try_end_2de} :catchall_21f

    goto/16 :goto_22e
.end method


# virtual methods
.method public add(Landroid/os/DropBoxManager$Entry;)V
    .registers 31
    .parameter "entry"

    .prologue
    .line 155
    const/16 v23, 0x0

    .line 156
    .local v23, temp:Ljava/io/File;
    const/16 v19, 0x0

    .line 157
    .local v19, output:Ljava/io/OutputStream;
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->getTag()Ljava/lang/String;

    move-result-object v22

    .line 159
    .local v22, tag:Ljava/lang/String;
    :try_start_8
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->getFlags()I

    move-result v7

    .line 160
    .local v7, flags:I
    and-int/lit8 v25, v7, 0x1

    if-eqz v25, :cond_48

    new-instance v25, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v25 .. v25}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v25
    :try_end_16
    .catchall {:try_start_8 .. :try_end_16} :catchall_19e
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_16} :catch_16

    .line 223
    .end local v7           #flags:I
    :catch_16
    move-exception v25

    move-object/from16 v6, v25

    .line 224
    .local v6, e:Ljava/io/IOException;
    :goto_19
    :try_start_19
    const-string v25, "DropBoxManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Can\'t write: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object v2, v6

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3a
    .catchall {:try_start_19 .. :try_end_3a} :catchall_19e

    .line 226
    if-eqz v19, :cond_3f

    :try_start_3c
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3f} :catch_1af

    .line 227
    :cond_3f
    :goto_3f
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->close()V

    .line 228
    if-eqz v23, :cond_47

    .end local v6           #e:Ljava/io/IOException;
    :goto_44
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    .line 230
    :cond_47
    return-void

    .line 162
    .restart local v7       #flags:I
    :cond_48
    :try_start_48
    invoke-direct/range {p0 .. p0}, Lcom/android/server/DropBoxManagerService;->init()V

    .line 163
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/server/DropBoxManagerService;->isTagEnabled(Ljava/lang/String;)Z
    :try_end_52
    .catchall {:try_start_48 .. :try_end_52} :catchall_19e
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_52} :catch_16

    move-result v25

    if-nez v25, :cond_5e

    .line 226
    if-eqz v19, :cond_58

    :try_start_57
    throw v19
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_58} :catch_1b2

    .line 227
    :cond_58
    :goto_58
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->close()V

    .line 228
    if-eqz v23, :cond_47

    goto :goto_44

    .line 164
    :cond_5e
    :try_start_5e
    invoke-direct/range {p0 .. p0}, Lcom/android/server/DropBoxManagerService;->trimToFit()J

    move-result-wide v14

    .line 165
    .local v14, max:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 167
    .local v10, lastTrim:J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v0, v0, [B

    move-object v4, v0

    .line 168
    .local v4, buffer:[B
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 173
    .local v9, input:Ljava/io/InputStream;
    const/16 v21, 0x0

    .line 174
    .local v21, read:I
    :goto_77
    move-object v0, v4

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v21

    move/from16 v1, v25

    if-ge v0, v1, :cond_93

    .line 175
    move-object v0, v4

    array-length v0, v0

    move/from16 v25, v0

    sub-int v25, v25, v21

    move-object v0, v9

    move-object v1, v4

    move/from16 v2, v21

    move/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v16

    .line 176
    .local v16, n:I
    if-gtz v16, :cond_18a

    .line 183
    .end local v16           #n:I
    :cond_93
    new-instance v24, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mDropBoxDir:Ljava/io/File;

    move-object/from16 v25, v0

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "drop"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Thread;->getId()J

    move-result-wide v27

    invoke-virtual/range {v26 .. v28}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ".tmp"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_bf
    .catchall {:try_start_5e .. :try_end_bf} :catchall_19e
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_bf} :catch_16

    .line 184
    .end local v23           #temp:Ljava/io/File;
    .local v24, temp:Ljava/io/File;
    :try_start_bf
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/DropBoxManagerService;->mBlockSize:I

    move v5, v0

    .line 185
    .local v5, bufferSize:I
    const/16 v25, 0x1000

    move v0, v5

    move/from16 v1, v25

    if-le v0, v1, :cond_cd

    const/16 v5, 0x1000

    .line 186
    :cond_cd
    const/16 v25, 0x200

    move v0, v5

    move/from16 v1, v25

    if-ge v0, v1, :cond_d6

    const/16 v5, 0x200

    .line 187
    :cond_d6
    new-instance v8, Ljava/io/FileOutputStream;

    move-object v0, v8

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 188
    .local v8, foutput:Ljava/io/FileOutputStream;
    new-instance v20, Ljava/io/BufferedOutputStream;

    move-object/from16 v0, v20

    move-object v1, v8

    move v2, v5

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_e7
    .catchall {:try_start_bf .. :try_end_e7} :catchall_1b7
    .catch Ljava/io/IOException; {:try_start_bf .. :try_end_e7} :catch_192

    .line 189
    .end local v19           #output:Ljava/io/OutputStream;
    .local v20, output:Ljava/io/OutputStream;
    :try_start_e7
    move-object v0, v4

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v21

    move/from16 v1, v25

    if-ne v0, v1, :cond_1ca

    and-int/lit8 v25, v7, 0x4

    if-nez v25, :cond_1ca

    .line 190
    new-instance v19, Ljava/util/zip/GZIPOutputStream;

    invoke-direct/range {v19 .. v20}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_fa
    .catchall {:try_start_e7 .. :try_end_fa} :catchall_1bb
    .catch Ljava/io/IOException; {:try_start_e7 .. :try_end_fa} :catch_1c1

    .line 191
    .end local v20           #output:Ljava/io/OutputStream;
    .restart local v19       #output:Ljava/io/OutputStream;
    or-int/lit8 v7, v7, 0x4

    .line 195
    :cond_fc
    :goto_fc
    const/16 v25, 0x0

    :try_start_fe
    move-object/from16 v0, v19

    move-object v1, v4

    move/from16 v2, v25

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 197
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 198
    .local v17, now:J
    sub-long v25, v17, v10

    const-wide/16 v27, 0x7530

    cmp-long v25, v25, v27

    if-lez v25, :cond_11a

    .line 199
    invoke-direct/range {p0 .. p0}, Lcom/android/server/DropBoxManagerService;->trimToFit()J

    move-result-wide v14

    .line 200
    move-wide/from16 v10, v17

    .line 203
    :cond_11a
    invoke-virtual {v9, v4}, Ljava/io/InputStream;->read([B)I

    move-result v21

    .line 204
    if-gtz v21, :cond_18e

    .line 205
    invoke-static {v8}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 206
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->close()V

    .line 207
    const/16 v19, 0x0

    .line 212
    :goto_128
    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->length()J

    move-result-wide v12

    .line 213
    .local v12, len:J
    cmp-long v25, v12, v14

    if-lez v25, :cond_199

    .line 214
    const-string v25, "DropBoxManagerService"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Dropping: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " ("

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->length()J

    move-result-wide v27

    invoke-virtual/range {v26 .. v28}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " > "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-wide v1, v14

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " bytes)"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->delete()Z
    :try_end_170
    .catchall {:try_start_fe .. :try_end_170} :catchall_1b7
    .catch Ljava/io/IOException; {:try_start_fe .. :try_end_170} :catch_192

    .line 216
    const/16 v23, 0x0

    .line 221
    .end local v24           #temp:Ljava/io/File;
    .restart local v23       #temp:Ljava/io/File;
    :goto_172
    :try_start_172
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, v22

    move v3, v7

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/DropBoxManagerService;->createEntry(Ljava/io/File;Ljava/lang/String;I)V
    :try_end_17c
    .catchall {:try_start_172 .. :try_end_17c} :catchall_19e
    .catch Ljava/io/IOException; {:try_start_172 .. :try_end_17c} :catch_16

    .line 222
    const/16 v23, 0x0

    .line 226
    if-eqz v19, :cond_183

    :try_start_180
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->close()V
    :try_end_183
    .catch Ljava/io/IOException; {:try_start_180 .. :try_end_183} :catch_1b5

    .line 227
    :cond_183
    :goto_183
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->close()V

    .line 228
    if-eqz v23, :cond_47

    goto/16 :goto_44

    .line 177
    .end local v5           #bufferSize:I
    .end local v8           #foutput:Ljava/io/FileOutputStream;
    .end local v12           #len:J
    .end local v17           #now:J
    .restart local v16       #n:I
    :cond_18a
    add-int v21, v21, v16

    .line 178
    goto/16 :goto_77

    .line 209
    .end local v16           #n:I
    .end local v23           #temp:Ljava/io/File;
    .restart local v5       #bufferSize:I
    .restart local v8       #foutput:Ljava/io/FileOutputStream;
    .restart local v17       #now:J
    .restart local v24       #temp:Ljava/io/File;
    :cond_18e
    :try_start_18e
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->flush()V
    :try_end_191
    .catchall {:try_start_18e .. :try_end_191} :catchall_1b7
    .catch Ljava/io/IOException; {:try_start_18e .. :try_end_191} :catch_192

    goto :goto_128

    .line 223
    .end local v5           #bufferSize:I
    .end local v8           #foutput:Ljava/io/FileOutputStream;
    .end local v17           #now:J
    :catch_192
    move-exception v25

    move-object/from16 v6, v25

    move-object/from16 v23, v24

    .end local v24           #temp:Ljava/io/File;
    .restart local v23       #temp:Ljava/io/File;
    goto/16 :goto_19

    .line 219
    .end local v23           #temp:Ljava/io/File;
    .restart local v5       #bufferSize:I
    .restart local v8       #foutput:Ljava/io/FileOutputStream;
    .restart local v12       #len:J
    .restart local v17       #now:J
    .restart local v24       #temp:Ljava/io/File;
    :cond_199
    if-gtz v21, :cond_fc

    move-object/from16 v23, v24

    .end local v24           #temp:Ljava/io/File;
    .restart local v23       #temp:Ljava/io/File;
    goto :goto_172

    .line 226
    .end local v4           #buffer:[B
    .end local v5           #bufferSize:I
    .end local v7           #flags:I
    .end local v8           #foutput:Ljava/io/FileOutputStream;
    .end local v9           #input:Ljava/io/InputStream;
    .end local v10           #lastTrim:J
    .end local v12           #len:J
    .end local v14           #max:J
    .end local v17           #now:J
    .end local v21           #read:I
    :catchall_19e
    move-exception v25

    :goto_19f
    if-eqz v19, :cond_1a4

    :try_start_1a1
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->close()V
    :try_end_1a4
    .catch Ljava/io/IOException; {:try_start_1a1 .. :try_end_1a4} :catch_1ad

    .line 227
    :cond_1a4
    :goto_1a4
    invoke-virtual/range {p1 .. p1}, Landroid/os/DropBoxManager$Entry;->close()V

    .line 228
    if-eqz v23, :cond_1ac

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    .line 226
    :cond_1ac
    throw v25

    :catch_1ad
    move-exception v26

    goto :goto_1a4

    .restart local v6       #e:Ljava/io/IOException;
    :catch_1af
    move-exception v25

    goto/16 :goto_3f

    .end local v6           #e:Ljava/io/IOException;
    .restart local v7       #flags:I
    :catch_1b2
    move-exception v25

    goto/16 :goto_58

    .restart local v4       #buffer:[B
    .restart local v5       #bufferSize:I
    .restart local v8       #foutput:Ljava/io/FileOutputStream;
    .restart local v9       #input:Ljava/io/InputStream;
    .restart local v10       #lastTrim:J
    .restart local v12       #len:J
    .restart local v14       #max:J
    .restart local v17       #now:J
    .restart local v21       #read:I
    :catch_1b5
    move-exception v25

    goto :goto_183

    .end local v5           #bufferSize:I
    .end local v8           #foutput:Ljava/io/FileOutputStream;
    .end local v12           #len:J
    .end local v17           #now:J
    .end local v23           #temp:Ljava/io/File;
    .restart local v24       #temp:Ljava/io/File;
    :catchall_1b7
    move-exception v25

    move-object/from16 v23, v24

    .end local v24           #temp:Ljava/io/File;
    .restart local v23       #temp:Ljava/io/File;
    goto :goto_19f

    .end local v19           #output:Ljava/io/OutputStream;
    .end local v23           #temp:Ljava/io/File;
    .restart local v5       #bufferSize:I
    .restart local v8       #foutput:Ljava/io/FileOutputStream;
    .restart local v20       #output:Ljava/io/OutputStream;
    .restart local v24       #temp:Ljava/io/File;
    :catchall_1bb
    move-exception v25

    move-object/from16 v19, v20

    .end local v20           #output:Ljava/io/OutputStream;
    .restart local v19       #output:Ljava/io/OutputStream;
    move-object/from16 v23, v24

    .end local v24           #temp:Ljava/io/File;
    .restart local v23       #temp:Ljava/io/File;
    goto :goto_19f

    .line 223
    .end local v19           #output:Ljava/io/OutputStream;
    .end local v23           #temp:Ljava/io/File;
    .restart local v20       #output:Ljava/io/OutputStream;
    .restart local v24       #temp:Ljava/io/File;
    :catch_1c1
    move-exception v25

    move-object/from16 v6, v25

    move-object/from16 v19, v20

    .end local v20           #output:Ljava/io/OutputStream;
    .restart local v19       #output:Ljava/io/OutputStream;
    move-object/from16 v23, v24

    .end local v24           #temp:Ljava/io/File;
    .restart local v23       #temp:Ljava/io/File;
    goto/16 :goto_19

    .end local v19           #output:Ljava/io/OutputStream;
    .end local v23           #temp:Ljava/io/File;
    .restart local v20       #output:Ljava/io/OutputStream;
    .restart local v24       #temp:Ljava/io/File;
    :cond_1ca
    move-object/from16 v19, v20

    .end local v20           #output:Ljava/io/OutputStream;
    .restart local v19       #output:Ljava/io/OutputStream;
    goto/16 :goto_fc
.end method

.method public declared-synchronized dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 36
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 271
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mContext:Landroid/content/Context;

    move-object v5, v0

    const-string v6, "android.permission.DUMP"

    invoke-virtual {v5, v6}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_18

    .line 273
    const-string v5, "Permission Denial: Can\'t dump DropBoxManagerService"

    move-object/from16 v0, p2

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_77

    .line 394
    :goto_16
    monitor-exit p0

    return-void

    .line 278
    :cond_18
    :try_start_18
    invoke-direct/range {p0 .. p0}, Lcom/android/server/DropBoxManagerService;->init()V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_77
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1b} :catch_4e

    .line 287
    :try_start_1b
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    .line 288
    .local v26, out:Ljava/lang/StringBuilder;
    const/16 v16, 0x0

    .local v16, doPrint:Z
    const/4 v15, 0x0

    .line 289
    .local v15, doFile:Z
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 290
    .local v28, searchArgs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v19, 0x0

    .local v19, i:I
    :goto_2a
    if-eqz p3, :cond_b8

    move-object/from16 v0, p3

    array-length v0, v0

    move v5, v0

    move/from16 v0, v19

    move v1, v5

    if-ge v0, v1, :cond_b8

    .line 291
    aget-object v5, p3, v19

    const-string v6, "-p"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_49

    aget-object v5, p3, v19

    const-string v6, "--print"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7a

    .line 292
    :cond_49
    const/16 v16, 0x1

    .line 290
    :goto_4b
    add-int/lit8 v19, v19, 0x1

    goto :goto_2a

    .line 279
    .end local v15           #doFile:Z
    .end local v16           #doPrint:Z
    .end local v19           #i:I
    .end local v26           #out:Ljava/lang/StringBuilder;
    .end local v28           #searchArgs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_4e
    move-exception v17

    .line 280
    .local v17, e:Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t initialize: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 281
    const-string v5, "DropBoxManagerService"

    const-string v6, "Can\'t init"

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_76
    .catchall {:try_start_1b .. :try_end_76} :catchall_77

    goto :goto_16

    .line 271
    .end local v17           #e:Ljava/io/IOException;
    :catchall_77
    move-exception v5

    monitor-exit p0

    throw v5

    .line 293
    .restart local v15       #doFile:Z
    .restart local v16       #doPrint:Z
    .restart local v19       #i:I
    .restart local v26       #out:Ljava/lang/StringBuilder;
    .restart local v28       #searchArgs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_7a
    :try_start_7a
    aget-object v5, p3, v19

    const-string v6, "-f"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8e

    aget-object v5, p3, v19

    const-string v6, "--file"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_90

    .line 294
    :cond_8e
    const/4 v15, 0x1

    goto :goto_4b

    .line 295
    :cond_90
    aget-object v5, p3, v19

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_af

    .line 296
    const-string v5, "Unknown argument: "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p3, v19

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4b

    .line 298
    :cond_af
    aget-object v5, p3, v19

    move-object/from16 v0, v28

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4b

    .line 302
    :cond_b8
    const-string v5, "Drop box contents: "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object v6, v0

    iget-object v6, v6, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    invoke-virtual {v6}, Ljava/util/TreeSet;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " entries\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_108

    .line 305
    const-string v5, "Searching for:"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, i$:Ljava/util/Iterator;
    :goto_e7
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_100

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .local v10, a:Ljava/lang/String;
    const-string v5, " "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e7

    .line 307
    .end local v10           #a:Ljava/lang/String;
    :cond_100
    const-string v5, "\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .end local v20           #i$:Ljava/util/Iterator;
    :cond_108
    const/16 v25, 0x0

    .local v25, numFound:I
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v24

    .line 311
    .local v24, numArgs:I
    new-instance v30, Landroid/text/format/Time;

    invoke-direct/range {v30 .. v30}, Landroid/text/format/Time;-><init>()V

    .line 312
    .local v30, time:Landroid/text/format/Time;
    const-string v5, "\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    invoke-virtual {v5}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .restart local v20       #i$:Ljava/util/Iterator;
    :cond_126
    :goto_126
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_358

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/android/server/DropBoxManagerService$EntryFile;

    .line 314
    .local v18, entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    move-wide v5, v0

    move-object/from16 v0, v30

    move-wide v1, v5

    invoke-virtual {v0, v1, v2}, Landroid/text/format/Time;->set(J)V

    .line 315
    const-string v5, "%Y-%m-%d %H:%M:%S"

    move-object/from16 v0, v30

    move-object v1, v5

    invoke-virtual {v0, v1}, Landroid/text/format/Time;->format(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 316
    .local v13, date:Ljava/lang/String;
    const/16 v21, 0x1

    .line 317
    .local v21, match:Z
    const/16 v19, 0x0

    :goto_14a
    move/from16 v0, v19

    move/from16 v1, v24

    if-ge v0, v1, :cond_177

    if-eqz v21, :cond_177

    .line 318
    move-object/from16 v0, v28

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 319
    .local v11, arg:Ljava/lang/String;
    invoke-virtual {v13, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_16d

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v5, v0

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_173

    :cond_16d
    const/4 v5, 0x1

    move/from16 v21, v5

    .line 317
    :goto_170
    add-int/lit8 v19, v19, 0x1

    goto :goto_14a

    .line 319
    :cond_173
    const/4 v5, 0x0

    move/from16 v21, v5

    goto :goto_170

    .line 321
    .end local v11           #arg:Ljava/lang/String;
    :cond_177
    if-eqz v21, :cond_126

    .line 323
    add-int/lit8 v25, v25, 0x1

    .line 324
    if-eqz v16, :cond_185

    const-string v5, "========================================\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    :cond_185
    move-object/from16 v0, v26

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v6, v0

    if-nez v6, :cond_1af

    const-string v6, "(no tag)"

    :goto_19b
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object v5, v0

    if-nez v5, :cond_1b5

    .line 327
    const-string v5, " (no file)\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_126

    .line 325
    :cond_1af
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v6, v0

    goto :goto_19b

    .line 329
    :cond_1b5
    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v5, v0

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_1c8

    .line 330
    const-string v5, " (contents lost)\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_126

    .line 333
    :cond_1c8
    const-string v5, " ("

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v5, v0

    and-int/lit8 v5, v5, 0x4

    if-eqz v5, :cond_1e1

    const-string v5, "compressed "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    :cond_1e1
    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v5, v0

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_298

    const-string v5, "text"

    :goto_1ec
    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    const-string v5, ", "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object v6, v0

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes)\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    if-nez v15, :cond_21a

    if-eqz v16, :cond_239

    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v5, v0

    and-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_239

    .line 340
    :cond_21a
    if-nez v16, :cond_224

    const-string v5, "    "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    :cond_224
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object v5, v0

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    :cond_239
    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v5, v0
    :try_end_23e
    .catchall {:try_start_7a .. :try_end_23e} :catchall_77

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_28c

    if-nez v16, :cond_246

    if-nez v15, :cond_28c

    .line 345
    :cond_246
    const/4 v14, 0x0

    .line 347
    .local v14, dbe:Landroid/os/DropBoxManager$Entry;
    :try_start_247
    new-instance v4, Landroid/os/DropBoxManager$Entry;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    move-object v5, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    move-wide v6, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object v8, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    move v9, v0

    invoke-direct/range {v4 .. v9}, Landroid/os/DropBoxManager$Entry;-><init>(Ljava/lang/String;JLjava/io/File;I)V
    :try_end_260
    .catchall {:try_start_247 .. :try_end_260} :catchall_388
    .catch Ljava/io/IOException; {:try_start_247 .. :try_end_260} :catch_38b

    .line 350
    .end local v14           #dbe:Landroid/os/DropBoxManager$Entry;
    .local v4, dbe:Landroid/os/DropBoxManager$Entry;
    if-eqz v16, :cond_310

    .line 351
    :try_start_262
    new-instance v27, Ljava/io/InputStreamReader;

    invoke-virtual {v4}, Landroid/os/DropBoxManager$Entry;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    move-object/from16 v0, v27

    move-object v1, v5

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 352
    .local v27, r:Ljava/io/InputStreamReader;
    const/16 v5, 0x1000

    new-array v12, v5, [C

    .line 353
    .local v12, buf:[C
    const/16 v23, 0x0

    .line 355
    .local v23, newline:Z
    :cond_274
    :goto_274
    move-object/from16 v0, v27

    move-object v1, v12

    invoke-virtual {v0, v1}, Ljava/io/InputStreamReader;->read([C)I

    move-result v22

    .line 356
    .local v22, n:I
    if-gtz v22, :cond_29c

    .line 366
    if-nez v23, :cond_287

    const-string v5, "\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_287
    .catchall {:try_start_262 .. :try_end_287} :catchall_34d
    .catch Ljava/io/IOException; {:try_start_262 .. :try_end_287} :catch_2cc

    .line 378
    .end local v12           #buf:[C
    .end local v22           #n:I
    .end local v23           #newline:Z
    .end local v27           #r:Ljava/io/InputStreamReader;
    :cond_287
    :goto_287
    if-eqz v4, :cond_28c

    :try_start_289
    invoke-virtual {v4}, Landroid/os/DropBoxManager$Entry;->close()V

    .line 382
    .end local v4           #dbe:Landroid/os/DropBoxManager$Entry;
    :cond_28c
    :goto_28c
    if-eqz v16, :cond_126

    const-string v5, "\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_126

    .line 335
    :cond_298
    const-string v5, "data"
    :try_end_29a
    .catchall {:try_start_289 .. :try_end_29a} :catchall_77

    goto/16 :goto_1ec

    .line 357
    .restart local v4       #dbe:Landroid/os/DropBoxManager$Entry;
    .restart local v12       #buf:[C
    .restart local v22       #n:I
    .restart local v23       #newline:Z
    .restart local v27       #r:Ljava/io/InputStreamReader;
    :cond_29c
    const/4 v5, 0x0

    :try_start_29d
    move-object/from16 v0, v26

    move-object v1, v12

    move v2, v5

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 358
    const/4 v5, 0x1

    sub-int v5, v22, v5

    aget-char v5, v12, v5

    const/16 v6, 0xa

    if-ne v5, v6, :cond_30c

    const/4 v5, 0x1

    move/from16 v23, v5

    .line 361
    :goto_2b2
    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    const/high16 v6, 0x1

    if-le v5, v6, :cond_274

    .line 362
    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 363
    const/4 v5, 0x0

    move-object/from16 v0, v26

    move v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V
    :try_end_2cb
    .catchall {:try_start_29d .. :try_end_2cb} :catchall_34d
    .catch Ljava/io/IOException; {:try_start_29d .. :try_end_2cb} :catch_2cc

    goto :goto_274

    .line 374
    .end local v12           #buf:[C
    .end local v22           #n:I
    .end local v23           #newline:Z
    .end local v27           #r:Ljava/io/InputStreamReader;
    :catch_2cc
    move-exception v5

    move-object/from16 v17, v5

    .line 375
    .restart local v17       #e:Ljava/io/IOException;
    :goto_2cf
    :try_start_2cf
    const-string v5, "*** "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v17 .. v17}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    const-string v5, "DropBoxManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can\'t read: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    move-object v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_306
    .catchall {:try_start_2cf .. :try_end_306} :catchall_34d

    .line 378
    if-eqz v4, :cond_28c

    :try_start_308
    invoke-virtual {v4}, Landroid/os/DropBoxManager$Entry;->close()V
    :try_end_30b
    .catchall {:try_start_308 .. :try_end_30b} :catchall_77

    goto :goto_28c

    .line 358
    .end local v17           #e:Ljava/io/IOException;
    .restart local v12       #buf:[C
    .restart local v22       #n:I
    .restart local v23       #newline:Z
    .restart local v27       #r:Ljava/io/InputStreamReader;
    :cond_30c
    const/4 v5, 0x0

    move/from16 v23, v5

    goto :goto_2b2

    .line 368
    .end local v12           #buf:[C
    .end local v22           #n:I
    .end local v23           #newline:Z
    .end local v27           #r:Ljava/io/InputStreamReader;
    :cond_310
    const/16 v5, 0x46

    :try_start_312
    invoke-virtual {v4, v5}, Landroid/os/DropBoxManager$Entry;->getText(I)Ljava/lang/String;

    move-result-object v29

    .line 369
    .local v29, text:Ljava/lang/String;
    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x46

    if-ne v5, v6, :cond_354

    const/4 v5, 0x1

    move/from16 v31, v5

    .line 370
    .local v31, truncated:Z
    :goto_321
    const-string v5, "    "

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0xa

    const/16 v8, 0x2f

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    if-eqz v31, :cond_343

    const-string v5, " ..."

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    :cond_343
    const-string v5, "\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_34b
    .catchall {:try_start_312 .. :try_end_34b} :catchall_34d
    .catch Ljava/io/IOException; {:try_start_312 .. :try_end_34b} :catch_2cc

    goto/16 :goto_287

    .line 378
    .end local v29           #text:Ljava/lang/String;
    .end local v31           #truncated:Z
    :catchall_34d
    move-exception v5

    :goto_34e
    if-eqz v4, :cond_353

    :try_start_350
    invoke-virtual {v4}, Landroid/os/DropBoxManager$Entry;->close()V

    :cond_353
    throw v5

    .line 369
    .restart local v29       #text:Ljava/lang/String;
    :cond_354
    const/4 v5, 0x0

    move/from16 v31, v5

    goto :goto_321

    .line 385
    .end local v4           #dbe:Landroid/os/DropBoxManager$Entry;
    .end local v13           #date:Ljava/lang/String;
    .end local v18           #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    .end local v21           #match:Z
    .end local v29           #text:Ljava/lang/String;
    :cond_358
    if-nez v25, :cond_362

    const-string v5, "(No entries found.)\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    :cond_362
    if-eqz p3, :cond_36a

    move-object/from16 v0, p3

    array-length v0, v0

    move v5, v0

    if-nez v5, :cond_37c

    .line 388
    :cond_36a
    if-nez v16, :cond_374

    const-string v5, "\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    :cond_374
    const-string v5, "Usage: dumpsys dropbox [--print|--file] [YYYY-mm-dd] [HH:MM:SS] [tag]\n"

    move-object/from16 v0, v26

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    :cond_37c
    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_386
    .catchall {:try_start_350 .. :try_end_386} :catchall_77

    goto/16 :goto_16

    .line 378
    .restart local v13       #date:Ljava/lang/String;
    .restart local v14       #dbe:Landroid/os/DropBoxManager$Entry;
    .restart local v18       #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    .restart local v21       #match:Z
    :catchall_388
    move-exception v5

    move-object v4, v14

    .end local v14           #dbe:Landroid/os/DropBoxManager$Entry;
    .restart local v4       #dbe:Landroid/os/DropBoxManager$Entry;
    goto :goto_34e

    .line 374
    .end local v4           #dbe:Landroid/os/DropBoxManager$Entry;
    .restart local v14       #dbe:Landroid/os/DropBoxManager$Entry;
    :catch_38b
    move-exception v5

    move-object/from16 v17, v5

    move-object v4, v14

    .end local v14           #dbe:Landroid/os/DropBoxManager$Entry;
    .restart local v4       #dbe:Landroid/os/DropBoxManager$Entry;
    goto/16 :goto_2cf
.end method

.method public declared-synchronized getNextEntry(Ljava/lang/String;J)Landroid/os/DropBoxManager$Entry;
    .registers 15
    .parameter "tag"
    .parameter "millis"

    .prologue
    const/4 v10, 0x0

    const-string v0, "DropBoxManagerService"

    .line 238
    monitor-enter p0

    :try_start_4
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.READ_LOGS"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_19

    .line 240
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "READ_LOGS permission required"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_16
    .catchall {:try_start_4 .. :try_end_16} :catchall_16

    .line 238
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0

    .line 244
    :cond_19
    :try_start_19
    invoke-direct {p0}, Lcom/android/server/DropBoxManagerService;->init()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_16
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_26

    .line 250
    if-nez p1, :cond_30

    :try_start_1e
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mAllFiles:Lcom/android/server/DropBoxManagerService$FileList;
    :try_end_20
    .catchall {:try_start_1e .. :try_end_20} :catchall_16

    move-object v9, v0

    .line 251
    .local v9, list:Lcom/android/server/DropBoxManagerService$FileList;
    :goto_21
    if-nez v9, :cond_3a

    move-object v0, v10

    .line 267
    .end local v9           #list:Lcom/android/server/DropBoxManagerService$FileList;
    :goto_24
    monitor-exit p0

    return-object v0

    .line 245
    :catch_26
    move-exception v6

    .line 246
    .local v6, e:Ljava/io/IOException;
    :try_start_27
    const-string v0, "DropBoxManagerService"

    const-string v1, "Can\'t init"

    invoke-static {v0, v1, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v10

    .line 247
    goto :goto_24

    .line 250
    .end local v6           #e:Ljava/io/IOException;
    :cond_30
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mFilesByTag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/DropBoxManagerService$FileList;

    move-object v9, v0

    goto :goto_21

    .line 253
    .restart local v9       #list:Lcom/android/server/DropBoxManagerService$FileList;
    :cond_3a
    iget-object v0, v9, Lcom/android/server/DropBoxManagerService$FileList;->contents:Ljava/util/TreeSet;

    new-instance v1, Lcom/android/server/DropBoxManagerService$EntryFile;

    const-wide/16 v2, 0x1

    add-long/2addr v2, p2

    invoke-direct {v1, v2, v3}, Lcom/android/server/DropBoxManagerService$EntryFile;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_4c
    :goto_4c
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_97

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/DropBoxManagerService$EntryFile;

    .line 254
    .local v7, entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    iget-object v0, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    if-eqz v0, :cond_4c

    .line 255
    iget v0, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_6c

    .line 256
    new-instance v0, Landroid/os/DropBoxManager$Entry;

    iget-object v1, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    iget-wide v2, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    invoke-direct {v0, v1, v2, v3}, Landroid/os/DropBoxManager$Entry;-><init>(Ljava/lang/String;J)V
    :try_end_6b
    .catchall {:try_start_27 .. :try_end_6b} :catchall_16

    goto :goto_24

    .line 259
    :cond_6c
    :try_start_6c
    new-instance v0, Landroid/os/DropBoxManager$Entry;

    iget-object v1, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->tag:Ljava/lang/String;

    iget-wide v2, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->timestampMillis:J

    iget-object v4, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    iget v5, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->flags:I

    invoke-direct/range {v0 .. v5}, Landroid/os/DropBoxManager$Entry;-><init>(Ljava/lang/String;JLjava/io/File;I)V
    :try_end_79
    .catchall {:try_start_6c .. :try_end_79} :catchall_16
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_79} :catch_7a

    goto :goto_24

    .line 261
    :catch_7a
    move-exception v0

    move-object v6, v0

    .line 262
    .restart local v6       #e:Ljava/io/IOException;
    :try_start_7c
    const-string v0, "DropBoxManagerService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t read: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v7, Lcom/android/server/DropBoxManagerService$EntryFile;->file:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_96
    .catchall {:try_start_7c .. :try_end_96} :catchall_16

    goto :goto_4c

    .end local v6           #e:Ljava/io/IOException;
    .end local v7           #entry:Lcom/android/server/DropBoxManagerService$EntryFile;
    :cond_97
    move-object v0, v10

    .line 267
    goto :goto_24
.end method

.method public isTagEnabled(Ljava/lang/String;)Z
    .registers 6
    .parameter "tag"

    .prologue
    .line 233
    const-string v0, "disabled"

    iget-object v1, p0, Lcom/android/server/DropBoxManagerService;->mContentResolver:Landroid/content/ContentResolver;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dropbox:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    const/4 v0, 0x1

    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x0

    goto :goto_22
.end method

.method public stop()V
    .registers 3

    .prologue
    .line 151
    iget-object v0, p0, Lcom/android/server/DropBoxManagerService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/DropBoxManagerService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 152
    return-void
.end method
