.class public Lcom/android/server/enterprise/DeviceStorageUtil;
.super Ljava/lang/Object;
.source "DeviceStorageUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DeviceStorageUtil"


# instance fields
.field final ERROR:I

.field private final SIZE_INVALID:I

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "ctx"

    .prologue
    const/4 v0, -0x1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput v0, p0, Lcom/android/server/enterprise/DeviceStorageUtil;->ERROR:I

    .line 622
    iput v0, p0, Lcom/android/server/enterprise/DeviceStorageUtil;->SIZE_INVALID:I

    .line 31
    iput-object p1, p0, Lcom/android/server/enterprise/DeviceStorageUtil;->mContext:Landroid/content/Context;

    .line 32
    return-void
.end method

.method static synthetic access$400(Lcom/android/server/enterprise/DeviceStorageUtil;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    iget-object v0, p0, Lcom/android/server/enterprise/DeviceStorageUtil;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/server/enterprise/DeviceStorageUtil;)Ljava/lang/String;
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getExternalSdCardState()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/server/enterprise/DeviceStorageUtil;)Ljava/lang/String;
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getInternalSdCardState()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/server/enterprise/DeviceStorageUtil;)Ljava/io/File;
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getExternalSdCardDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/server/enterprise/DeviceStorageUtil;)Ljava/io/File;
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getInternalSdCardDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private deleteDirRecursive(Ljava/io/File;Ljava/io/FileFilter;)Z
    .registers 14
    .parameter "path"
    .parameter "fFilter"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 153
    const/4 v6, 0x1

    .line 154
    .local v6, ret:Z
    if-eqz p1, :cond_7

    if-nez p2, :cond_a

    .line 155
    :cond_7
    const/4 v6, 0x0

    :cond_8
    move v8, v6

    .line 188
    :goto_9
    return v8

    .line 157
    :cond_a
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 158
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_4b

    .line 159
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v8

    if-eqz v8, :cond_48

    .line 160
    invoke-virtual {p1, p2}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v1

    .line 161
    .local v1, childList:[Ljava/io/File;
    move-object v0, v1

    .local v0, arr$:[Ljava/io/File;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_23
    if-ge v4, v5, :cond_35

    aget-object v3, v0, v4

    .line 162
    .local v3, f:Ljava/io/File;
    if-eqz v6, :cond_33

    invoke-direct {p0, v3, p2}, Lcom/android/server/enterprise/DeviceStorageUtil;->deleteDirRecursive(Ljava/io/File;Ljava/io/FileFilter;)Z

    move-result v8

    if-eqz v8, :cond_33

    move v6, v10

    .line 161
    :goto_30
    add-int/lit8 v4, v4, 0x1

    goto :goto_23

    :cond_33
    move v6, v9

    .line 162
    goto :goto_30

    .line 164
    .end local v3           #f:Ljava/io/File;
    :cond_35
    const/4 v7, 0x0

    .line 166
    .local v7, success:Z
    :try_start_36
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_39} :catch_40

    move-result v7

    .line 171
    :goto_3a
    if-eqz v6, :cond_46

    if-eqz v7, :cond_46

    move v8, v10

    goto :goto_9

    .line 167
    :catch_40
    move-exception v2

    .line 168
    .local v2, e:Ljava/lang/Exception;
    const/4 v7, 0x0

    .line 169
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3a

    .end local v2           #e:Ljava/lang/Exception;
    :cond_46
    move v8, v9

    .line 171
    goto :goto_9

    .line 173
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #childList:[Ljava/io/File;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #success:Z
    :cond_48
    const/4 v6, 0x0

    move v8, v6

    .line 174
    goto :goto_9

    .line 177
    :cond_4b
    const/4 v7, 0x0

    .line 179
    .restart local v7       #success:Z
    :try_start_4c
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_56

    move-result v7

    .line 184
    :goto_50
    if-eqz v6, :cond_5c

    if-eqz v7, :cond_5c

    move v8, v10

    goto :goto_9

    .line 180
    :catch_56
    move-exception v2

    .line 181
    .restart local v2       #e:Ljava/lang/Exception;
    const/4 v7, 0x0

    .line 182
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_50

    .end local v2           #e:Ljava/lang/Exception;
    :cond_5c
    move v8, v9

    .line 184
    goto :goto_9
.end method

.method private doFISNow(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .parameter "wipeType"

    .prologue
    .line 259
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "wipe "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, cmd:Ljava/lang/String;
    sget-object v3, Lcom/android/server/enterprise/DeviceShell;->BASH_COMMANDS:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-static {v3}, Lcom/android/server/enterprise/DeviceShell;->setShell(Ljava/lang/String;)V

    .line 261
    invoke-static {v0}, Lcom/android/server/enterprise/DeviceShell;->getProcessOutput(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_21

    move-result-object v2

    .local v2, line:Ljava/lang/String;
    move-object v3, v2

    .line 266
    .end local v0           #cmd:Ljava/lang/String;
    .end local v2           #line:Ljava/lang/String;
    :goto_20
    return-object v3

    .line 263
    :catch_21
    move-exception v3

    move-object v1, v3

    .line 264
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 266
    const/4 v3, 0x0

    goto :goto_20
.end method

.method private externalSdCardAvailable()Z
    .registers 3

    .prologue
    .line 649
    invoke-static {}, Landroid/os/Environment;->getExternalStorageStateSd()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private getExternalSdCardDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 641
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectorySd()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private getExternalSdCardState()Ljava/lang/String;
    .registers 2

    .prologue
    .line 656
    invoke-static {}, Landroid/os/Environment;->getExternalStorageStateSd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getInternalSdCardDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 661
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private getInternalSdCardState()Ljava/lang/String;
    .registers 2

    .prologue
    .line 670
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSizeStr(J)Ljava/lang/String;
    .registers 7
    .parameter "size"

    .prologue
    .line 625
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-nez v2, :cond_8

    .line 626
    const/4 v2, 0x0

    .line 635
    :goto_7
    return-object v2

    .line 628
    :cond_8
    const/4 v1, 0x0

    .line 630
    .local v1, sizeStr:Ljava/lang/String;
    :try_start_9
    iget-object v2, p0, Lcom/android/server/enterprise/DeviceStorageUtil;->mContext:Landroid/content/Context;

    invoke-static {v2, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_e} :catch_11

    move-result-object v1

    :goto_f
    move-object v2, v1

    .line 635
    goto :goto_7

    .line 631
    :catch_11
    move-exception v2

    move-object v0, v2

    .line 632
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 633
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_f
.end method

.method private internalSdCardAvailable()Z
    .registers 3

    .prologue
    .line 665
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public formatInternalStorage(ZZ)Z
    .registers 14
    .parameter "includeSystemDirectory"
    .parameter "includeDataDirectory"

    .prologue
    const-string v6, "all"

    const-string v10, "/system and /data"

    const-string v6, "/"

    const-string v7, "DeviceStorageUtil"

    .line 214
    const/4 v2, 0x0

    .line 215
    .local v2, success:Z
    const/4 v5, 0x0

    .line 216
    .local v5, wipeType:Ljava/lang/String;
    if-eqz p1, :cond_6f

    if-eqz p2, :cond_6f

    .line 217
    const-string v5, "all"

    .line 223
    :cond_10
    :goto_10
    if-eqz v5, :cond_e4

    .line 224
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v3

    .line 226
    .local v3, token:J
    :try_start_16
    const-string v6, "DeviceStorageUtil"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "formatInternalStorage(): Starting Internal Storage wipe for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "all"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_79

    const-string v8, "/system and /data"

    move-object v8, v10

    :goto_2e
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    invoke-direct {p0, v5}, Lcom/android/server/enterprise/DeviceStorageUtil;->doFISNow(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, ret:Ljava/lang/String;
    if-eqz v1, :cond_6b

    .line 233
    const-string v6, "Done wiping"

    invoke-virtual {v1, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_a1

    .line 234
    const/4 v2, 0x1

    .line 235
    const-string v6, "DeviceStorageUtil"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "formatInternalStorage(): Done wiping "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "all"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8d

    const-string v8, "/system and /data"

    move-object v8, v10

    :goto_60
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6b
    .catchall {:try_start_16 .. :try_end_6b} :catchall_cb
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_6b} :catch_c5

    .line 249
    .end local v1           #ret:Ljava/lang/String;
    :cond_6b
    :goto_6b
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 254
    .end local v3           #token:J
    :goto_6e
    return v2

    .line 218
    :cond_6f
    if-eqz p1, :cond_74

    .line 219
    const-string v5, "system"

    goto :goto_10

    .line 220
    :cond_74
    if-eqz p2, :cond_10

    .line 221
    const-string v5, "data"

    goto :goto_10

    .line 226
    .restart local v3       #token:J
    :cond_79
    :try_start_79
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_2e

    .line 235
    .restart local v1       #ret:Ljava/lang/String;
    :cond_8d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_60

    .line 241
    :cond_a1
    const-string v6, "DeviceStorageUtil"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "formatInternalStorage(): Error in wiping of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "all"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d0

    const-string v8, "/system and /data"

    move-object v8, v10

    :goto_b9
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c4
    .catchall {:try_start_79 .. :try_end_c4} :catchall_cb
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_c4} :catch_c5

    goto :goto_6b

    .line 246
    .end local v1           #ret:Ljava/lang/String;
    :catch_c5
    move-exception v6

    move-object v0, v6

    .line 247
    .local v0, e:Ljava/lang/Exception;
    :try_start_c7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_ca
    .catchall {:try_start_c7 .. :try_end_ca} :catchall_cb

    goto :goto_6b

    .line 249
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_cb
    move-exception v6

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v6

    .line 241
    .restart local v1       #ret:Ljava/lang/String;
    :cond_d0
    :try_start_d0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_e2
    .catchall {:try_start_d0 .. :try_end_e2} :catchall_cb
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_e2} :catch_c5

    move-result-object v8

    goto :goto_b9

    .line 252
    .end local v1           #ret:Ljava/lang/String;
    .end local v3           #token:J
    :cond_e4
    const-string v6, "DeviceStorageUtil"

    const-string v6, "formatInternalStorage(): Please provide valid input."

    invoke-static {v7, v6}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6e
.end method

.method public formatSelective([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 26
    .parameter "fileList"
    .parameter "filters"

    .prologue
    .line 52
    if-eqz p1, :cond_9

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v21, v0

    if-nez v21, :cond_13

    .line 53
    :cond_9
    const-string v21, "DeviceStorageUtil"

    const-string v22, "formatSelective(): Please provide valid input for fileList."

    invoke-static/range {v21 .. v22}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const/16 v21, 0x0

    .line 140
    .end local p0
    :goto_12
    return-object v21

    .line 57
    .restart local p0
    :cond_13
    const/4 v12, 0x0

    .local v12, i:I
    :goto_14
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v21, v0

    move v0, v12

    move/from16 v1, v21

    if-ge v0, v1, :cond_3d

    .line 58
    aget-object v21, p1, v12

    if-eqz v21, :cond_30

    aget-object v21, p1, v12

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v21

    aput-object v21, p1, v12

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_3a

    .line 59
    :cond_30
    const-string v21, "DeviceStorageUtil"

    const-string v22, "formatSelective(): Please provide valid input for fileList."

    invoke-static/range {v21 .. v22}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    const/16 v21, 0x0

    goto :goto_12

    .line 57
    :cond_3a
    add-int/lit8 v12, v12, 0x1

    goto :goto_14

    .line 63
    :cond_3d
    if-eqz p2, :cond_7a

    .line 64
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v21, v0

    if-nez v21, :cond_50

    .line 65
    const-string v21, "DeviceStorageUtil"

    const-string v22, "formatSelective(): Please provide valid input for filters."

    invoke-static/range {v21 .. v22}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const/16 v21, 0x0

    goto :goto_12

    .line 68
    :cond_50
    const/4 v12, 0x0

    :goto_51
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v21, v0

    move v0, v12

    move/from16 v1, v21

    if-ge v0, v1, :cond_7a

    .line 69
    aget-object v21, p2, v12

    if-eqz v21, :cond_6d

    aget-object v21, p2, v12

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v21

    aput-object v21, p2, v12

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_77

    .line 70
    :cond_6d
    const-string v21, "DeviceStorageUtil"

    const-string v22, "formatSelective(): Please provide valid input for filters."

    invoke-static/range {v21 .. v22}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    const/16 v21, 0x0

    goto :goto_12

    .line 68
    :cond_77
    add-int/lit8 v12, v12, 0x1

    goto :goto_51

    .line 76
    :cond_7a
    move-object/from16 v10, p2

    .line 77
    .local v10, fileFilers:[Ljava/lang/String;
    const/16 v18, 0x0

    .line 78
    .local v18, takeAll:Z
    if-eqz p2, :cond_e0

    .line 79
    move-object v5, v10

    .local v5, arr$:[Ljava/lang/String;
    array-length v14, v5

    .local v14, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    :goto_83
    if-ge v13, v14, :cond_94

    aget-object v15, v5, v13

    .line 80
    .local v15, string:Ljava/lang/String;
    const-string v21, "*.*"

    move-object v0, v15

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_dd

    .line 81
    const/16 v18, 0x1

    .line 88
    .end local v5           #arr$:[Ljava/lang/String;
    .end local v13           #i$:I
    .end local v14           #len$:I
    .end local v15           #string:Ljava/lang/String;
    :cond_94
    :goto_94
    move/from16 v4, v18

    .line 90
    .local v4, acceptAllFiles:Z
    new-instance v7, Lcom/android/server/enterprise/DeviceStorageUtil$1;

    move-object v0, v7

    move-object/from16 v1, p0

    move v2, v4

    move-object v3, v10

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/enterprise/DeviceStorageUtil$1;-><init>(Lcom/android/server/enterprise/DeviceStorageUtil;Z[Ljava/lang/String;)V

    .line 109
    .local v7, fFilter:Ljava/io/FileFilter;
    const-string v21, "DeviceStorageUtil"

    const-string v22, "formatSelective(): Starting..."

    invoke-static/range {v21 .. v22}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const/4 v8, 0x0

    .line 111
    .local v8, file:Ljava/io/File;
    const/16 v16, 0x0

    .line 112
    .local v16, success:Z
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v17, successList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v19

    .line 116
    .local v19, token:J
    move-object/from16 v5, p1

    .restart local v5       #arr$:[Ljava/lang/String;
    :try_start_b5
    array-length v14, v5
    :try_end_b6
    .catchall {:try_start_b5 .. :try_end_b6} :catchall_124
    .catch Ljava/lang/Exception; {:try_start_b5 .. :try_end_b6} :catch_ed

    .restart local v14       #len$:I
    const/4 v13, 0x0

    .restart local v13       #i$:I
    move-object v9, v8

    .end local v8           #file:Ljava/io/File;
    .local v9, file:Ljava/io/File;
    :goto_b8
    if-ge v13, v14, :cond_11f

    :try_start_ba
    aget-object v11, v5, v13
    :try_end_bc
    .catchall {:try_start_ba .. :try_end_bc} :catchall_12d
    .catch Ljava/lang/Exception; {:try_start_ba .. :try_end_bc} :catch_130

    .line 117
    .local v11, filePath:Ljava/lang/String;
    const/16 v16, 0x0

    .line 119
    :try_start_be
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_c3
    .catchall {:try_start_be .. :try_end_c3} :catchall_12d
    .catch Ljava/lang/Exception; {:try_start_be .. :try_end_c3} :catch_e3

    .line 120
    .end local v9           #file:Ljava/io/File;
    .restart local v8       #file:Ljava/io/File;
    :try_start_c3
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v21

    if-eqz v21, :cond_d1

    .line 121
    move-object/from16 v0, p0

    move-object v1, v8

    move-object v2, v7

    invoke-direct {v0, v1, v2}, Lcom/android/server/enterprise/DeviceStorageUtil;->deleteDirRecursive(Ljava/io/File;Ljava/io/FileFilter;)Z
    :try_end_d0
    .catchall {:try_start_c3 .. :try_end_d0} :catchall_124
    .catch Ljava/lang/Exception; {:try_start_c3 .. :try_end_d0} :catch_135

    move-result v16

    .line 127
    :cond_d1
    :goto_d1
    if-eqz v16, :cond_d9

    .line 128
    :try_start_d3
    move-object/from16 v0, v17

    move-object v1, v11

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_d9
    add-int/lit8 v13, v13, 0x1

    move-object v9, v8

    .end local v8           #file:Ljava/io/File;
    .restart local v9       #file:Ljava/io/File;
    goto :goto_b8

    .line 79
    .end local v4           #acceptAllFiles:Z
    .end local v7           #fFilter:Ljava/io/FileFilter;
    .end local v9           #file:Ljava/io/File;
    .end local v11           #filePath:Ljava/lang/String;
    .end local v16           #success:Z
    .end local v17           #successList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v19           #token:J
    .restart local v15       #string:Ljava/lang/String;
    :cond_dd
    add-int/lit8 v13, v13, 0x1

    goto :goto_83

    .line 86
    .end local v5           #arr$:[Ljava/lang/String;
    .end local v13           #i$:I
    .end local v14           #len$:I
    .end local v15           #string:Ljava/lang/String;
    :cond_e0
    const/16 v18, 0x1

    goto :goto_94

    .line 123
    .restart local v4       #acceptAllFiles:Z
    .restart local v5       #arr$:[Ljava/lang/String;
    .restart local v7       #fFilter:Ljava/io/FileFilter;
    .restart local v9       #file:Ljava/io/File;
    .restart local v11       #filePath:Ljava/lang/String;
    .restart local v13       #i$:I
    .restart local v14       #len$:I
    .restart local v16       #success:Z
    .restart local v17       #successList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v19       #token:J
    :catch_e3
    move-exception v21

    move-object/from16 v6, v21

    move-object v8, v9

    .line 124
    .end local v9           #file:Ljava/io/File;
    .local v6, e:Ljava/lang/Exception;
    .restart local v8       #file:Ljava/io/File;
    :goto_e7
    const/16 v16, 0x0

    .line 125
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_ec
    .catchall {:try_start_d3 .. :try_end_ec} :catchall_124
    .catch Ljava/lang/Exception; {:try_start_d3 .. :try_end_ec} :catch_ed

    goto :goto_d1

    .line 131
    .end local v6           #e:Ljava/lang/Exception;
    .end local v11           #filePath:Ljava/lang/String;
    .end local v13           #i$:I
    .end local v14           #len$:I
    :catch_ed
    move-exception v21

    move-object/from16 v6, v21

    .line 132
    .restart local v6       #e:Ljava/lang/Exception;
    :goto_f0
    :try_start_f0
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_f3
    .catchall {:try_start_f0 .. :try_end_f3} :catchall_124

    .line 134
    invoke-static/range {v19 .. v20}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 136
    .end local v6           #e:Ljava/lang/Exception;
    :goto_f6
    const-string v21, "DeviceStorageUtil"

    const-string v22, "formatSelective(): Done..."

    invoke-static/range {v21 .. v22}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    if-eqz v17, :cond_129

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v21

    if-lez v21, :cond_129

    .line 138
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, [Ljava/lang/String;

    check-cast p0, [Ljava/lang/String;

    move-object/from16 v21, p0

    goto/16 :goto_12

    .line 134
    .end local v8           #file:Ljava/io/File;
    .restart local v9       #file:Ljava/io/File;
    .restart local v13       #i$:I
    .restart local v14       #len$:I
    .restart local p0
    :cond_11f
    invoke-static/range {v19 .. v20}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move-object v8, v9

    .line 135
    .end local v9           #file:Ljava/io/File;
    .restart local v8       #file:Ljava/io/File;
    goto :goto_f6

    .line 134
    .end local v13           #i$:I
    .end local v14           #len$:I
    :catchall_124
    move-exception v21

    :goto_125
    invoke-static/range {v19 .. v20}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v21

    .line 140
    :cond_129
    const/16 v21, 0x0

    goto/16 :goto_12

    .line 134
    .end local v8           #file:Ljava/io/File;
    .restart local v9       #file:Ljava/io/File;
    .restart local v13       #i$:I
    .restart local v14       #len$:I
    :catchall_12d
    move-exception v21

    move-object v8, v9

    .end local v9           #file:Ljava/io/File;
    .restart local v8       #file:Ljava/io/File;
    goto :goto_125

    .line 131
    .end local v8           #file:Ljava/io/File;
    .restart local v9       #file:Ljava/io/File;
    :catch_130
    move-exception v21

    move-object/from16 v6, v21

    move-object v8, v9

    .end local v9           #file:Ljava/io/File;
    .restart local v8       #file:Ljava/io/File;
    goto :goto_f0

    .line 123
    .restart local v11       #filePath:Ljava/lang/String;
    :catch_135
    move-exception v21

    move-object/from16 v6, v21

    goto :goto_e7
.end method

.method public formatStorageCard(Z)Z
    .registers 7
    .parameter "isExternal"

    .prologue
    const-string v3, "DeviceStorageUtil"

    .line 278
    const/4 v2, 0x0

    .line 279
    .local v2, success:Z
    new-instance v1, Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;

    invoke-direct {v1, p0, p1}, Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;-><init>(Lcom/android/server/enterprise/DeviceStorageUtil;Z)V

    .line 281
    .local v1, sdcardFmtr:Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;
    :try_start_8
    const-string v3, "DeviceStorageUtil"

    const-string v4, "formatStorageCard(): Starting SdCard formatting..."

    invoke-static {v3, v4}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    new-instance v3, Lcom/android/server/enterprise/DeviceStorageUtil$2;

    invoke-direct {v3, p0, v1}, Lcom/android/server/enterprise/DeviceStorageUtil$2;-><init>(Lcom/android/server/enterprise/DeviceStorageUtil;Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;)V

    invoke-virtual {v3}, Lcom/android/server/enterprise/DeviceStorageUtil$2;->start()V

    .line 288
    monitor-enter v1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_18} :catch_3b

    .line 289
    :try_start_18
    const-string v3, "DeviceStorageUtil"

    const-string v4, "formatStorageCard(): Waiting...to be Done"

    invoke-static {v3, v4}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    :goto_1f
    iget-boolean v3, v1, Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;->finished:Z
    :try_end_21
    .catchall {:try_start_18 .. :try_end_21} :catchall_38

    if-nez v3, :cond_29

    .line 292
    :try_start_23
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_38
    .catch Ljava/lang/InterruptedException; {:try_start_23 .. :try_end_26} :catch_27

    goto :goto_1f

    .line 293
    :catch_27
    move-exception v3

    goto :goto_1f

    .line 296
    :cond_29
    :try_start_29
    const-string v3, "DeviceStorageUtil"

    const-string v4, "formatStorageCard(): Waiting over..."

    invoke-static {v3, v4}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    iget-boolean v3, v1, Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;->finished:Z

    if-eqz v3, :cond_36

    .line 298
    iget-boolean v2, v1, Lcom/android/server/enterprise/DeviceStorageUtil$SdCardFormater;->success:Z

    .line 300
    :cond_36
    monitor-exit v1

    .line 305
    :goto_37
    return v2

    .line 300
    :catchall_38
    move-exception v3

    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_29 .. :try_end_3a} :catchall_38

    :try_start_3a
    throw v3
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3b} :catch_3b

    .line 302
    :catch_3b
    move-exception v3

    move-object v0, v3

    .line 303
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_37
.end method

.method public getAvailableExternalMemorySize()J
    .registers 10

    .prologue
    .line 566
    :try_start_0
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->externalSdCardAvailable()Z

    move-result v7

    if-eqz v7, :cond_25

    .line 567
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getExternalSdCardDirectory()Ljava/io/File;

    move-result-object v5

    .line 568
    .local v5, path:Ljava/io/File;
    new-instance v6, Landroid/os/StatFs;

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 569
    .local v6, stat:Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 570
    .local v2, blockSize:J
    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocks()I
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_20

    move-result v7

    int-to-long v0, v7

    .line 571
    .local v0, availableBlocks:J
    mul-long v7, v0, v2

    .line 576
    .end local v0           #availableBlocks:J
    .end local v2           #blockSize:J
    .end local v5           #path:Ljava/io/File;
    .end local v6           #stat:Landroid/os/StatFs;
    :goto_1f
    return-wide v7

    .line 573
    :catch_20
    move-exception v7

    move-object v4, v7

    .line 574
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 576
    .end local v4           #e:Ljava/lang/Exception;
    :cond_25
    const-wide/16 v7, -0x1

    goto :goto_1f
.end method

.method public getAvailableExternalMemorySizeFormated()Ljava/lang/String;
    .registers 3

    .prologue
    .line 612
    invoke-virtual {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getAvailableExternalMemorySize()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/android/server/enterprise/DeviceStorageUtil;->getSizeStr(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAvailableInternalMemorySize()J
    .registers 12

    .prologue
    .line 519
    const-wide/16 v6, 0x0

    .line 521
    .local v6, size:J
    :try_start_2
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v5

    .line 522
    .local v5, path:Ljava/io/File;
    new-instance v8, Landroid/os/StatFs;

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 523
    .local v8, stat:Landroid/os/StatFs;
    invoke-virtual {v8}, Landroid/os/StatFs;->getBlockSize()I

    move-result v9

    int-to-long v2, v9

    .line 524
    .local v2, blockSize:J
    invoke-virtual {v8}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v9

    int-to-long v0, v9

    .line 525
    .local v0, availableBlocks:J
    mul-long v6, v0, v2

    .line 528
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getInternalSdCardDirectory()Ljava/io/File;

    move-result-object v5

    .line 529
    new-instance v8, Landroid/os/StatFs;

    .end local v8           #stat:Landroid/os/StatFs;
    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 530
    .restart local v8       #stat:Landroid/os/StatFs;
    invoke-virtual {v8}, Landroid/os/StatFs;->getBlockSize()I

    move-result v9

    int-to-long v2, v9

    .line 531
    invoke-virtual {v8}, Landroid/os/StatFs;->getAvailableBlocks()I
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_30} :catch_37

    move-result v9

    int-to-long v0, v9

    .line 532
    mul-long v9, v0, v2

    add-long/2addr v6, v9

    move-wide v9, v6

    .line 538
    .end local v0           #availableBlocks:J
    .end local v2           #blockSize:J
    .end local v5           #path:Ljava/io/File;
    .end local v8           #stat:Landroid/os/StatFs;
    :goto_36
    return-wide v9

    .line 535
    :catch_37
    move-exception v9

    move-object v4, v9

    .line 536
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 538
    const-wide/16 v9, -0x1

    goto :goto_36
.end method

.method public getAvailableInternalMemorySizeFormated()Ljava/lang/String;
    .registers 3

    .prologue
    .line 598
    invoke-virtual {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getAvailableInternalMemorySize()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/android/server/enterprise/DeviceStorageUtil;->getSizeStr(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTotalExternalMemorySize()J
    .registers 10

    .prologue
    .line 581
    :try_start_0
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->externalSdCardAvailable()Z

    move-result v7

    if-eqz v7, :cond_25

    .line 582
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getExternalSdCardDirectory()Ljava/io/File;

    move-result-object v3

    .line 583
    .local v3, path:Ljava/io/File;
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 584
    .local v4, stat:Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v0, v7

    .line 585
    .local v0, blockSize:J
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_20

    move-result v7

    int-to-long v5, v7

    .line 586
    .local v5, totalBlocks:J
    mul-long v7, v5, v0

    .line 591
    .end local v0           #blockSize:J
    .end local v3           #path:Ljava/io/File;
    .end local v4           #stat:Landroid/os/StatFs;
    .end local v5           #totalBlocks:J
    :goto_1f
    return-wide v7

    .line 588
    :catch_20
    move-exception v7

    move-object v2, v7

    .line 589
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 591
    .end local v2           #e:Ljava/lang/Exception;
    :cond_25
    const-wide/16 v7, -0x1

    goto :goto_1f
.end method

.method public getTotalExternalMemorySizeFormated()Ljava/lang/String;
    .registers 3

    .prologue
    .line 619
    invoke-virtual {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getTotalExternalMemorySize()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/android/server/enterprise/DeviceStorageUtil;->getSizeStr(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTotalInternalMemorySize()J
    .registers 12

    .prologue
    .line 542
    const-wide/16 v4, 0x0

    .line 544
    .local v4, size:J
    :try_start_2
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v3

    .line 545
    .local v3, path:Ljava/io/File;
    new-instance v6, Landroid/os/StatFs;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 546
    .local v6, stat:Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v9

    int-to-long v0, v9

    .line 547
    .local v0, blockSize:J
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockCount()I

    move-result v9

    int-to-long v7, v9

    .line 548
    .local v7, totalBlocks:J
    mul-long v4, v7, v0

    .line 551
    invoke-direct {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getInternalSdCardDirectory()Ljava/io/File;

    move-result-object v3

    .line 552
    new-instance v6, Landroid/os/StatFs;

    .end local v6           #stat:Landroid/os/StatFs;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 553
    .restart local v6       #stat:Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v9

    int-to-long v0, v9

    .line 554
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockCount()I
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_30} :catch_37

    move-result v9

    int-to-long v7, v9

    .line 555
    mul-long v9, v7, v0

    add-long/2addr v4, v9

    move-wide v9, v4

    .line 561
    .end local v0           #blockSize:J
    .end local v3           #path:Ljava/io/File;
    .end local v6           #stat:Landroid/os/StatFs;
    .end local v7           #totalBlocks:J
    :goto_36
    return-wide v9

    .line 558
    :catch_37
    move-exception v9

    move-object v2, v9

    .line 559
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 561
    const-wide/16 v9, -0x1

    goto :goto_36
.end method

.method public getTotalInternalMemorySizeFormated()Ljava/lang/String;
    .registers 3

    .prologue
    .line 605
    invoke-virtual {p0}, Lcom/android/server/enterprise/DeviceStorageUtil;->getTotalInternalMemorySize()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/android/server/enterprise/DeviceStorageUtil;->getSizeStr(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
