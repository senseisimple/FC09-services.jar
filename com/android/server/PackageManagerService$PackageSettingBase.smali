.class Lcom/android/server/PackageManagerService$PackageSettingBase;
.super Lcom/android/server/PackageManagerService$GrantedPermissions;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PackageSettingBase"
.end annotation


# instance fields
.field codePath:Ljava/io/File;

.field codePathString:Ljava/lang/String;

.field disabledComponents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field enabled:I

.field enabledComponents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field firstInstallTime:J

.field haveGids:Z

.field installStatus:I

.field installerPackageName:Ljava/lang/String;

.field lastUpdateTime:J

.field final name:Ljava/lang/String;

.field nativeLibraryPathString:Ljava/lang/String;

.field origPackage:Lcom/android/server/PackageManagerService$PackageSettingBase;

.field permissionsFixed:Z

.field final realName:Ljava/lang/String;

.field resourcePath:Ljava/io/File;

.field resourcePathString:Ljava/lang/String;

.field signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

.field timeStamp:J

.field uidError:Z

.field versionCode:I


# direct methods
.method constructor <init>(Lcom/android/server/PackageManagerService$PackageSettingBase;)V
    .registers 4
    .parameter "base"

    .prologue
    const/4 v1, 0x0

    .line 7997
    invoke-direct {p0, p1}, Lcom/android/server/PackageManagerService$GrantedPermissions;-><init>(Lcom/android/server/PackageManagerService$GrantedPermissions;)V

    .line 7968
    new-instance v0, Lcom/android/server/PackageManagerService$PackageSignatures;

    invoke-direct {v0}, Lcom/android/server/PackageManagerService$PackageSignatures;-><init>()V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

    .line 7974
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    .line 7976
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    .line 7977
    iput v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabled:I

    .line 7978
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    .line 7999
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->name:Ljava/lang/String;

    .line 8000
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->realName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->realName:Ljava/lang/String;

    .line 8001
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->codePath:Ljava/io/File;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->codePath:Ljava/io/File;

    .line 8002
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->codePathString:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->codePathString:Ljava/lang/String;

    .line 8003
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->resourcePath:Ljava/io/File;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->resourcePath:Ljava/io/File;

    .line 8004
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->resourcePathString:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->resourcePathString:Ljava/lang/String;

    .line 8005
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->nativeLibraryPathString:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->nativeLibraryPathString:Ljava/lang/String;

    .line 8006
    iget-wide v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->timeStamp:J

    iput-wide v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->timeStamp:J

    .line 8007
    iget-wide v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->firstInstallTime:J

    iput-wide v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->firstInstallTime:J

    .line 8008
    iget-wide v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->lastUpdateTime:J

    iput-wide v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->lastUpdateTime:J

    .line 8009
    iget v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->versionCode:I

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->versionCode:I

    .line 8011
    iget-boolean v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->uidError:Z

    iput-boolean v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->uidError:Z

    .line 8013
    new-instance v0, Lcom/android/server/PackageManagerService$PackageSignatures;

    iget-object v1, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

    invoke-direct {v0, v1}, Lcom/android/server/PackageManagerService$PackageSignatures;-><init>(Lcom/android/server/PackageManagerService$PackageSignatures;)V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

    .line 8015
    iget-boolean v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->permissionsFixed:Z

    iput-boolean v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->permissionsFixed:Z

    .line 8016
    iget-boolean v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->haveGids:Z

    iput-boolean v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->haveGids:Z

    .line 8018
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    .line 8020
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    .line 8022
    iget v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabled:I

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabled:I

    .line 8023
    iget v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    .line 8025
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->origPackage:Lcom/android/server/PackageManagerService$PackageSettingBase;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->origPackage:Lcom/android/server/PackageManagerService$PackageSettingBase;

    .line 8027
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->installerPackageName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installerPackageName:Ljava/lang/String;

    .line 8028
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/io/File;Ljava/lang/String;II)V
    .registers 10
    .parameter "name"
    .parameter "realName"
    .parameter "codePath"
    .parameter "resourcePath"
    .parameter "nativeLibraryPathString"
    .parameter "pVersionCode"
    .parameter "pkgFlags"

    .prologue
    const/4 v1, 0x0

    .line 7987
    invoke-direct {p0, p7}, Lcom/android/server/PackageManagerService$GrantedPermissions;-><init>(I)V

    .line 7968
    new-instance v0, Lcom/android/server/PackageManagerService$PackageSignatures;

    invoke-direct {v0}, Lcom/android/server/PackageManagerService$PackageSignatures;-><init>()V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

    .line 7974
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    .line 7976
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    .line 7977
    iput v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabled:I

    .line 7978
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    .line 7988
    iput-object p1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->name:Ljava/lang/String;

    .line 7989
    iput-object p2, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->realName:Ljava/lang/String;

    .line 7990
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/android/server/PackageManagerService$PackageSettingBase;->init(Ljava/io/File;Ljava/io/File;Ljava/lang/String;I)V

    .line 7991
    return-void
