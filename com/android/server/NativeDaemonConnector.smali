.class final Lcom/android/server/NativeDaemonConnector;
.super Ljava/lang/Object;
.source "NativeDaemonConnector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/NativeDaemonConnector$ResponseCode;
    }
.end annotation


# static fields
.field private static final LOCAL_LOGD:Z


# instance fields
.field private final BUFFER_SIZE:I

.field private TAG:Ljava/lang/String;

.field private mCallbacks:Lcom/android/server/INativeDaemonConnectorCallbacks;

.field private mOutputStream:Ljava/io/OutputStream;

.field private mResponseQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSocket:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/server/INativeDaemonConnectorCallbacks;Ljava/lang/String;ILjava/lang/String;)V
    .registers 7
    .parameter "callbacks"
    .parameter "socket"
    .parameter "responseQueueSize"
    .parameter "logTag"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const-string v0, "NativeDaemonConnector"

    iput-object v0, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    .line 51
    const/16 v0, 0x1000

    iput v0, p0, Lcom/android/server/NativeDaemonConnector;->BUFFER_SIZE:I

    .line 72
    iget-object v0, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    const-string v1, "NativeDaemonConnector :: "

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iput-object p1, p0, Lcom/android/server/NativeDaemonConnector;->mCallbacks:Lcom/android/server/INativeDaemonConnectorCallbacks;

    .line 74
    if-eqz p4, :cond_18

    .line 75
    iput-object p4, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    .line 76
    :cond_18
    iput-object p2, p0, Lcom/android/server/NativeDaemonConnector;->mSocket:Ljava/lang/String;

    .line 77
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0, p3}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/NativeDaemonConnector;->mResponseQueue:Ljava/util/concurrent/BlockingQueue;

    .line 78
    return-void
.end method

