.class Lcom/android/server/MountService$1$1;
.super Ljava/lang/Thread;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/MountService$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/MountService$1;


# direct methods
.method constructor <init>(Lcom/android/server/MountService$1;)V
    .registers 2
    .parameter

    .prologue
    .line 717
    iput-object p1, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .prologue
    const-string v11, "MountService"

    .line 720
    :try_start_2
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    #calls: Lcom/android/server/MountService;->waitForReady()V
    invoke-static {v6}, Lcom/android/server/MountService;->access$1000(Lcom/android/server/MountService;)V

    .line 721
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 722
    .local v1, path:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v6, v1}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 724
    .local v5, state:Ljava/lang/String;
    const-string v6, "unmounted"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9a

    .line 725
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    const-string v7, "booting"

    #calls: Lcom/android/server/MountService;->doMountVolume(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {v6, v1, v7}, Lcom/android/server/MountService;->access$1100(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 726
    .local v2, rc:I
    if-eqz v2, :cond_42

    .line 727
    const-string v6, "MountService"

    const-string v7, "First SD Card :: Boot-time mount failed (%d)"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    .end local v2           #rc:I
    :cond_42
    :goto_42
    sget-boolean v6, Lcom/android/server/StorageFeature;->INSTALLED_SECOND_DISK:Z

    if-eqz v6, :cond_7f

    .line 739
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectorySd()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 740
    .local v3, secondPath:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v6, v3}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 744
    .local v4, secondState:Ljava/lang/String;
    const-string v6, "unmounted"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b7

    .line 745
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    const-string v7, "booting"

    #calls: Lcom/android/server/MountService;->doMountVolume(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {v6, v3, v7}, Lcom/android/server/MountService;->access$1100(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 746
    .restart local v2       #rc:I
    if-eqz v2, :cond_7f

    .line 747
    const-string v6, "MountService"

    const-string v7, "Second SD Card :: Boot-time mount failed (%d)"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 761
    .end local v2           #rc:I
    .end local v3           #secondPath:Ljava/lang/String;
    .end local v4           #secondState:Ljava/lang/String;
    :cond_7f
    :goto_7f
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    #getter for: Lcom/android/server/MountService;->mSendUmsConnectedOnBoot:Z
    invoke-static {v6}, Lcom/android/server/MountService;->access$1200(Lcom/android/server/MountService;)Z

    move-result v6

    if-eqz v6, :cond_99

    .line 762
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    const/4 v7, 0x1

    #calls: Lcom/android/server/MountService;->sendUmsIntent(Z)V
    invoke-static {v6, v7}, Lcom/android/server/MountService;->access$1300(Lcom/android/server/MountService;Z)V

    .line 763
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    const/4 v7, 0x0

    #setter for: Lcom/android/server/MountService;->mSendUmsConnectedOnBoot:Z
    invoke-static {v6, v7}, Lcom/android/server/MountService;->access$1202(Lcom/android/server/MountService;Z)Z

    .line 769
    .end local v1           #path:Ljava/lang/String;
    .end local v5           #state:Ljava/lang/String;
    :cond_99
    :goto_99
    return-void

    .line 729
    .restart local v1       #path:Ljava/lang/String;
    .restart local v5       #state:Ljava/lang/String;
    :cond_9a
    const-string v6, "shared"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_42

    .line 734
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x7

    #calls: Lcom/android/server/MountService;->notifyVolumeStateChange(Ljava/lang/String;Ljava/lang/String;II)V
    invoke-static {v6, v7, v1, v8, v9}, Lcom/android/server/MountService;->access$900(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;II)V
    :try_end_ac
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_ac} :catch_ad

    goto :goto_42

    .line 766
    .end local v1           #path:Ljava/lang/String;
    .end local v5           #state:Ljava/lang/String;
    :catch_ad
    move-exception v6

    move-object v0, v6

    .line 767
    .local v0, ex:Ljava/lang/Exception;
    const-string v6, "MountService"

    const-string v6, "Boot-time mount exception"

    invoke-static {v11, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_99

    .line 749
    .end local v0           #ex:Ljava/lang/Exception;
    .restart local v1       #path:Ljava/lang/String;
    .restart local v3       #secondPath:Ljava/lang/String;
    .restart local v4       #secondState:Ljava/lang/String;
    .restart local v5       #state:Ljava/lang/String;
    :cond_b7
    :try_start_b7
    const-string v6, "shared"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7f

    .line 754
    iget-object v6, p0, Lcom/android/server/MountService$1$1;->this$1:Lcom/android/server/MountService$1;

    iget-object v6, v6, Lcom/android/server/MountService$1;->this$0:Lcom/android/server/MountService;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x7

    #calls: Lcom/android/server/MountService;->notifyVolumeStateChange(Ljava/lang/String;Ljava/lang/String;II)V
    invoke-static {v6, v7, v3, v8, v9}, Lcom/android/server/MountService;->access$900(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;II)V
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_b7 .. :try_end_c9} :catch_ad

    goto :goto_7f
.end method
