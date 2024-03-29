.class public Lcom/android/server/NotificationPlayer;
.super Ljava/lang/Object;
.source "NotificationPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/NotificationPlayer$1;,
        Lcom/android/server/NotificationPlayer$CmdThread;,
        Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;,
        Lcom/android/server/NotificationPlayer$Command;
    }
.end annotation


# static fields
.field private static final PLAY:I = 0x1

.field private static final STOP:I = 0x2

.field private static final mDebug:Z


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mCmdQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/android/server/NotificationPlayer$Command;",
            ">;"
        }
    .end annotation
.end field

.field private final mCompletionHandlingLock:Ljava/lang/Object;

.field private mCompletionThread:Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

.field private mLooper:Landroid/os/Looper;

.field private mPlayer:Landroid/media/MediaPlayer;

.field private mState:I

.field private mTag:Ljava/lang/String;

.field private mThread:Lcom/android/server/NotificationPlayer$CmdThread;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .parameter "tag"

    .prologue
    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    .line 239
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/NotificationPlayer;->mCompletionHandlingLock:Ljava/lang/Object;

    .line 246
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/server/NotificationPlayer;->mState:I

    .line 254
    if-eqz p1, :cond_19

    .line 255
    iput-object p1, p0, Lcom/android/server/NotificationPlayer;->mTag:Ljava/lang/String;

    .line 259
    :goto_18
    return-void

    .line 257
    :cond_19
    const-string v0, "NotificationPlayer"

    iput-object v0, p0, Lcom/android/server/NotificationPlayer;->mTag:Ljava/lang/String;

    goto :goto_18
.end method

.method static synthetic access$000(Lcom/android/server/NotificationPlayer;)Landroid/os/Looper;
    .registers 2
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/server/NotificationPlayer;Landroid/os/Looper;)Landroid/os/Looper;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/server/NotificationPlayer;)Landroid/media/MediaPlayer;
    .registers 2
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/server/NotificationPlayer;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/server/NotificationPlayer;->mPlayer:Landroid/media/MediaPlayer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/server/NotificationPlayer;)Ljava/lang/String;
    .registers 2
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/server/NotificationPlayer;Landroid/media/AudioManager;)Landroid/media/AudioManager;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/server/NotificationPlayer;->mAudioManager:Landroid/media/AudioManager;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/server/NotificationPlayer;)Ljava/util/LinkedList;
    .registers 2
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/server/NotificationPlayer;Lcom/android/server/NotificationPlayer$Command;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/android/server/NotificationPlayer;->startSound(Lcom/android/server/NotificationPlayer$Command;)V

    return-void
.end method

.method static synthetic access$602(Lcom/android/server/NotificationPlayer;Lcom/android/server/NotificationPlayer$CmdThread;)Lcom/android/server/NotificationPlayer$CmdThread;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/server/NotificationPlayer;->mThread:Lcom/android/server/NotificationPlayer$CmdThread;

    return-object p1
.end method