.method private listenToSocket()V
    .registers 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "listenToSocket :: "

    invoke-static/range {v20 .. v21}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const/16 v16, 0x0

    .line 98
    .local v16, socket:Landroid/net/LocalSocket;
    :try_start_d
    new-instance v17, Landroid/net/LocalSocket;

    invoke-direct/range {v17 .. v17}, Landroid/net/LocalSocket;-><init>()V
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_136
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_12} :catch_1f0

    .line 99
    .end local v16           #socket:Landroid/net/LocalSocket;
    .local v17, socket:Landroid/net/LocalSocket;
    :try_start_12
    new-instance v5, Landroid/net/LocalSocketAddress;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mSocket:Ljava/lang/String;

    move-object/from16 v20, v0

    sget-object v21, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    move-object v0, v5

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 102
    .local v5, address:Landroid/net/LocalSocketAddress;
    move-object/from16 v0, v17

    move-object v1, v5

    invoke-virtual {v0, v1}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 104
    invoke-virtual/range {v17 .. v17}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    .line 105
    .local v13, inputStream:Ljava/io/InputStream;
    invoke-virtual/range {v17 .. v17}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mCallbacks:Lcom/android/server/INativeDaemonConnectorCallbacks;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/android/server/INativeDaemonConnectorCallbacks;->onDaemonConnected()V

    .line 108
    const/16 v20, 0x1000

    move/from16 v0, v20

    new-array v0, v0, [B

    move-object v6, v0

    .line 109
    .local v6, buffer:[B
    const/16 v18, 0x0

    .line 112
    .local v18, start:I
    :goto_4a
    const/16 v20, 0x1000

    sub-int v20, v20, v18

    move-object v0, v13

    move-object v1, v6

    move/from16 v2, v18

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I
    :try_end_57
    .catchall {:try_start_12 .. :try_end_57} :catchall_17b
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_57} :catch_120

    move-result v8

    .line 113
    .local v8, count:I
    if-gez v8, :cond_7b

    .line 166
    monitor-enter p0

    .line 167
    :try_start_5b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    move-object/from16 v20, v0
    :try_end_61
    .catchall {:try_start_5b .. :try_end_61} :catchall_1c5

    if-eqz v20, :cond_74

    .line 169
    :try_start_63
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->close()V
    :try_end_6c
    .catchall {:try_start_63 .. :try_end_6c} :catchall_1c5
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_6c} :catch_1db

    .line 173
    :goto_6c
    const/16 v20, 0x0

    :try_start_6e
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    .line 175
    :cond_74
    monitor-exit p0
    :try_end_75
    .catchall {:try_start_6e .. :try_end_75} :catchall_1c5

    .line 178
    if-eqz v17, :cond_7a

    .line 179
    :try_start_77
    invoke-virtual/range {v17 .. v17}, Landroid/net/LocalSocket;->close()V
    :try_end_7a
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_7a} :catch_1c8

    .line 185
    :cond_7a
    :goto_7a
    return-void

    .line 116
    :cond_7b
    add-int v8, v8, v18

    .line 117
    const/16 v18, 0x0

    .line 119
    const/4 v12, 0x0

    .local v12, i:I
    :goto_80
    if-ge v12, v8, :cond_17f

    .line 120
    :try_start_82
    aget-byte v20, v6, v12

    if-nez v20, :cond_da

    .line 121
    new-instance v10, Ljava/lang/String;

    sub-int v20, v12, v18

    move-object v0, v10

    move-object v1, v6

    move/from16 v2, v18

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([BII)V

    .line 124
    .local v10, event:Ljava/lang/String;
    const-string v20, " "

    move-object v0, v10

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_9b
    .catchall {:try_start_82 .. :try_end_9b} :catchall_17b
    .catch Ljava/io/IOException; {:try_start_82 .. :try_end_9b} :catch_120

    move-result-object v19

    .line 126
    .local v19, tokens:[Ljava/lang/String;
    const/16 v20, 0x0

    :try_start_9e
    aget-object v20, v19, v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_a3
    .catchall {:try_start_9e .. :try_end_a3} :catchall_17b
    .catch Ljava/lang/NumberFormatException; {:try_start_9e .. :try_end_a3} :catch_101
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_a3} :catch_120

    move-result v7

    .line 128
    .local v7, code:I
    const/16 v20, 0x258

    move v0, v7

    move/from16 v1, v20

    if-lt v0, v1, :cond_158

    .line 130
    :try_start_ab
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mCallbacks:Lcom/android/server/INativeDaemonConnectorCallbacks;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move v1, v7

    move-object v2, v10

    move-object/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lcom/android/server/INativeDaemonConnectorCallbacks;->onEvent(ILjava/lang/String;[Ljava/lang/String;)Z

    move-result v20

    if-nez v20, :cond_d8

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Unhandled event (%s)"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v10, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d8
    .catchall {:try_start_ab .. :try_end_d8} :catchall_17b
    .catch Ljava/lang/Exception; {:try_start_ab .. :try_end_d8} :catch_dd
    .catch Ljava/lang/NumberFormatException; {:try_start_ab .. :try_end_d8} :catch_101
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_d8} :catch_120

    .line 148
    .end local v7           #code:I
    :cond_d8
    :goto_d8
    add-int/lit8 v18, v12, 0x1

    .line 119
    .end local v10           #event:Ljava/lang/String;
    .end local v19           #tokens:[Ljava/lang/String;
    :cond_da
    add-int/lit8 v12, v12, 0x1

    goto :goto_80

    .line 134
    .restart local v7       #code:I
    .restart local v10       #event:Ljava/lang/String;
    .restart local v19       #tokens:[Ljava/lang/String;
    :catch_dd
    move-exception v20

    move-object/from16 v11, v20

    .line 135
    .local v11, ex:Ljava/lang/Exception;
    :try_start_e0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Error handling \'%s\'"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v10, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object v2, v11

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_100
    .catchall {:try_start_e0 .. :try_end_100} :catchall_17b
    .catch Ljava/lang/NumberFormatException; {:try_start_e0 .. :try_end_100} :catch_101
    .catch Ljava/io/IOException; {:try_start_e0 .. :try_end_100} :catch_120

    goto :goto_d8

    .line 145
    .end local v7           #code:I
    .end local v11           #ex:Ljava/lang/Exception;
    :catch_101
    move-exception v20

    move-object/from16 v14, v20

    .line 146
    .local v14, nfe:Ljava/lang/NumberFormatException;
    :try_start_104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Bad msg (%s)"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v10, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_11f
    .catchall {:try_start_104 .. :try_end_11f} :catchall_17b
    .catch Ljava/io/IOException; {:try_start_104 .. :try_end_11f} :catch_120

    goto :goto_d8

    .line 162
    .end local v5           #address:Landroid/net/LocalSocketAddress;
    .end local v6           #buffer:[B
    .end local v8           #count:I
    .end local v10           #event:Ljava/lang/String;
    .end local v12           #i:I
    .end local v13           #inputStream:Ljava/io/InputStream;
    .end local v14           #nfe:Ljava/lang/NumberFormatException;
    .end local v18           #start:I
    .end local v19           #tokens:[Ljava/lang/String;
    :catch_120
    move-exception v20

    move-object/from16 v11, v20

    move-object/from16 v16, v17

    .line 163
    .end local v17           #socket:Landroid/net/LocalSocket;
    .local v11, ex:Ljava/io/IOException;
    .restart local v16       #socket:Landroid/net/LocalSocket;
    :goto_125
    :try_start_125
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "listenToSocket -> Communications error"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object v2, v11

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 164
    throw v11
    :try_end_136
    .catchall {:try_start_125 .. :try_end_136} :catchall_136

    .line 166
    .end local v11           #ex:Ljava/io/IOException;
    :catchall_136
    move-exception v20

    :goto_137
    monitor-enter p0

    .line 167
    :try_start_138
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    move-object/from16 v21, v0
    :try_end_13e
    .catchall {:try_start_138 .. :try_end_13e} :catchall_19c

    if-eqz v21, :cond_151

    .line 169
    :try_start_140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/io/OutputStream;->close()V
    :try_end_149
    .catchall {:try_start_140 .. :try_end_149} :catchall_19c
    .catch Ljava/io/IOException; {:try_start_140 .. :try_end_149} :catch_1b1

    .line 173
    :goto_149
    const/16 v21, 0x0

    :try_start_14b
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    .line 175
    :cond_151
    monitor-exit p0
    :try_end_152
    .catchall {:try_start_14b .. :try_end_152} :catchall_19c

    .line 178
    if-eqz v16, :cond_157

    .line 179
    :try_start_154
    invoke-virtual/range {v16 .. v16}, Landroid/net/LocalSocket;->close()V
    :try_end_157
    .catch Ljava/io/IOException; {:try_start_154 .. :try_end_157} :catch_19f

    .line 166
    :cond_157
    :goto_157
    throw v20

    .line 140
    .end local v16           #socket:Landroid/net/LocalSocket;
    .restart local v5       #address:Landroid/net/LocalSocketAddress;
    .restart local v6       #buffer:[B
    .restart local v7       #code:I
    .restart local v8       #count:I
    .restart local v10       #event:Ljava/lang/String;
    .restart local v12       #i:I
    .restart local v13       #inputStream:Ljava/io/InputStream;
    .restart local v17       #socket:Landroid/net/LocalSocket;
    .restart local v18       #start:I
    .restart local v19       #tokens:[Ljava/lang/String;
    :cond_158
    :try_start_158
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->mResponseQueue:Ljava/util/concurrent/BlockingQueue;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object v1, v10

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_164
    .catchall {:try_start_158 .. :try_end_164} :catchall_17b
    .catch Ljava/lang/InterruptedException; {:try_start_158 .. :try_end_164} :catch_166
    .catch Ljava/lang/NumberFormatException; {:try_start_158 .. :try_end_164} :catch_101
    .catch Ljava/io/IOException; {:try_start_158 .. :try_end_164} :catch_120

    goto/16 :goto_d8

    .line 141
    :catch_166
    move-exception v20

    move-object/from16 v11, v20

    .line 142
    .local v11, ex:Ljava/lang/InterruptedException;
    :try_start_169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Failed to put response onto queue"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object v2, v11

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_179
    .catchall {:try_start_169 .. :try_end_179} :catchall_17b
    .catch Ljava/lang/NumberFormatException; {:try_start_169 .. :try_end_179} :catch_101
    .catch Ljava/io/IOException; {:try_start_169 .. :try_end_179} :catch_120

    goto/16 :goto_d8

    .line 166
    .end local v5           #address:Landroid/net/LocalSocketAddress;
    .end local v6           #buffer:[B
    .end local v7           #code:I
    .end local v8           #count:I
    .end local v10           #event:Ljava/lang/String;
    .end local v11           #ex:Ljava/lang/InterruptedException;
    .end local v12           #i:I
    .end local v13           #inputStream:Ljava/io/InputStream;
    .end local v18           #start:I
    .end local v19           #tokens:[Ljava/lang/String;
    :catchall_17b
    move-exception v20

    move-object/from16 v16, v17

    .end local v17           #socket:Landroid/net/LocalSocket;
    .restart local v16       #socket:Landroid/net/LocalSocket;
    goto :goto_137

    .line 154
    .end local v16           #socket:Landroid/net/LocalSocket;
    .restart local v5       #address:Landroid/net/LocalSocketAddress;
    .restart local v6       #buffer:[B
    .restart local v8       #count:I
    .restart local v12       #i:I
    .restart local v13       #inputStream:Ljava/io/InputStream;
    .restart local v17       #socket:Landroid/net/LocalSocket;
    .restart local v18       #start:I
    :cond_17f
    move/from16 v0, v18

    move v1, v8

    if-eq v0, v1, :cond_198

    .line 155
    const/16 v20, 0x1000

    sub-int v15, v20, v18

    .line 156
    .local v15, remaining:I
    const/16 v20, 0x0

    :try_start_18a
    move-object v0, v6

    move/from16 v1, v18

    move-object v2, v6

    move/from16 v3, v20

    move v4, v15

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_194
    .catchall {:try_start_18a .. :try_end_194} :catchall_17b
    .catch Ljava/io/IOException; {:try_start_18a .. :try_end_194} :catch_120

    .line 157
    move/from16 v18, v15

    .line 158
    goto/16 :goto_4a

    .line 159
    .end local v15           #remaining:I
    :cond_198
    const/16 v18, 0x0

    goto/16 :goto_4a

    .line 175
    .end local v5           #address:Landroid/net/LocalSocketAddress;
    .end local v6           #buffer:[B
    .end local v8           #count:I
    .end local v12           #i:I
    .end local v13           #inputStream:Ljava/io/InputStream;
    .end local v17           #socket:Landroid/net/LocalSocket;
    .end local v18           #start:I
    .restart local v16       #socket:Landroid/net/LocalSocket;
    :catchall_19c
    move-exception v20

    :try_start_19d
    monitor-exit p0
    :try_end_19e
    .catchall {:try_start_19d .. :try_end_19e} :catchall_19c

    throw v20

    .line 181
    :catch_19f
    move-exception v11

    .line 182
    .local v11, ex:Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string v22, "Failed closing socket"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object v2, v11

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_157

    .line 170
    .end local v11           #ex:Ljava/io/IOException;
    :catch_1b1
    move-exception v21

    move-object/from16 v9, v21

    .line 171
    .local v9, e:Ljava/io/IOException;
    :try_start_1b4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string v22, "Failed closing output stream"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object v2, v9

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1c4
    .catchall {:try_start_1b4 .. :try_end_1c4} :catchall_19c

    goto :goto_149

    .line 175
    .end local v9           #e:Ljava/io/IOException;
    .end local v16           #socket:Landroid/net/LocalSocket;
    .restart local v5       #address:Landroid/net/LocalSocketAddress;
    .restart local v6       #buffer:[B
    .restart local v8       #count:I
    .restart local v13       #inputStream:Ljava/io/InputStream;
    .restart local v17       #socket:Landroid/net/LocalSocket;
    .restart local v18       #start:I
    :catchall_1c5
    move-exception v20

    :try_start_1c6
    monitor-exit p0
    :try_end_1c7
    .catchall {:try_start_1c6 .. :try_end_1c7} :catchall_1c5

    throw v20

    .line 181
    :catch_1c8
    move-exception v11

    .line 182
    .restart local v11       #ex:Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Failed closing socket"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object v2, v11

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7a

    .line 170
    .end local v11           #ex:Ljava/io/IOException;
    :catch_1db
    move-exception v20

    move-object/from16 v9, v20

    .line 171
    .restart local v9       #e:Ljava/io/IOException;
    :try_start_1de
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Failed closing output stream"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object v2, v9

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1ee
    .catchall {:try_start_1de .. :try_end_1ee} :catchall_1c5

    goto/16 :goto_6c

    .line 162
    .end local v5           #address:Landroid/net/LocalSocketAddress;
    .end local v6           #buffer:[B
    .end local v8           #count:I
    .end local v9           #e:Ljava/io/IOException;
    .end local v13           #inputStream:Ljava/io/InputStream;
    .end local v17           #socket:Landroid/net/LocalSocket;
    .end local v18           #start:I
    .restart local v16       #socket:Landroid/net/LocalSocket;
    :catch_1f0
    move-exception v20

    move-object/from16 v11, v20

    goto/16 :goto_125
.end method

.method private sendCommand(Ljava/lang/String;)V
    .registers 3
    .parameter "command"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/NativeDaemonConnectorException;
        }
    .end annotation

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/server/NativeDaemonConnector;->sendCommand(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method private sendCommand(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .parameter "command"
    .parameter "argument"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/NativeDaemonConnectorException;
        }
    .end annotation

    .prologue
    .line 200
    monitor-enter p0

    .line 203
    :try_start_1
    iget-object v2, p0, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    if-nez v2, :cond_1c

    .line 204
    iget-object v2, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    const-string v3, "No connection to daemon"

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v2, v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 205
    new-instance v2, Lcom/android/server/NativeDaemonConnectorException;

    const-string v3, "No output stream!"

    invoke-direct {v2, v3}, Lcom/android/server/NativeDaemonConnectorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 219
    :catchall_19
    move-exception v2

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_19

    throw v2

    .line 207
    :cond_1c
    :try_start_1c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .local v0, builder:Ljava/lang/StringBuilder;
    if-eqz p2, :cond_26

    .line 209
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    :cond_26
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_2a
    .catchall {:try_start_1c .. :try_end_2a} :catchall_19

    .line 214
    :try_start_2a
    iget-object v2, p0, Lcom/android/server/NativeDaemonConnector;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V
    :try_end_37
    .catchall {:try_start_2a .. :try_end_37} :catchall_19
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_37} :catch_39

    .line 219
    :goto_37
    :try_start_37
    monitor-exit p0

    .line 220
    return-void

    .line 215
    :catch_39
    move-exception v2

    move-object v1, v2

    .line 216
    .local v1, ex:Ljava/io/IOException;
    iget-object v2, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    const-string v3, "IOException in sendCommand"

    invoke-static {v2, v3, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_42
    .catchall {:try_start_37 .. :try_end_42} :catchall_19

    goto :goto_37
.end method


# virtual methods
.method public declared-synchronized doCommand(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 14
    .parameter "cmd"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/NativeDaemonConnectorException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 228
    monitor-enter p0

    :try_start_2
    iget-object v7, p0, Lcom/android/server/NativeDaemonConnector;->mResponseQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v7}, Ljava/util/concurrent/BlockingQueue;->clear()V

    .line 229
    invoke-direct {p0, p1}, Lcom/android/server/NativeDaemonConnector;->sendCommand(Ljava/lang/String;)V

    .line 231
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    :try_end_f
    .catchall {:try_start_2 .. :try_end_f} :catchall_3f

    .line 232
    .local v5, response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 233
    .local v1, complete:Z
    const/4 v0, -0x1

    .line 235
    .local v0, code:I
    :goto_11
    if-nez v1, :cond_56

    .line 238
    :try_start_13
    iget-object v7, p0, Lcom/android/server/NativeDaemonConnector;->mResponseQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v7}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 240
    .local v3, line:Ljava/lang/String;
    const-string v7, " "

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_20
    .catchall {:try_start_13 .. :try_end_20} :catchall_3f
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_20} :catch_35

    move-result-object v6

    .line 242
    .local v6, tokens:[Ljava/lang/String;
    const/4 v7, 0x0

    :try_start_22
    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_27
    .catchall {:try_start_22 .. :try_end_27} :catchall_3f
    .catch Ljava/lang/NumberFormatException; {:try_start_22 .. :try_end_27} :catch_42
    .catch Ljava/lang/InterruptedException; {:try_start_22 .. :try_end_27} :catch_35

    move-result v0

    .line 248
    const/16 v7, 0xc8

    if-lt v0, v7, :cond_31

    const/16 v7, 0x258

    if-ge v0, v7, :cond_31

    .line 249
    const/4 v1, 0x1

    .line 251
    :cond_31
    :try_start_31
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_3f
    .catch Ljava/lang/InterruptedException; {:try_start_31 .. :try_end_34} :catch_35

    goto :goto_11

    .line 252
    .end local v3           #line:Ljava/lang/String;
    .end local v6           #tokens:[Ljava/lang/String;
    :catch_35
    move-exception v7

    move-object v2, v7

    .line 253
    .local v2, ex:Ljava/lang/InterruptedException;
    :try_start_37
    iget-object v7, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    const-string v8, "Failed to process response"

    invoke-static {v7, v8, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3e
    .catchall {:try_start_37 .. :try_end_3e} :catchall_3f

    goto :goto_11

    .line 228
    .end local v0           #code:I
    .end local v1           #complete:Z
    .end local v2           #ex:Ljava/lang/InterruptedException;
    .end local v5           #response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catchall_3f
    move-exception v7

    monitor-exit p0

    throw v7

    .line 243
    .restart local v0       #code:I
    .restart local v1       #complete:Z
    .restart local v3       #line:Ljava/lang/String;
    .restart local v5       #response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v6       #tokens:[Ljava/lang/String;
    :catch_42
    move-exception v7

    move-object v4, v7

    .line 244
    .local v4, nfe:Ljava/lang/NumberFormatException;
    :try_start_44
    new-instance v7, Lcom/android/server/NativeDaemonConnectorException;

    const-string v8, "Invalid response from daemon (%s)"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v3, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/android/server/NativeDaemonConnectorException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_56
    .catchall {:try_start_44 .. :try_end_56} :catchall_3f
    .catch Ljava/lang/InterruptedException; {:try_start_44 .. :try_end_56} :catch_35

    .line 257
    .end local v3           #line:Ljava/lang/String;
    .end local v4           #nfe:Ljava/lang/NumberFormatException;
    .end local v6           #tokens:[Ljava/lang/String;
    :cond_56
    const/16 v7, 0x190

    if-lt v0, v7, :cond_74

    const/16 v7, 0x257

    if-gt v0, v7, :cond_74

    .line 263
    :try_start_5e
    new-instance v8, Lcom/android/server/NativeDaemonConnectorException;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v7, v11

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const/4 v9, 0x4

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v0, p1, v7}, Lcom/android/server/NativeDaemonConnectorException;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    throw v8
    :try_end_74
    .catchall {:try_start_5e .. :try_end_74} :catchall_3f

    .line 266
    :cond_74
    monitor-exit p0

    return-object v5
.end method

.method public doListCommand(Ljava/lang/String;I)[Ljava/lang/String;
    .registers 21
    .parameter "cmd"
    .parameter "expectedResponseCode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/NativeDaemonConnectorException;
        }
    .end annotation

    .prologue
    .line 276
    invoke-virtual/range {p0 .. p1}, Lcom/android/server/NativeDaemonConnector;->doCommand(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    .line 277
    .local v11, rsp:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x1

    sub-int/2addr v13, v14

    new-array v10, v13, [Ljava/lang/String;

    .line 278
    .local v10, rdata:[Ljava/lang/String;
    const/4 v4, 0x0

    .line 280
    .local v4, idx:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_e
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v3, v13, :cond_c0

    .line 281
    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 283
    .local v8, line:Ljava/lang/String;
    :try_start_1a
    const-string v13, " "

    invoke-virtual {v8, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 284
    .local v12, tok:[Ljava/lang/String;
    const/4 v13, 0x0

    aget-object v13, v12, v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1a .. :try_end_26} :catch_ab

    move-result v2

    .line 285
    .local v2, code:I
    move v0, v2

    move/from16 v1, p2

    if-ne v0, v1, :cond_41

    .line 286
    add-int/lit8 v5, v4, 0x1

    .end local v4           #idx:I
    .local v5, idx:I
    const/4 v13, 0x0

    :try_start_2f
    aget-object v13, v12, v13

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v10, v4
    :try_end_3d
    .catch Ljava/lang/NumberFormatException; {:try_start_2f .. :try_end_3d} :catch_c9

    .line 280
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #idx:I
    .restart local v4       #idx:I
    goto :goto_e

    .line 287
    :cond_41
    const/16 v13, 0xc8

    if-ne v2, v13, :cond_8c

    .line 289
    :try_start_45
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x1

    sub-int v7, v13, v14

    .line 290
    .local v7, last:I
    if-eq v3, v7, :cond_c8

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object v13, v0

    const-string v14, "Recv\'d %d lines after end of list {%s}"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    sub-int v17, v7, v3

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object p1, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    move v6, v3

    .local v6, j:I
    :goto_6e
    if-gt v6, v7, :cond_c8

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    move-object v13, v0

    const-string v14, "ExtraData <%s>"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    add-int/lit8 v6, v6, 0x1

    goto :goto_6e

    .line 298
    .end local v6           #j:I
    .end local v7           #last:I
    :cond_8c
    new-instance v13, Lcom/android/server/NativeDaemonConnectorException;

    const-string v14, "Expected list response %d, but got %d"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/android/server/NativeDaemonConnectorException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_ab
    .catch Ljava/lang/NumberFormatException; {:try_start_45 .. :try_end_ab} :catch_ab

    .line 302
    .end local v2           #code:I
    .end local v12           #tok:[Ljava/lang/String;
    :catch_ab
    move-exception v13

    move-object v9, v13

    .line 303
    .local v9, nfe:Ljava/lang/NumberFormatException;
    :goto_ad
    new-instance v13, Lcom/android/server/NativeDaemonConnectorException;

    const-string v14, "Error reading code \'%s\'"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v8, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/android/server/NativeDaemonConnectorException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 307
    .end local v8           #line:Ljava/lang/String;
    .end local v9           #nfe:Ljava/lang/NumberFormatException;
    :cond_c0
    new-instance v13, Lcom/android/server/NativeDaemonConnectorException;

    const-string v14, "Got an empty response"

    invoke-direct {v13, v14}, Lcom/android/server/NativeDaemonConnectorException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 296
    .restart local v2       #code:I
    .restart local v7       #last:I
    .restart local v8       #line:Ljava/lang/String;
    .restart local v12       #tok:[Ljava/lang/String;
    :cond_c8
    return-object v10

    .line 302
    .end local v4           #idx:I
    .end local v7           #last:I
    .restart local v5       #idx:I
    :catch_c9
    move-exception v13

    move-object v9, v13

    move v4, v5

    .end local v5           #idx:I
    .restart local v4       #idx:I
    goto :goto_ad
.end method

.method public run()V
    .registers 4

    .prologue
    .line 81
    iget-object v1, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    const-string v2, "run :: "

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :goto_7
    :try_start_7
    invoke-direct {p0}, Lcom/android/server/NativeDaemonConnector;->listenToSocket()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    goto :goto_7

    .line 86
    :catch_b
    move-exception v0

    .line 87
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/android/server/NativeDaemonConnector;->TAG:Ljava/lang/String;

    const-string v2, "Error in NativeDaemonConnector"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    const-wide/16 v1, 0x1388

    invoke-static {v1, v2}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_7
.end method
