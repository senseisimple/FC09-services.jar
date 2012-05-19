.class Lcom/android/server/BackupManagerService$1;
.super Landroid/content/BroadcastReceiver;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/BackupManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 797
    iput-object p1, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 801
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 802
    .local v0, action:Ljava/lang/String;
    const/4 v8, 0x0

    .line 803
    .local v8, replacing:Z
    const/4 v1, 0x0

    .line 804
    .local v1, added:Z
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 805
    .local v3, extras:Landroid/os/Bundle;
    const/4 v6, 0x0

    .line 806
    .local v6, pkgList:[Ljava/lang/String;
    const-string v10, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1b

    const-string v10, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_58

    .line 808
    :cond_1b
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    .line 809
    .local v9, uri:Landroid/net/Uri;
    if-nez v9, :cond_22

    .line 851
    .end local v9           #uri:Landroid/net/Uri;
    :cond_21
    :goto_21
    return-void

    .line 812
    .restart local v9       #uri:Landroid/net/Uri;
    :cond_22
    invoke-virtual {v9}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v7

    .line 813
    .local v7, pkgName:Ljava/lang/String;
    if-eqz v7, :cond_2e

    .line 814
    const/4 v10, 0x1

    new-array v6, v10, [Ljava/lang/String;

    .end local v6           #pkgList:[Ljava/lang/String;
    const/4 v10, 0x0

    aput-object v7, v6, v10

    .line 816
    .restart local v6       #pkgList:[Ljava/lang/String;
    :cond_2e
    const-string v10, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 817
    const-string v10, "android.intent.extra.REPLACING"

    const/4 v11, 0x0

    invoke-virtual {v3, v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 825
    .end local v7           #pkgName:Ljava/lang/String;
    .end local v9           #uri:Landroid/net/Uri;
    :cond_3b
    :goto_3b
    if-eqz v6, :cond_21

    array-length v10, v6

    if-eqz v10, :cond_21

    .line 828
    if-eqz v1, :cond_83

    .line 829
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v10, v10, Lcom/android/server/BackupManagerService;->mBackupParticipants:Landroid/util/SparseArray;

    monitor-enter v10

    .line 830
    move-object v2, v6

    .local v2, arr$:[Ljava/lang/String;
    :try_start_48
    array-length v5, v2

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_4a
    if-ge v4, v5, :cond_81

    aget-object v7, v2, v4

    .line 831
    .restart local v7       #pkgName:Ljava/lang/String;
    if-eqz v8, :cond_78

    .line 833
    iget-object v11, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v11, v7}, Lcom/android/server/BackupManagerService;->updatePackageParticipantsLocked(Ljava/lang/String;)V
    :try_end_55
    .catchall {:try_start_48 .. :try_end_55} :catchall_7e

    .line 830
    :goto_55
    add-int/lit8 v4, v4, 0x1

    goto :goto_4a

    .line 818
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #pkgName:Ljava/lang/String;
    :cond_58
    const-string v10, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_68

    .line 819
    const/4 v1, 0x1

    .line 820
    const-string v10, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v10}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    goto :goto_3b

    .line 821
    :cond_68
    const-string v10, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3b

    .line 822
    const/4 v1, 0x0

    .line 823
    const-string v10, "android.intent.extra.changed_package_list"

    invoke-virtual {p2, v10}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    goto :goto_3b

    .line 836
    .restart local v2       #arr$:[Ljava/lang/String;
    .restart local v4       #i$:I
    .restart local v5       #len$:I
    .restart local v7       #pkgName:Ljava/lang/String;
    :cond_78
    :try_start_78
    iget-object v11, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v11, v7}, Lcom/android/server/BackupManagerService;->addPackageParticipantsLocked(Ljava/lang/String;)V

    goto :goto_55

    .line 839
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #pkgName:Ljava/lang/String;
    :catchall_7e
    move-exception v11

    monitor-exit v10
    :try_end_80
    .catchall {:try_start_78 .. :try_end_80} :catchall_7e

    throw v11

    .restart local v4       #i$:I
    .restart local v5       #len$:I
    :cond_81
    :try_start_81
    monitor-exit v10
    :try_end_82
    .catchall {:try_start_81 .. :try_end_82} :catchall_7e

    goto :goto_21

    .line 841
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_83
    if-nez v8, :cond_21

    .line 844
    iget-object v10, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v10, v10, Lcom/android/server/BackupManagerService;->mBackupParticipants:Landroid/util/SparseArray;

    monitor-enter v10

    .line 845
    move-object v2, v6

    .restart local v2       #arr$:[Ljava/lang/String;
    :try_start_8b
    array-length v5, v2

    .restart local v5       #len$:I
    const/4 v4, 0x0

    .restart local v4       #i$:I
    :goto_8d
    if-ge v4, v5, :cond_99

    aget-object v7, v2, v4

    .line 846
    .restart local v7       #pkgName:Ljava/lang/String;
    iget-object v11, p0, Lcom/android/server/BackupManagerService$1;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v11, v7}, Lcom/android/server/BackupManagerService;->removePackageParticipantsLocked(Ljava/lang/String;)V

    .line 845
    add-int/lit8 v4, v4, 0x1

    goto :goto_8d

    .line 848
    .end local v7           #pkgName:Ljava/lang/String;
    :cond_99
    monitor-exit v10

    goto :goto_21

    .end local v4           #i$:I
    .end local v5           #len$:I
    :catchall_9b
    move-exception v11

    monitor-exit v10
    :try_end_9d
    .catchall {:try_start_8b .. :try_end_9d} :catchall_9b

    throw v11
.end method
