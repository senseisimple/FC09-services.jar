.class public Lcom/android/server/ProcessStats$Stats;
.super Ljava/lang/Object;
.source "ProcessStats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ProcessStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Stats"
.end annotation


# instance fields
.field public active:Z

.field public added:Z

.field public baseName:Ljava/lang/String;

.field public base_majfaults:J

.field public base_minfaults:J

.field public base_stime:J

.field public base_uptime:J

.field public base_utime:J

.field final cmdlineFile:Ljava/lang/String;

.field public interesting:Z

.field public name:Ljava/lang/String;

.field nameWidth:I

.field public final pid:I

.field public rel_majfaults:I

.field public rel_minfaults:I

.field public rel_stime:I

.field public rel_uptime:J

.field public rel_utime:I

.field public removed:Z

.field final statFile:Ljava/lang/String;

.field final threadStats:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/ProcessStats$Stats;",
            ">;"
        }
    .end annotation
.end field

.field final threadsDir:Ljava/lang/String;

.field public working:Z

.field final workingThreads:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/ProcessStats$Stats;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(IIZ)V
    .registers 11
    .parameter "_pid"
    .parameter "parentPid"
    .parameter "includeThreads"

    .prologue
    const/4 v4, 0x0

    const-string v6, "task"

    const-string v5, "stat"

    const-string v3, "/proc"

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    iput p1, p0, Lcom/android/server/ProcessStats$Stats;->pid:I

    .line 208
    if-gez p2, :cond_58

    .line 209
    new-instance v0, Ljava/io/File;

    const-string v2, "/proc"

    iget v2, p0, Lcom/android/server/ProcessStats$Stats;->pid:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .local v0, procDir:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "stat"

    invoke-direct {v2, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ProcessStats$Stats;->statFile:Ljava/lang/String;

    .line 211
    new-instance v2, Ljava/io/File;

    const-string v3, "cmdline"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ProcessStats$Stats;->cmdlineFile:Ljava/lang/String;

    .line 212
    new-instance v2, Ljava/io/File;

    const-string v3, "task"

    invoke-direct {v2, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ProcessStats$Stats;->threadsDir:Ljava/lang/String;

    .line 213
    if-eqz p3, :cond_53

    .line 214
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/ProcessStats$Stats;->threadStats:Ljava/util/ArrayList;

    .line 215
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/server/ProcessStats$Stats;->workingThreads:Ljava/util/ArrayList;

    .line 231
    :goto_52
    return-void

    .line 217
    :cond_53
    iput-object v4, p0, Lcom/android/server/ProcessStats$Stats;->threadStats:Ljava/util/ArrayList;

    .line 218
    iput-object v4, p0, Lcom/android/server/ProcessStats$Stats;->workingThreads:Ljava/util/ArrayList;

    goto :goto_52

    .line 221
    .end local v0           #procDir:Ljava/io/File;
    :cond_58
    new-instance v0, Ljava/io/File;

    const-string v2, "/proc"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .restart local v0       #procDir:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    const-string v3, "task"

    invoke-direct {v2, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget v3, p0, Lcom/android/server/ProcessStats$Stats;->pid:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 225
    .local v1, taskDir:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "stat"

    invoke-direct {v2, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ProcessStats$Stats;->statFile:Ljava/lang/String;

    .line 226
    iput-object v4, p0, Lcom/android/server/ProcessStats$Stats;->cmdlineFile:Ljava/lang/String;

    .line 227
    iput-object v4, p0, Lcom/android/server/ProcessStats$Stats;->threadsDir:Ljava/lang/String;

    .line 228
    iput-object v4, p0, Lcom/android/server/ProcessStats$Stats;->threadStats:Ljava/util/ArrayList;

    .line 229
    iput-object v4, p0, Lcom/android/server/ProcessStats$Stats;->workingThreads:Ljava/util/ArrayList;

    goto :goto_52
.end method