.method static synthetic access$700(Lcom/android/server/NotificationPlayer;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/android/server/NotificationPlayer;->releaseWakeLock()V

    return-void
.end method

.method private acquireWakeLock()V
    .registers 2

    .prologue
    .line 340
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_9

    .line 341
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 343
    :cond_9
    return-void
.end method

.method private enqueueLocked(Lcom/android/server/NotificationPlayer$Command;)V
    .registers 3
    .parameter "cmd"

    .prologue
    .line 307
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 308
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mThread:Lcom/android/server/NotificationPlayer$CmdThread;

    if-nez v0, :cond_18

    .line 309
    invoke-direct {p0}, Lcom/android/server/NotificationPlayer;->acquireWakeLock()V

    .line 310
    new-instance v0, Lcom/android/server/NotificationPlayer$CmdThread;

    invoke-direct {v0, p0}, Lcom/android/server/NotificationPlayer$CmdThread;-><init>(Lcom/android/server/NotificationPlayer;)V

    iput-object v0, p0, Lcom/android/server/NotificationPlayer;->mThread:Lcom/android/server/NotificationPlayer$CmdThread;

    .line 311
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mThread:Lcom/android/server/NotificationPlayer$CmdThread;

    invoke-virtual {v0}, Lcom/android/server/NotificationPlayer$CmdThread;->start()V

    .line 313
    :cond_18
    return-void
.end method

.method private releaseWakeLock()V
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_9

    .line 347
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 349
    :cond_9
    return-void
.end method

.method private startSound(Lcom/android/server/NotificationPlayer$Command;)V
    .registers 9
    .parameter "cmd"

    .prologue
    .line 130
    :try_start_0
    iget-object v3, p0, Lcom/android/server/NotificationPlayer;->mCompletionHandlingLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_63

    .line 134
    :try_start_3
    iget-object v4, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    if-eqz v4, :cond_1a

    iget-object v4, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    invoke-virtual {v4}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v4

    sget-object v5, Ljava/lang/Thread$State;->TERMINATED:Ljava/lang/Thread$State;

    if-eq v4, v5, :cond_1a

    .line 136
    iget-object v4, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    invoke-virtual {v4}, Landroid/os/Looper;->quit()V

    .line 138
    :cond_1a
    new-instance v4, Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

    invoke-direct {v4, p0, p1}, Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;-><init>(Lcom/android/server/NotificationPlayer;Lcom/android/server/NotificationPlayer$Command;)V

    iput-object v4, p0, Lcom/android/server/NotificationPlayer;->mCompletionThread:Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

    .line 139
    iget-object v4, p0, Lcom/android/server/NotificationPlayer;->mCompletionThread:Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

    monitor-enter v4
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_60

    .line 140
    :try_start_24
    iget-object v5, p0, Lcom/android/server/NotificationPlayer;->mCompletionThread:Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

    invoke-virtual {v5}, Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;->start()V

    .line 141
    iget-object v5, p0, Lcom/android/server/NotificationPlayer;->mCompletionThread:Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    .line 142
    monitor-exit v4
    :try_end_2f
    .catchall {:try_start_24 .. :try_end_2f} :catchall_5d

    .line 143
    :try_start_2f
    monitor-exit v3
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_60

    .line 146
    :try_start_30
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p1, Lcom/android/server/NotificationPlayer$Command;->requestTime:J

    sub-long v0, v3, v5

    .line 147
    .local v0, delay:J
    const-wide/16 v3, 0x3e8

    cmp-long v3, v0, v3

    if-lez v3, :cond_5c

    .line 148
    iget-object v3, p0, Lcom/android/server/NotificationPlayer;->mTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Notification sound delayed by "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "msecs"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_5c} :catch_63

    .line 154
    .end local v0           #delay:J
    :cond_5c
    :goto_5c
    return-void

    .line 142
    :catchall_5d
    move-exception v5

    :try_start_5e
    monitor-exit v4
    :try_end_5f
    .catchall {:try_start_5e .. :try_end_5f} :catchall_5d

    :try_start_5f
    throw v5

    .line 143
    :catchall_60
    move-exception v4

    monitor-exit v3
    :try_end_62
    .catchall {:try_start_5f .. :try_end_62} :catchall_60

    :try_start_62
    throw v4
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_63} :catch_63

    .line 151
    :catch_63
    move-exception v3

    move-object v2, v3

    .line 152
    .local v2, e:Ljava/lang/Exception;
    iget-object v3, p0, Lcom/android/server/NotificationPlayer;->mTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error loading sound for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/android/server/NotificationPlayer$Command;->uri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5c
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .registers 5
    .parameter "mp"

    .prologue
    .line 217
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_4

    .line 224
    :cond_4
    iget-object v0, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    monitor-enter v0

    .line 225
    :try_start_7
    iget-object v1, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_1f

    .line 226
    iget-object v1, p0, Lcom/android/server/NotificationPlayer;->mCompletionHandlingLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_24

    .line 227
    :try_start_12
    iget-object v2, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    if-eqz v2, :cond_1b

    .line 228
    iget-object v2, p0, Lcom/android/server/NotificationPlayer;->mLooper:Landroid/os/Looper;

    invoke-virtual {v2}, Landroid/os/Looper;->quit()V

    .line 230
    :cond_1b
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/server/NotificationPlayer;->mCompletionThread:Lcom/android/server/NotificationPlayer$CreationAndCompletionThread;

    .line 231
    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_12 .. :try_end_1f} :catchall_21

    .line 233
    :cond_1f
    :try_start_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_24

    .line 234
    return-void

    .line 231
    :catchall_21
    move-exception v2

    :try_start_22
    monitor-exit v1
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    :try_start_23
    throw v2

    .line 233
    :catchall_24
    move-exception v1

    monitor-exit v0
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_24

    throw v1
