.class Lcom/android/server/MountService$2;
.super Ljava/lang/Thread;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/MountService;->onDaemonConnected()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/MountService;


# direct methods
.method constructor <init>(Lcom/android/server/MountService;)V
    .registers 2
    .parameter

    .prologue
    .line 907
    iput-object p1, p0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 19

    .prologue
    .line 914
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    move-object v13, v0

    #getter for: Lcom/android/server/MountService;->mConnector:Lcom/android/server/NativeDaemonConnector;
    invoke-static {v13}, Lcom/android/server/MountService;->access$1500(Lcom/android/server/MountService;)Lcom/android/server/NativeDaemonConnector;

    move-result-object v13

    const-string v14, "volume list"

    const/16 v15, 0x6e

    invoke-virtual {v13, v14, v15}, Lcom/android/server/NativeDaemonConnector;->doListCommand(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v11

    .line 915
    .local v11, vols:[Ljava/lang/String;
    const/4 v7, 0x0

    .line 916
    .local v7, path:Ljava/lang/String;
    const-string v9, "removed"

    .line 917
    .local v9, state:Ljava/lang/String;
    move-object v1, v11

    .local v1, arr$:[Ljava/lang/String;
    array-length v6, v1

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_17
    if-ge v5, v6, :cond_88

    aget-object v12, v1, v5

    .line 918
    .local v12, volstr:Ljava/lang/String;
    const-string v9, "removed"

    .line 919
    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 921
    .local v10, tok:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    move-object v13, v0

    #getter for: Lcom/android/server/MountService;->mVolumeList:Lcom/android/server/MountService$VolumeList;
    invoke-static {v13}, Lcom/android/server/MountService;->access$500(Lcom/android/server/MountService;)Lcom/android/server/MountService$VolumeList;

    move-result-object v13

    const/4 v14, 0x1

    aget-object v14, v10, v14

    invoke-virtual {v13, v14}, Lcom/android/server/MountService$VolumeList;->isVaildVolumePath(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_4e

    .line 922
    const-string v13, "MountService"

    const-string v14, "Skipping unknown volume \'%s\'"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const/16 v17, 0x1

    aget-object v17, v10, v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 917
    :cond_4b
    :goto_4b
    add-int/lit8 v5, v5, 0x1

    goto :goto_17

    .line 925
    :cond_4e
    const/4 v13, 0x1

    aget-object v7, v10, v13

    .line 926
    const/4 v13, 0x2

    aget-object v13, v10, v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 927
    .local v8, st:I
    if-nez v8, :cond_a7

    .line 928
    const-string v9, "removed"

    .line 941
    :goto_5c
    if-eqz v9, :cond_4b

    .line 942
    const-string v13, "MountService"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Updating valid state "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 943
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    move-object v13, v0

    #calls: Lcom/android/server/MountService;->updatePublicVolumeState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v13, v7, v9}, Lcom/android/server/MountService;->access$1600(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7e} :catch_7f

    goto :goto_4b

    .line 946
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v7           #path:Ljava/lang/String;
    .end local v8           #st:I
    .end local v9           #state:Ljava/lang/String;
    .end local v10           #tok:[Ljava/lang/String;
    .end local v11           #vols:[Ljava/lang/String;
    .end local v12           #volstr:Ljava/lang/String;
    :catch_7f
    move-exception v13

    move-object v3, v13

    .line 947
    .local v3, e:Ljava/lang/Exception;
    const-string v13, "MountService"

    const-string v14, "Error processing initial volume state"

    invoke-static {v13, v14, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 952
    .end local v3           #e:Ljava/lang/Exception;
    :cond_88
    :try_start_88
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    move-object v13, v0

    const-string v14, "ums"

    #calls: Lcom/android/server/MountService;->doGetShareMethodAvailable(Ljava/lang/String;)Z
    invoke-static {v13, v14}, Lcom/android/server/MountService;->access$1700(Lcom/android/server/MountService;Ljava/lang/String;)Z

    move-result v2

    .line 953
    .local v2, avail:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    move-object v13, v0

    const-string v14, "ums"

    #calls: Lcom/android/server/MountService;->notifyShareAvailabilityChange(Ljava/lang/String;Z)V
    invoke-static {v13, v14, v2}, Lcom/android/server/MountService;->access$1800(Lcom/android/server/MountService;Ljava/lang/String;Z)V
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_9d} :catch_de

    .line 961
    .end local v2           #avail:Z
    :goto_9d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$2;->this$0:Lcom/android/server/MountService;

    move-object v13, v0

    const/4 v14, 0x1

    #setter for: Lcom/android/server/MountService;->mReady:Z
    invoke-static {v13, v14}, Lcom/android/server/MountService;->access$1902(Lcom/android/server/MountService;Z)Z

    .line 962
    return-void

    .line 929
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v5       #i$:I
    .restart local v6       #len$:I
    .restart local v7       #path:Ljava/lang/String;
    .restart local v8       #st:I
    .restart local v9       #state:Ljava/lang/String;
    .restart local v10       #tok:[Ljava/lang/String;
    .restart local v11       #vols:[Ljava/lang/String;
    .restart local v12       #volstr:Ljava/lang/String;
    :cond_a7
    const/4 v13, 0x1

    if-ne v8, v13, :cond_ad

    .line 930
    :try_start_aa
    const-string v9, "unmounted"

    goto :goto_5c

    .line 931
    :cond_ad
    const/4 v13, 0x4

    if-ne v8, v13, :cond_ba

    .line 932
    const-string v9, "mounted"

    .line 933
    const-string v13, "MountService"

    const-string v14, "Media already mounted on daemon connection"

    invoke-static {v13, v14}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5c

    .line 934
    :cond_ba
    const/4 v13, 0x7

    if-ne v8, v13, :cond_c7

    .line 935
    const-string v9, "shared"

    .line 936
    const-string v13, "MountService"

    const-string v14, "Media shared on daemon connection"

    invoke-static {v13, v14}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5c

    .line 938
    :cond_c7
    new-instance v13, Ljava/lang/Exception;

    const-string v14, "Unexpected state %d"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_de
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_de} :catch_7f

    .line 954
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v7           #path:Ljava/lang/String;
    .end local v8           #st:I
    .end local v9           #state:Ljava/lang/String;
    .end local v10           #tok:[Ljava/lang/String;
    .end local v11           #vols:[Ljava/lang/String;
    .end local v12           #volstr:Ljava/lang/String;
    :catch_de
    move-exception v13

    move-object v4, v13

    .line 955
    .local v4, ex:Ljava/lang/Exception;
    const-string v13, "MountService"

    const-string v14, "Failed to get share availability"

    invoke-static {v13, v14}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9d
.end method
