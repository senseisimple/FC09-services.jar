.class Lcom/android/server/am/ActivityManagerService$11;
.super Ljava/lang/Thread;
.source "ActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ActivityManagerService;->addErrorToDropBox(Ljava/lang/String;Lcom/android/server/am/ProcessRecord;Lcom/android/server/am/ActivityRecord;Lcom/android/server/am/ActivityRecord;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Landroid/app/ApplicationErrorReport$CrashInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ActivityManagerService;

.field final synthetic val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

.field final synthetic val$dbox:Landroid/os/DropBoxManager;

.field final synthetic val$dropboxTag:Ljava/lang/String;

.field final synthetic val$logFile:Ljava/io/File;

.field final synthetic val$report:Ljava/lang/String;

.field final synthetic val$sb:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/io/File;Landroid/app/ApplicationErrorReport$CrashInfo;Ljava/lang/String;Landroid/os/DropBoxManager;)V
    .registers 9
    .parameter
    .parameter "x0"
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 6888
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$11;->this$0:Lcom/android/server/am/ActivityManagerService;

    iput-object p3, p0, Lcom/android/server/am/ActivityManagerService$11;->val$report:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    iput-object p5, p0, Lcom/android/server/am/ActivityManagerService$11;->val$logFile:Ljava/io/File;

    iput-object p6, p0, Lcom/android/server/am/ActivityManagerService$11;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    iput-object p7, p0, Lcom/android/server/am/ActivityManagerService$11;->val$dropboxTag:Ljava/lang/String;

    iput-object p8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$dbox:Landroid/os/DropBoxManager;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    .prologue
    const/4 v12, 0x0

    const-string v13, "ActivityManager"

    const-string v8, "-b"

    .line 6891
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$report:Ljava/lang/String;

    if-eqz v8, :cond_10

    .line 6892
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/android/server/am/ActivityManagerService$11;->val$report:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6894
    :cond_10
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$logFile:Ljava/io/File;

    if-eqz v8, :cond_23

    .line 6896
    :try_start_14
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/android/server/am/ActivityManagerService$11;->val$logFile:Ljava/io/File;

    const/high16 v10, 0x2

    const-string v11, "\n\n[[TRUNCATED]]"

    invoke-static {v9, v10, v11}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_23} :catch_f4

    .line 6901
    :cond_23
    :goto_23
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    if-eqz v8, :cond_36

    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    iget-object v8, v8, Landroid/app/ApplicationErrorReport$CrashInfo;->stackTrace:Ljava/lang/String;

    if-eqz v8, :cond_36

    .line 6902
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/android/server/am/ActivityManagerService$11;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    iget-object v9, v9, Landroid/app/ApplicationErrorReport$CrashInfo;->stackTrace:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6905
    :cond_36
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "logcat_for_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/am/ActivityManagerService$11;->val$dropboxTag:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 6906
    .local v7, setting:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v8, v8, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    invoke-static {v8, v7, v12}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .line 6907
    .local v4, lines:I
    if-lez v4, :cond_e6

    .line 6908
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6911
    const/4 v2, 0x0

    .line 6913
    .local v2, input:Ljava/io/InputStreamReader;
    :try_start_61
    new-instance v8, Ljava/lang/ProcessBuilder;

    const/16 v9, 0xb

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "/system/bin/logcat"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string v11, "-v"

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string v11, "time"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-string v11, "-b"

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-string v11, "events"

    aput-object v11, v9, v10

    const/4 v10, 0x5

    const-string v11, "-b"

    aput-object v11, v9, v10

    const/4 v10, 0x6

    const-string v11, "system"

    aput-object v11, v9, v10

    const/4 v10, 0x7

    const-string v11, "-b"

    aput-object v11, v9, v10

    const/16 v10, 0x8

    const-string v11, "main"

    aput-object v11, v9, v10

    const/16 v10, 0x9

    const-string v11, "-t"

    aput-object v11, v9, v10

    const/16 v10, 0xa

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-direct {v8, v9}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    :try_end_ae
    .catchall {:try_start_61 .. :try_end_ae} :catchall_112
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_ae} :catch_126

    move-result-object v5

    .line 6917
    .local v5, logcat:Ljava/lang/Process;
    :try_start_af
    invoke-virtual {v5}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_b6
    .catchall {:try_start_af .. :try_end_b6} :catchall_112
    .catch Ljava/io/IOException; {:try_start_af .. :try_end_b6} :catch_12b

    .line 6918
    :goto_b6
    :try_start_b6
    invoke-virtual {v5}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_bd
    .catchall {:try_start_b6 .. :try_end_bd} :catchall_112
    .catch Ljava/io/IOException; {:try_start_b6 .. :try_end_bd} :catch_129

    .line 6919
    :goto_bd
    :try_start_bd
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v3, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_c6
    .catchall {:try_start_bd .. :try_end_c6} :catchall_112
    .catch Ljava/io/IOException; {:try_start_bd .. :try_end_c6} :catch_126

    .line 6922
    .end local v2           #input:Ljava/io/InputStreamReader;
    .local v3, input:Ljava/io/InputStreamReader;
    const/16 v8, 0x2000

    :try_start_c8
    new-array v0, v8, [C

    .line 6923
    .local v0, buf:[C
    :goto_ca
    invoke-virtual {v3, v0}, Ljava/io/InputStreamReader;->read([C)I

    move-result v6

    .local v6, num:I
    if-lez v6, :cond_11d

    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_d6
    .catchall {:try_start_c8 .. :try_end_d6} :catchall_123
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_d6} :catch_d7

    goto :goto_ca

    .line 6924
    .end local v0           #buf:[C
    .end local v6           #num:I
    :catch_d7
    move-exception v8

    move-object v1, v8

    move-object v2, v3

    .line 6925
    .end local v3           #input:Ljava/io/InputStreamReader;
    .end local v5           #logcat:Ljava/lang/Process;
    .local v1, e:Ljava/io/IOException;
    .restart local v2       #input:Ljava/io/InputStreamReader;
    :goto_da
    :try_start_da
    const-string v8, "ActivityManager"

    const-string v9, "Error running logcat"

    invoke-static {v8, v9, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e1
    .catchall {:try_start_da .. :try_end_e1} :catchall_112

    .line 6927
    if-eqz v2, :cond_e6

    :try_start_e3
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V
    :try_end_e6
    .catch Ljava/io/IOException; {:try_start_e3 .. :try_end_e6} :catch_11b

    .line 6931
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #input:Ljava/io/InputStreamReader;
    :cond_e6
    :goto_e6
    iget-object v8, p0, Lcom/android/server/am/ActivityManagerService$11;->val$dbox:Landroid/os/DropBoxManager;

    iget-object v9, p0, Lcom/android/server/am/ActivityManagerService$11;->val$dropboxTag:Ljava/lang/String;

    iget-object v10, p0, Lcom/android/server/am/ActivityManagerService$11;->val$sb:Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/os/DropBoxManager;->addText(Ljava/lang/String;Ljava/lang/String;)V

    .line 6932
    return-void

    .line 6897
    .end local v4           #lines:I
    .end local v7           #setting:Ljava/lang/String;
    :catch_f4
    move-exception v8

    move-object v1, v8

    .line 6898
    .restart local v1       #e:Ljava/io/IOException;
    const-string v8, "ActivityManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error reading "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/am/ActivityManagerService$11;->val$logFile:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v13, v8, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_23

    .line 6927
    .end local v1           #e:Ljava/io/IOException;
    .restart local v2       #input:Ljava/io/InputStreamReader;
    .restart local v4       #lines:I
    .restart local v7       #setting:Ljava/lang/String;
    :catchall_112
    move-exception v8

    :goto_113
    if-eqz v2, :cond_118

    :try_start_115
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V
    :try_end_118
    .catch Ljava/io/IOException; {:try_start_115 .. :try_end_118} :catch_119

    :cond_118
    :goto_118
    throw v8

    :catch_119
    move-exception v9

    goto :goto_118

    .end local v2           #input:Ljava/io/InputStreamReader;
    :catch_11b
    move-exception v8

    goto :goto_e6

    .restart local v0       #buf:[C
    .restart local v3       #input:Ljava/io/InputStreamReader;
    .restart local v5       #logcat:Ljava/lang/Process;
    .restart local v6       #num:I
    :cond_11d
    if-eqz v3, :cond_e6

    :try_start_11f
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_122
    .catch Ljava/io/IOException; {:try_start_11f .. :try_end_122} :catch_11b

    goto :goto_e6

    .end local v0           #buf:[C
    .end local v6           #num:I
    :catchall_123
    move-exception v8

    move-object v2, v3

    .end local v3           #input:Ljava/io/InputStreamReader;
    .restart local v2       #input:Ljava/io/InputStreamReader;
    goto :goto_113

    .line 6924
    .end local v5           #logcat:Ljava/lang/Process;
    :catch_126
    move-exception v8

    move-object v1, v8

    goto :goto_da

    .line 6918
    .restart local v5       #logcat:Ljava/lang/Process;
    :catch_129
    move-exception v8

    goto :goto_bd

    .line 6917
    :catch_12b
    move-exception v8

    goto :goto_b6
.end method