.end method

.method public play(Landroid/content/Context;Landroid/net/Uri;ZI)V
    .registers 9
    .parameter "context"
    .parameter "uri"
    .parameter "looping"
    .parameter "stream"

    .prologue
    const/4 v3, 0x1

    .line 275
    new-instance v0, Lcom/android/server/NotificationPlayer$Command;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/server/NotificationPlayer$Command;-><init>(Lcom/android/server/NotificationPlayer$1;)V

    .line 276
    .local v0, cmd:Lcom/android/server/NotificationPlayer$Command;
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/android/server/NotificationPlayer$Command;->requestTime:J

    .line 277
    iput v3, v0, Lcom/android/server/NotificationPlayer$Command;->code:I

    .line 278
    iput-object p1, v0, Lcom/android/server/NotificationPlayer$Command;->context:Landroid/content/Context;

    .line 279
    iput-object p2, v0, Lcom/android/server/NotificationPlayer$Command;->uri:Landroid/net/Uri;

    .line 280
    iput-boolean p3, v0, Lcom/android/server/NotificationPlayer$Command;->looping:Z

    .line 281
    iput p4, v0, Lcom/android/server/NotificationPlayer$Command;->stream:I

    .line 282
    iget-object v1, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 283
    :try_start_1a
    invoke-direct {p0, v0}, Lcom/android/server/NotificationPlayer;->enqueueLocked(Lcom/android/server/NotificationPlayer$Command;)V

    .line 284
    const/4 v2, 0x1

    iput v2, p0, Lcom/android/server/NotificationPlayer;->mState:I

    .line 285
    monitor-exit v1

    .line 286
    return-void

    .line 285
    :catchall_22
    move-exception v2

    monitor-exit v1
    :try_end_24
    .catchall {:try_start_1a .. :try_end_24} :catchall_22

    throw v2
.end method

.method public setUsesWakeLock(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    .line 329
    iget-object v1, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/android/server/NotificationPlayer;->mThread:Lcom/android/server/NotificationPlayer$CmdThread;

    if-eqz v1, :cond_2f

    .line 332
    :cond_8
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "assertion failed mWakeLock="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " mThread="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/NotificationPlayer;->mThread:Lcom/android/server/NotificationPlayer$CmdThread;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 335
    :cond_2f
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 336
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/server/NotificationPlayer;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/NotificationPlayer;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 337
    return-void
.end method

.method public stop()V
    .registers 5

    .prologue
    const/4 v3, 0x2

    .line 293
    iget-object v1, p0, Lcom/android/server/NotificationPlayer;->mCmdQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 296
    :try_start_4
    iget v2, p0, Lcom/android/server/NotificationPlayer;->mState:I

    if-eq v2, v3, :cond_1d

    .line 297
    new-instance v0, Lcom/android/server/NotificationPlayer$Command;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/android/server/NotificationPlayer$Command;-><init>(Lcom/android/server/NotificationPlayer$1;)V

    .line 298
    .local v0, cmd:Lcom/android/server/NotificationPlayer$Command;
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/android/server/NotificationPlayer$Command;->requestTime:J

    .line 299
    const/4 v2, 0x2

    iput v2, v0, Lcom/android/server/NotificationPlayer$Command;->code:I

    .line 300
    invoke-direct {p0, v0}, Lcom/android/server/NotificationPlayer;->enqueueLocked(Lcom/android/server/NotificationPlayer$Command;)V

    .line 301
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/server/NotificationPlayer;->mState:I

    .line 303
    .end local v0           #cmd:Lcom/android/server/NotificationPlayer$Command;
    :cond_1d
    monitor-exit v1

    .line 304
    return-void

    .line 303
    :catchall_1f
    move-exception v2

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_4 .. :try_end_21} :catchall_1f

    throw v2
.end method
