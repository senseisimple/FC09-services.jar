.class Lcom/android/server/UsbStorageService$2$1;
.super Ljava/lang/Thread;
.source "UsbStorageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/UsbStorageService$2;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/UsbStorageService$2;


# direct methods
.method constructor <init>(Lcom/android/server/UsbStorageService$2;)V
    .registers 2
    .parameter

    .prologue
    .line 122
    iput-object p1, p0, Lcom/android/server/UsbStorageService$2$1;->this$1:Lcom/android/server/UsbStorageService$2;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 18

    .prologue
    .line 125
    const/4 v3, 0x0

    .line 127
    .local v3, bfind:Z
    :try_start_1
    invoke-static {}, Landroid/os/Environment;->isUsbHostStorageInsalled()Z

    move-result v14

    if-nez v14, :cond_8

    .line 168
    :cond_7
    :goto_7
    return-void

    .line 129
    :cond_8
    const/16 v10, 0xc

    .local v10, retries:I
    :goto_a
    if-lez v10, :cond_41

    .line 130
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectoryUsbHost()Ljava/io/File;

    move-result-object v11

    .line 131
    .local v11, tmpFile:Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->isDirectory()Z

    move-result v14

    if-nez v14, :cond_1e

    .line 133
    const-wide/16 v14, 0x3e8

    invoke-static {v14, v15}, Landroid/os/SystemClock;->sleep(J)V

    .line 129
    add-int/lit8 v10, v10, -0x1

    goto :goto_a

    .line 135
    :cond_1e
    const-string v14, "UsbStorageService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "mBroadcastReceiver :: \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v11}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\' find "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const/4 v3, 0x1

    .line 141
    .end local v11           #tmpFile:Ljava/io/File;
    :cond_41
    if-eqz v3, :cond_7

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService$2$1;->this$1:Lcom/android/server/UsbStorageService$2;

    move-object v14, v0

    iget-object v14, v14, Lcom/android/server/UsbStorageService$2;->this$0:Lcom/android/server/UsbStorageService;

    #calls: Lcom/android/server/UsbStorageService;->waitForReady()V
    invoke-static {v14}, Lcom/android/server/UsbStorageService;->access$100(Lcom/android/server/UsbStorageService;)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4d} :catch_b8

    .line 147
    :try_start_4d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService$2$1;->this$1:Lcom/android/server/UsbStorageService$2;

    move-object v14, v0

    iget-object v14, v14, Lcom/android/server/UsbStorageService$2;->this$0:Lcom/android/server/UsbStorageService;

    #getter for: Lcom/android/server/UsbStorageService;->mConnector:Lcom/android/server/NativeDaemonConnector;
    invoke-static {v14}, Lcom/android/server/UsbStorageService;->access$200(Lcom/android/server/UsbStorageService;)Lcom/android/server/NativeDaemonConnector;

    move-result-object v14

    const-string v15, "volume list disk"

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x6e

    invoke-virtual/range {v14 .. v16}, Lcom/android/server/NativeDaemonConnector;->doListCommand(Ljava/lang/String;I)[Ljava/lang/String;
    :try_end_6b
    .catch Lcom/android/server/NativeDaemonConnectorException; {:try_start_4d .. :try_end_6b} :catch_9c
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_6b} :catch_b8

    move-result-object v1

    .line 154
    .local v1, Disks:[Ljava/lang/String;
    move-object v2, v1

    .local v2, arr$:[Ljava/lang/String;
    :try_start_6d
    array-length v8, v2

    .local v8, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_6f
    if-ge v7, v8, :cond_7

    aget-object v13, v2, v7

    .line 155
    .local v13, volstr:Ljava/lang/String;
    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 156
    .local v12, tok:[Ljava/lang/String;
    const/4 v14, 0x0

    aget-object v4, v12, v14

    .line 157
    .local v4, diskLabel:Ljava/lang/String;
    const/4 v14, 0x1

    aget-object v14, v12, v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 159
    .local v9, nParti:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService$2$1;->this$1:Lcom/android/server/UsbStorageService$2;

    move-object v14, v0

    iget-object v14, v14, Lcom/android/server/UsbStorageService$2;->this$0:Lcom/android/server/UsbStorageService;

    #calls: Lcom/android/server/UsbStorageService;->updatePartitionsList(Ljava/lang/String;)V
    invoke-static {v14, v4}, Lcom/android/server/UsbStorageService;->access$300(Lcom/android/server/UsbStorageService;Ljava/lang/String;)V

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/UsbStorageService$2$1;->this$1:Lcom/android/server/UsbStorageService$2;

    move-object v14, v0

    iget-object v14, v14, Lcom/android/server/UsbStorageService$2;->this$0:Lcom/android/server/UsbStorageService;

    const-string v15, "disk"

    #calls: Lcom/android/server/UsbStorageService;->doMountVolume(Ljava/lang/String;Ljava/lang/String;)I
    invoke-static {v14, v4, v15}, Lcom/android/server/UsbStorageService;->access$400(Lcom/android/server/UsbStorageService;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_99} :catch_c3

    .line 154
    add-int/lit8 v7, v7, 0x1

    goto :goto_6f

    .line 148
    .end local v1           #Disks:[Ljava/lang/String;
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v4           #diskLabel:Ljava/lang/String;
    .end local v7           #i$:I
    .end local v8           #len$:I
    .end local v9           #nParti:I
    .end local v12           #tok:[Ljava/lang/String;
    .end local v13           #volstr:Ljava/lang/String;
    :catch_9c
    move-exception v14

    move-object v5, v14

    .line 149
    .local v5, e:Lcom/android/server/NativeDaemonConnectorException;
    :try_start_9e
    const-string v14, "UsbStorageService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "mBroadcastReceiver :: NativeDaemonConnectorException "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b6
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_b6} :catch_b8

    goto/16 :goto_7

    .line 165
    .end local v5           #e:Lcom/android/server/NativeDaemonConnectorException;
    .end local v10           #retries:I
    :catch_b8
    move-exception v14

    move-object v6, v14

    .line 166
    .local v6, ex:Ljava/lang/Exception;
    const-string v14, "UsbStorageService"

    const-string v15, "Boot-time usbStorage exception"

    invoke-static {v14, v15, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .line 162
    .end local v6           #ex:Ljava/lang/Exception;
    .restart local v1       #Disks:[Ljava/lang/String;
    .restart local v2       #arr$:[Ljava/lang/String;
    .restart local v10       #retries:I
    :catch_c3
    move-exception v14

    move-object v5, v14

    .line 163
    .local v5, e:Ljava/lang/Exception;
    :try_start_c5
    const-string v14, "UsbStorageService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "mBroadcastReceiver ::  "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_dd} :catch_b8

    goto/16 :goto_7
.end method
