.class final Lcom/android/server/MountService$VolumeList;
.super Ljava/lang/Object;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/MountService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "VolumeList"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/MountService$VolumeList$VolumeInfo;
    }
.end annotation


# static fields
.field public static final NotMatch:I = -0x1


# instance fields
.field private final asec_path:Ljava/lang/String;

.field public final targeting_prefer_asec_path:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/MountService;

.field private volumeinfo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/MountService$VolumeList$VolumeInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/android/server/MountService;)V
    .registers 8
    .parameter

    .prologue
    const-string v5, "removed"

    const-string v4, "MountService"

    .line 197
    iput-object p1, p0, Lcom/android/server/MountService$VolumeList;->this$0:Lcom/android/server/MountService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    .line 207
    invoke-static {}, Landroid/os/Environment;->getInstalledStorageDirectory()[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/MountService$VolumeList;->targeting_prefer_asec_path:Ljava/lang/String;

    .line 208
    const-string v0, "ASEC_MOUNTPOINT"

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/MountService$VolumeList;->asec_path:Ljava/lang/String;

    .line 198
    const-string v0, "MountService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "first sdcard path :: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    iget-object v0, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    new-instance v1, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "removed"

    invoke-direct {v1, p0, v2, v5}, Lcom/android/server/MountService$VolumeList$VolumeInfo;-><init>(Lcom/android/server/MountService$VolumeList;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    sget-boolean v0, Lcom/android/server/StorageFeature;->INSTALLED_SECOND_DISK:Z

    if-eqz v0, :cond_91

    .line 202
    const-string v0, "MountService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "second sdcard path :: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectorySd()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object v0, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    new-instance v1, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectorySd()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "removed"

    invoke-direct {v1, p0, v2, v5}, Lcom/android/server/MountService$VolumeList$VolumeInfo;-><init>(Lcom/android/server/MountService$VolumeList;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    :cond_91
    return-void
.end method

.method private final vaildVolumePath(Ljava/lang/String;)I
    .registers 4
    .parameter "path"

    .prologue
    .line 234
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1e

    .line 235
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iget-object v1, v1, Lcom/android/server/MountService$VolumeList$VolumeInfo;->path:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    move v1, v0

    .line 238
    :goto_1a
    return v1

    .line 234
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 238
    :cond_1e
    const/4 v1, -0x1

    goto :goto_1a
.end method


# virtual methods
.method public final getASECMountPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/android/server/MountService$VolumeList;->asec_path:Ljava/lang/String;

    return-object v0
.end method

.method public getDevicePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "path"

    .prologue
    .line 282
    const/4 v0, -0x1

    .line 283
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_13

    .line 284
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iget-object v1, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->devPath:Ljava/lang/String;

    .line 286
    :goto_12
    return-object v1

    .restart local p0
    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public final getEncryptedState(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "path"

    .prologue
    .line 249
    const/4 v0, -0x1

    .line 250
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_13

    .line 251
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iget-object v1, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->CryptogramState:Ljava/lang/String;

    .line 254
    :goto_12
    return-object v1

    .restart local p0
    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getPendingState(Ljava/lang/String;)Z
    .registers 4
    .parameter "path"

    .prologue
    .line 264
    const/4 v0, -0x1

    .line 265
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_13

    .line 266
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iget-boolean v1, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->pending:Z

    .line 269
    :goto_12
    return v1

    .restart local p0
    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getVolumeState(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "path"

    .prologue
    .line 299
    const/4 v0, -0x1

    .line 300
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_13

    .line 301
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iget-object v1, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->LegacyState:Ljava/lang/String;

    .line 303
    :goto_12
    return-object v1

    .restart local p0
    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public final isASECMounted(Ljava/lang/String;)Z
    .registers 4
    .parameter "path"

    .prologue
    .line 218
    invoke-virtual {p0, p1}, Lcom/android/server/MountService$VolumeList;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, state:Ljava/lang/String;
    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 220
    const/4 v1, 0x1

    .line 223
    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public final isVaildVolumePath(Ljava/lang/String;)Z
    .registers 4
    .parameter "path"

    .prologue
    .line 227
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1e

    .line 228
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iget-object v1, v1, Lcom/android/server/MountService$VolumeList$VolumeInfo;->path:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v1, 0x1

    .line 230
    :goto_1a
    return v1

    .line 227
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 230
    :cond_1e
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public updateDevicePath(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .parameter "path"
    .parameter "devPath"

    .prologue
    .line 273
    const/4 v0, 0x0

    .line 274
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    .line 275
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iput-object p2, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->devPath:Ljava/lang/String;

    .line 276
    const/4 v1, 0x1

    .line 278
    :goto_13
    return v1

    .restart local p0
    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public updateEncrypting(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .parameter "path"
    .parameter "State"

    .prologue
    .line 242
    const/4 v0, -0x1

    .line 243
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_12

    .line 244
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iput-object p2, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->CryptogramState:Ljava/lang/String;

    .line 246
    :cond_12
    return-void
.end method

.method public updatePending(Ljava/lang/String;Z)V
    .registers 5
    .parameter "path"
    .parameter "bPending"

    .prologue
    .line 257
    const/4 v0, -0x1

    .line 258
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_12

    .line 259
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iput-boolean p2, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->pending:Z

    .line 261
    :cond_12
    return-void
.end method

.method public updateVolumeState(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .parameter "path"
    .parameter "LegacyState"

    .prologue
    .line 290
    const/4 v0, 0x0

    .line 291
    .local v0, index:I
    invoke-direct {p0, p1}, Lcom/android/server/MountService$VolumeList;->vaildVolumePath(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    .line 292
    iget-object v1, p0, Lcom/android/server/MountService$VolumeList;->volumeinfo:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;

    iput-object p2, p0, Lcom/android/server/MountService$VolumeList$VolumeInfo;->LegacyState:Ljava/lang/String;

    .line 293
    const/4 v1, 0x1

    .line 295
    :goto_13
    return v1

    .restart local p0
    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method