.end method


# virtual methods
.method public copyFrom(Lcom/android/server/PackageManagerService$PackageSettingBase;)V
    .registers 4
    .parameter "base"

    .prologue
    .line 8064
    iget-object v0, p1, Lcom/android/server/PackageManagerService$GrantedPermissions;->grantedPermissions:Ljava/util/HashSet;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$GrantedPermissions;->grantedPermissions:Ljava/util/HashSet;

    .line 8065
    iget-object v0, p1, Lcom/android/server/PackageManagerService$GrantedPermissions;->gids:[I

    iput-object v0, p0, Lcom/android/server/PackageManagerService$GrantedPermissions;->gids:[I

    .line 8067
    iget-wide v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->timeStamp:J

    iput-wide v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->timeStamp:J

    .line 8068
    iget-wide v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->firstInstallTime:J

    iput-wide v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->firstInstallTime:J

    .line 8069
    iget-wide v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->lastUpdateTime:J

    iput-wide v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->lastUpdateTime:J

    .line 8070
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->signatures:Lcom/android/server/PackageManagerService$PackageSignatures;

    .line 8071
    iget-boolean v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->permissionsFixed:Z

    iput-boolean v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->permissionsFixed:Z

    .line 8072
    iget-boolean v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->haveGids:Z

    iput-boolean v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->haveGids:Z

    .line 8073
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    .line 8074
    iget-object v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    .line 8075
    iget v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabled:I

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabled:I

    .line 8076
    iget v0, p1, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    iput v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    .line 8077
    return-void
.end method

.method currentEnabledStateLP(Ljava/lang/String;)I
    .registers 3
    .parameter "componentName"

    .prologue
    .line 8098
    iget-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 8099
    const/4 v0, 0x1

    .line 8103
    :goto_9
    return v0

    .line 8100
    :cond_a
    iget-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 8101
    const/4 v0, 0x2

    goto :goto_9

    .line 8103
    :cond_14
    const/4 v0, 0x0

    goto :goto_9
.end method

.method disableComponentLP(Ljava/lang/String;)Z
    .registers 4
    .parameter "componentClassName"

    .prologue
    .line 8086
    iget-object v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 8087
    .local v0, changed:Z
    iget-object v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 8088
    return v0
.end method

.method enableComponentLP(Ljava/lang/String;)Z
    .registers 4
    .parameter "componentClassName"

    .prologue
    .line 8080
    iget-object v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 8081
    .local v0, changed:Z
    iget-object v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 8082
    return v0
.end method

.method public getInstallStatus()I
    .registers 2

    .prologue
    .line 8053
    iget v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    return v0
.end method

.method getInstallerPackageName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 8045
    iget-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installerPackageName:Ljava/lang/String;

    return-object v0
.end method

.method init(Ljava/io/File;Ljava/io/File;Ljava/lang/String;I)V
    .registers 6
    .parameter "codePath"
    .parameter "resourcePath"
    .parameter "nativeLibraryPathString"
    .parameter "pVersionCode"

    .prologue
    .line 8032
    iput-object p1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->codePath:Ljava/io/File;

    .line 8033
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->codePathString:Ljava/lang/String;

    .line 8034
    iput-object p2, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->resourcePath:Ljava/io/File;

    .line 8035
    invoke-virtual {p2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->resourcePathString:Ljava/lang/String;

    .line 8036
    iput-object p3, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->nativeLibraryPathString:Ljava/lang/String;

    .line 8037
    iput p4, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->versionCode:I

    .line 8038
    return-void
.end method

.method restoreComponentLP(Ljava/lang/String;)Z
    .registers 4
    .parameter "componentClassName"

    .prologue
    .line 8092
    iget-object v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->enabledComponents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 8093
    .local v0, changed:Z
    iget-object v1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->disabledComponents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 8094
    return v0
.end method

.method public setInstallStatus(I)V
    .registers 2
    .parameter "newStatus"

    .prologue
    .line 8049
    iput p1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installStatus:I

    .line 8050
    return-void
.end method

.method public setInstallerPackageName(Ljava/lang/String;)V
    .registers 2
    .parameter "packageName"

    .prologue
    .line 8041
    iput-object p1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->installerPackageName:Ljava/lang/String;

    .line 8042
    return-void
.end method

.method public setTimeStamp(J)V
    .registers 3
    .parameter "newStamp"

    .prologue
    .line 8057
    iput-wide p1, p0, Lcom/android/server/PackageManagerService$PackageSettingBase;->timeStamp:J

    .line 8058
    return-void
.end method
