.class public Lcom/android/server/Watchdog;
.super Ljava/lang/Thread;
.source "Watchdog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/Watchdog$Monitor;,
        Lcom/android/server/Watchdog$RebootRequestReceiver;,
        Lcom/android/server/Watchdog$RebootReceiver;,
        Lcom/android/server/Watchdog$HeartbeatHandler;
    }
.end annotation


# static fields
.field static final DB:Z = false

.field static final MEMCHECK_DEFAULT_MIN_ALARM:I = 0xb4

.field static final MEMCHECK_DEFAULT_MIN_SCREEN_OFF:I = 0x12c

.field static final MEMCHECK_DEFAULT_RECHECK_INTERVAL:I = 0x12c

.field static final MONITOR:I = 0xa9e

.field static final REBOOT_ACTION:Ljava/lang/String; = "com.android.service.Watchdog.REBOOT"

.field static final REBOOT_DEFAULT_INTERVAL:I = 0x0

.field static final REBOOT_DEFAULT_START_TIME:I = 0x2a30

.field static final REBOOT_DEFAULT_WINDOW:I = 0xe10

.field static final RECORD_KERNEL_THREADS:Z = true

.field static final TAG:Ljava/lang/String; = "Watchdog"

.field static final TIME_TO_RESTART:I = 0xea60

.field static final TIME_TO_WAIT:I = 0x7530

.field static final localLOGV:Z

.field static sWatchdog:Lcom/android/server/Watchdog;


# instance fields
.field mActivity:Lcom/android/server/am/ActivityManagerService;

.field mAlarm:Lcom/android/server/AlarmManagerService;

.field mBattery:Lcom/android/server/BatteryService;

.field mBootTime:J

.field final mCalendar:Ljava/util/Calendar;

.field mCheckupIntent:Landroid/app/PendingIntent;

.field mCompleted:Z

.field mCurrentMonitor:Lcom/android/server/Watchdog$Monitor;

.field mForceKillSystem:Z

.field final mHandler:Landroid/os/Handler;

.field mMinAlarm:I

.field mMinScreenOff:I

.field final mMonitors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/Watchdog$Monitor;",
            ">;"
        }
    .end annotation
.end field

.field mNeedScheduledCheck:Z

.field mPhonePid:I

.field mPower:Lcom/android/server/PowerManagerService;

.field mRebootIntent:Landroid/app/PendingIntent;

.field mRebootInterval:I

.field mReqMinNextAlarm:I

.field mReqMinScreenOff:I

.field mReqRebootInterval:I

.field mReqRebootNoWait:Z

.field mReqRebootStartTime:I

.field mReqRebootWindow:I

.field mReqRecheckInterval:I

.field mResolver:Landroid/content/ContentResolver;


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 179
    const-string v0, "watchdog"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/Watchdog;->mMonitors:Ljava/util/ArrayList;

    .line 87
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/Watchdog;->mCalendar:Ljava/util/Calendar;

    .line 88
    const/16 v0, 0x12c

    iput v0, p0, Lcom/android/server/Watchdog;->mMinScreenOff:I

    .line 89
    const/16 v0, 0xb4

    iput v0, p0, Lcom/android/server/Watchdog;->mMinAlarm:I

    .line 98
    iput v1, p0, Lcom/android/server/Watchdog;->mReqRebootInterval:I

    .line 99
    iput v1, p0, Lcom/android/server/Watchdog;->mReqRebootStartTime:I

    .line 100
    iput v1, p0, Lcom/android/server/Watchdog;->mReqRebootWindow:I

    .line 101
    iput v1, p0, Lcom/android/server/Watchdog;->mReqMinScreenOff:I

    .line 102
    iput v1, p0, Lcom/android/server/Watchdog;->mReqMinNextAlarm:I

    .line 103
    iput v1, p0, Lcom/android/server/Watchdog;->mReqRecheckInterval:I

    .line 180
    new-instance v0, Lcom/android/server/Watchdog$HeartbeatHandler;

    invoke-direct {v0, p0}, Lcom/android/server/Watchdog$HeartbeatHandler;-><init>(Lcom/android/server/Watchdog;)V

    iput-object v0, p0, Lcom/android/server/Watchdog;->mHandler:Landroid/os/Handler;

    .line 181
    return-void
.end method

.method static computeCalendarTime(Ljava/util/Calendar;JJ)J
    .registers 11
    .parameter "c"
    .parameter "curTime"
    .parameter "secondsSinceMidnight"

    .prologue
    .line 362
    invoke-virtual {p0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 364
    long-to-int v3, p3

    div-int/lit16 v2, v3, 0xe10

    .line 365
    .local v2, val:I
    const/16 v3, 0xb

    invoke-virtual {p0, v3, v2}, Ljava/util/Calendar;->set(II)V

    .line 366
    mul-int/lit16 v3, v2, 0xe10

    int-to-long v3, v3

    sub-long/2addr p3, v3

    .line 367
    long-to-int v3, p3

    div-int/lit8 v2, v3, 0x3c

    .line 368
    const/16 v3, 0xc

    invoke-virtual {p0, v3, v2}, Ljava/util/Calendar;->set(II)V

    .line 369
    const/16 v3, 0xd

    long-to-int v4, p3

    mul-int/lit8 v5, v2, 0x3c

    sub-int/2addr v4, v5

    invoke-virtual {p0, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 370
    const/16 v3, 0xe

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 372
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 373
    .local v0, newTime:J
    cmp-long v3, v0, p1

    if-gez v3, :cond_37

    .line 376
    const/4 v3, 0x5

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 377
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 380
    :cond_37
    return-wide v0
.end method

.method private dumpKernelStackTraces()Ljava/io/File;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 483
    const-string v1, "dalvik.vm.stack-trace-file"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 484
    .local v0, tracesPath:Ljava/lang/String;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_11

    :cond_f
    move-object v1, v2

    .line 489
    :goto_10
    return-object v1

    .line 488
    :cond_11
    invoke-direct {p0, v0}, Lcom/android/server/Watchdog;->native_dumpKernelStacks(Ljava/lang/String;)V

    .line 489
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_10
.end method

.method public static getInstance()Lcom/android/server/Watchdog;
    .registers 1

    .prologue
    .line 171
    sget-object v0, Lcom/android/server/Watchdog;->sWatchdog:Lcom/android/server/Watchdog;

    if-nez v0, :cond_b

    .line 172
    new-instance v0, Lcom/android/server/Watchdog;

    invoke-direct {v0}, Lcom/android/server/Watchdog;-><init>()V

    sput-object v0, Lcom/android/server/Watchdog;->sWatchdog:Lcom/android/server/Watchdog;

    .line 175
    :cond_b
    sget-object v0, Lcom/android/server/Watchdog;->sWatchdog:Lcom/android/server/Watchdog;

    return-object v0
.end method

.method private native native_dumpKernelStacks(Ljava/lang/String;)V
.end method


# virtual methods
.method public addMonitor(Lcom/android/server/Watchdog$Monitor;)V
    .registers 4
    .parameter "monitor"

    .prologue
    .line 213
    monitor-enter p0

    .line 214
    :try_start_1
    invoke-virtual {p0}, Lcom/android/server/Watchdog;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 215
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Monitors can\'t be added while the Watchdog is running"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 218
    :catchall_f
    move-exception v0

    monitor-exit p0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_f

    throw v0

    .line 217
    :cond_12
    :try_start_12
    iget-object v0, p0, Lcom/android/server/Watchdog;->mMonitors:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_12 .. :try_end_18} :catchall_f

    .line 219
    return-void
.end method

.method checkReboot(Z)V
    .registers 25
    .parameter "fromAlarm"

    .prologue
    .line 222
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRebootInterval:I

    move/from16 v19, v0

    if-ltz v19, :cond_27

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRebootInterval:I

    move/from16 v19, v0

    move/from16 v10, v19

    .line 226
    .local v10, rebootInterval:I
    :goto_10
    move v0, v10

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/Watchdog;->mRebootInterval:I

    .line 227
    if-gtz v10, :cond_38

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mRebootIntent:Landroid/app/PendingIntent;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/android/server/AlarmManagerService;->remove(Landroid/app/PendingIntent;)V

    .line 304
    :goto_26
    return-void

    .line 222
    .end local v10           #rebootInterval:I
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    move-object/from16 v19, v0

    const-string v20, "reboot_interval"

    const/16 v21, 0x0

    invoke-static/range {v19 .. v21}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v19

    move/from16 v10, v19

    goto :goto_10

    .line 234
    .restart local v10       #rebootInterval:I
    :cond_38
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRebootStartTime:I

    move/from16 v19, v0

    if-ltz v19, :cond_113

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRebootStartTime:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    move-wide/from16 v13, v19

    .line 238
    .local v13, rebootStartTime:J
    :goto_4d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRebootWindow:I

    move/from16 v19, v0

    if-ltz v19, :cond_125

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRebootWindow:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    :goto_60
    const-wide/16 v21, 0x3e8

    mul-long v15, v19, v21

    .line 242
    .local v15, rebootWindowMillis:J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRecheckInterval:I

    move/from16 v19, v0

    if-ltz v19, :cond_135

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mReqRecheckInterval:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    :goto_77
    const-wide/16 v21, 0x3e8

    mul-long v17, v19, v21

    .line 247
    .local v17, recheckInterval:J
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/Watchdog;->retrieveBrutalityAmount()V

    .line 252
    monitor-enter p0

    .line 253
    :try_start_7f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 254
    .local v6, now:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-wide v1, v6

    move-wide v3, v13

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/Watchdog;->computeCalendarTime(Ljava/util/Calendar;JJ)J

    move-result-wide v8

    .line 257
    .local v8, realStartTime:J
    mul-int/lit8 v19, v10, 0x18

    mul-int/lit8 v19, v19, 0x3c

    mul-int/lit8 v19, v19, 0x3c

    move/from16 v0, v19

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide v11, v0

    .line 258
    .local v11, rebootIntervalMillis:J
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/Watchdog;->mReqRebootNoWait:Z

    move/from16 v19, v0

    if-nez v19, :cond_b7

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/Watchdog;->mBootTime:J

    move-wide/from16 v19, v0

    sub-long v19, v6, v19

    sub-long v21, v11, v15

    cmp-long v19, v19, v21

    if-ltz v19, :cond_157

    .line 260
    :cond_b7
    if-eqz p1, :cond_145

    const-wide/16 v19, 0x0

    cmp-long v19, v15, v19

    if-gtz v19, :cond_145

    .line 262
    const/16 v19, 0xaf8

    const/16 v20, 0x5

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x1

    move-wide v0, v11

    long-to-int v0, v0

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x2

    move-wide v0, v13

    long-to-int v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x3

    move-wide v0, v15

    long-to-int v0, v0

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x4

    const-string v22, ""

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 265
    const-string v19, "Checkin scheduled forced"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/server/Watchdog;->rebootSystem(Ljava/lang/String;)V

    .line 266
    monitor-exit p0

    goto/16 :goto_26

    .line 298
    .end local v6           #now:J
    .end local v8           #realStartTime:J
    .end local v11           #rebootIntervalMillis:J
    :catchall_110
    move-exception v19

    monitor-exit p0
    :try_end_112
    .catchall {:try_start_7f .. :try_end_112} :catchall_110

    throw v19

    .line 234
    .end local v13           #rebootStartTime:J
    .end local v15           #rebootWindowMillis:J
    .end local v17           #recheckInterval:J
    :cond_113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    move-object/from16 v19, v0

    const-string v20, "reboot_start_time"

    const-wide/16 v21, 0x2a30

    invoke-static/range {v19 .. v22}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v19

    move-wide/from16 v13, v19

    goto/16 :goto_4d

    .line 238
    .restart local v13       #rebootStartTime:J
    :cond_125
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    move-object/from16 v19, v0

    const-string v20, "reboot_window"

    const-wide/16 v21, 0xe10

    invoke-static/range {v19 .. v22}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v19

    goto/16 :goto_60

    .line 242
    .restart local v15       #rebootWindowMillis:J
    :cond_135
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    move-object/from16 v19, v0

    const-string v20, "memcheck_recheck_interval"

    const-wide/16 v21, 0x12c

    invoke-static/range {v19 .. v22}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v19

    goto/16 :goto_77

    .line 270
    .restart local v6       #now:J
    .restart local v8       #realStartTime:J
    .restart local v11       #rebootIntervalMillis:J
    .restart local v17       #recheckInterval:J
    :cond_145
    cmp-long v19, v6, v8

    if-gez v19, :cond_181

    .line 272
    :try_start_149
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-wide v1, v6

    move-wide v3, v13

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/Watchdog;->computeCalendarTime(Ljava/util/Calendar;JJ)J

    move-result-wide v8

    .line 298
    :cond_157
    :goto_157
    monitor-exit p0
    :try_end_158
    .catchall {:try_start_149 .. :try_end_158} :catchall_110

    .line 302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mRebootIntent:Landroid/app/PendingIntent;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/android/server/AlarmManagerService;->remove(Landroid/app/PendingIntent;)V

    .line 303
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mRebootIntent:Landroid/app/PendingIntent;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-wide v2, v8

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/server/AlarmManagerService;->set(IJLandroid/app/PendingIntent;)V

    goto/16 :goto_26

    .line 274
    :cond_181
    add-long v19, v8, v15

    cmp-long v19, v6, v19

    if-gez v19, :cond_201

    .line 275
    :try_start_187
    move-object/from16 v0, p0

    move-wide v1, v6

    invoke-virtual {v0, v1, v2}, Lcom/android/server/Watchdog;->shouldWeBeBrutalLocked(J)Ljava/lang/String;

    move-result-object v5

    .line 276
    .local v5, doit:Ljava/lang/String;
    const/16 v19, 0xaf8

    const/16 v20, 0x5

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x2

    move-wide v0, v13

    long-to-int v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x3

    move-wide v0, v15

    long-to-int v0, v0

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x4

    if-eqz v5, :cond_1df

    move-object/from16 v22, v5

    :goto_1cc
    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 279
    if-nez v5, :cond_1e2

    .line 280
    const-string v19, "Checked scheduled range"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/server/Watchdog;->rebootSystem(Ljava/lang/String;)V

    .line 281
    monitor-exit p0

    goto/16 :goto_26

    .line 276
    :cond_1df
    const-string v22, ""

    goto :goto_1cc

    .line 286
    :cond_1e2
    add-long v19, v6, v17

    add-long v21, v8, v15

    cmp-long v19, v19, v21

    if-ltz v19, :cond_1fd

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    add-long v20, v6, v11

    move-object/from16 v0, v19

    move-wide/from16 v1, v20

    move-wide v3, v13

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/Watchdog;->computeCalendarTime(Ljava/util/Calendar;JJ)J

    move-result-wide v8

    goto/16 :goto_157

    .line 290
    :cond_1fd
    add-long v8, v6, v17

    goto/16 :goto_157

    .line 294
    .end local v5           #doit:Ljava/lang/String;
    :cond_201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    add-long v20, v6, v11

    move-object/from16 v0, v19

    move-wide/from16 v1, v20

    move-wide v3, v13

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/Watchdog;->computeCalendarTime(Ljava/util/Calendar;JJ)J
    :try_end_211
    .catchall {:try_start_187 .. :try_end_211} :catchall_110

    move-result-wide v8

    goto/16 :goto_157
.end method

.method public init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V
    .registers 11
    .parameter "context"
    .parameter "battery"
    .parameter "power"
    .parameter "alarm"
    .parameter "activity"

    .prologue
    const/4 v3, 0x0

    const-string v4, "com.android.service.Watchdog.REBOOT"

    .line 186
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    .line 187
    iput-object p2, p0, Lcom/android/server/Watchdog;->mBattery:Lcom/android/server/BatteryService;

    .line 188
    iput-object p3, p0, Lcom/android/server/Watchdog;->mPower:Lcom/android/server/PowerManagerService;

    .line 189
    iput-object p4, p0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    .line 190
    iput-object p5, p0, Lcom/android/server/Watchdog;->mActivity:Lcom/android/server/am/ActivityManagerService;

    .line 192
    new-instance v0, Lcom/android/server/Watchdog$RebootReceiver;

    invoke-direct {v0, p0}, Lcom/android/server/Watchdog$RebootReceiver;-><init>(Lcom/android/server/Watchdog;)V

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.android.service.Watchdog.REBOOT"

    invoke-direct {v1, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 194
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.service.Watchdog.REBOOT"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v3, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/Watchdog;->mRebootIntent:Landroid/app/PendingIntent;

    .line 197
    new-instance v0, Lcom/android/server/Watchdog$RebootRequestReceiver;

    invoke-direct {v0, p0}, Lcom/android/server/Watchdog$RebootRequestReceiver;-><init>(Lcom/android/server/Watchdog;)V

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.REBOOT"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v2, "android.permission.REBOOT"

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 201
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/Watchdog;->mBootTime:J

    .line 202
    return-void
.end method

.method public processStarted(Ljava/lang/String;I)V
    .registers 4
    .parameter "name"
    .parameter "pid"

    .prologue
    .line 205
    monitor-enter p0

    .line 206
    :try_start_1
    const-string v0, "com.android.phone"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 207
    iput p2, p0, Lcom/android/server/Watchdog;->mPhonePid:I

    .line 209
    :cond_b
    monitor-exit p0

    .line 210
    return-void

    .line 209
    :catchall_d
    move-exception v0

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0
.end method

.method rebootSystem(Ljava/lang/String;)V
    .registers 6
    .parameter "reason"

    .prologue
    .line 310
    const-string v1, "Watchdog"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Rebooting system because: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    const-string v1, "power"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Lcom/android/server/PowerManagerService;

    .line 312
    .local v0, pms:Lcom/android/server/PowerManagerService;
    invoke-virtual {v0, p1}, Lcom/android/server/PowerManagerService;->reboot(Ljava/lang/String;)V

    .line 313
    return-void
.end method

.method retrieveBrutalityAmount()V
    .registers 4

    .prologue
    .line 321
    iget v0, p0, Lcom/android/server/Watchdog;->mReqMinScreenOff:I

    if-ltz v0, :cond_15

    iget v0, p0, Lcom/android/server/Watchdog;->mReqMinScreenOff:I

    :goto_6
    mul-int/lit16 v0, v0, 0x3e8

    iput v0, p0, Lcom/android/server/Watchdog;->mMinScreenOff:I

    .line 325
    iget v0, p0, Lcom/android/server/Watchdog;->mReqMinNextAlarm:I

    if-ltz v0, :cond_20

    iget v0, p0, Lcom/android/server/Watchdog;->mReqMinNextAlarm:I

    :goto_10
    mul-int/lit16 v0, v0, 0x3e8

    iput v0, p0, Lcom/android/server/Watchdog;->mMinAlarm:I

    .line 329
    return-void

    .line 321
    :cond_15
    iget-object v0, p0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    const-string v1, "memcheck_min_screen_off"

    const/16 v2, 0x12c

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    goto :goto_6

    .line 325
    :cond_20
    iget-object v0, p0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    const-string v1, "memcheck_min_alarm"

    const/16 v2, 0xb4

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    goto :goto_10
.end method

.method public run()V
    .registers 15

    .prologue
    .line 385
    const/4 v9, 0x0

    .line 387
    .local v9, waitedHalf:Z
    :goto_1
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/server/Watchdog;->mCompleted:Z

    .line 388
    iget-object v10, p0, Lcom/android/server/Watchdog;->mHandler:Landroid/os/Handler;

    const/16 v11, 0xa9e

    invoke-virtual {v10, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 390
    monitor-enter p0

    .line 391
    const-wide/16 v7, 0x7530

    .line 397
    .local v7, timeout:J
    :try_start_e
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 398
    .local v5, start:J
    :goto_12
    const-wide/16 v10, 0x0

    cmp-long v10, v7, v10

    if-lez v10, :cond_33

    iget-boolean v10, p0, Lcom/android/server/Watchdog;->mForceKillSystem:Z
    :try_end_1a
    .catchall {:try_start_e .. :try_end_1a} :catchall_30

    if-nez v10, :cond_33

    .line 400
    :try_start_1c
    invoke-virtual {p0, v7, v8}, Ljava/lang/Object;->wait(J)V
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_30
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_1f} :catch_29

    .line 404
    :goto_1f
    const-wide/16 v10, 0x7530

    :try_start_21
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v5

    sub-long v7, v10, v12

    goto :goto_12

    .line 401
    :catch_29
    move-exception v1

    .line 402
    .local v1, e:Ljava/lang/InterruptedException;
    const-string v10, "Watchdog"

    invoke-static {v10, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1f

    .line 422
    .end local v1           #e:Ljava/lang/InterruptedException;
    .end local v5           #start:J
    :catchall_30
    move-exception v10

    monitor-exit p0
    :try_end_32
    .catchall {:try_start_21 .. :try_end_32} :catchall_30

    throw v10

    .line 407
    .restart local v5       #start:J
    :cond_33
    :try_start_33
    iget-boolean v10, p0, Lcom/android/server/Watchdog;->mCompleted:Z

    if-eqz v10, :cond_3e

    iget-boolean v10, p0, Lcom/android/server/Watchdog;->mForceKillSystem:Z

    if-nez v10, :cond_3e

    .line 409
    const/4 v9, 0x0

    .line 410
    monitor-exit p0

    goto :goto_1

    .line 413
    :cond_3e
    if-nez v9, :cond_59

    .line 416
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .local v3, pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v3, v11, v12}, Lcom/android/server/am/ActivityManagerService;->dumpStackTraces(ZLjava/util/ArrayList;Lcom/android/server/ProcessStats;Landroid/util/SparseArray;)Ljava/io/File;

    .line 419
    const/4 v9, 0x1

    .line 420
    monitor-exit p0

    goto :goto_1

    .line 422
    .end local v3           #pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_59
    monitor-exit p0
    :try_end_5a
    .catchall {:try_start_33 .. :try_end_5a} :catchall_30

    .line 428
    iget-object v10, p0, Lcom/android/server/Watchdog;->mCurrentMonitor:Lcom/android/server/Watchdog$Monitor;

    if-eqz v10, :cond_e2

    iget-object v10, p0, Lcom/android/server/Watchdog;->mCurrentMonitor:Lcom/android/server/Watchdog$Monitor;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    move-object v2, v10

    .line 430
    .local v2, name:Ljava/lang/String;
    :goto_69
    const/16 v10, 0xaf2

    invoke-static {v10, v2}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 432
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 433
    .restart local v3       #pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    iget v10, p0, Lcom/android/server/Watchdog;->mPhonePid:I

    if-lez v10, :cond_8b

    iget v10, p0, Lcom/android/server/Watchdog;->mPhonePid:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 437
    :cond_8b
    if-nez v9, :cond_e6

    const/4 v10, 0x1

    :goto_8e
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v3, v11, v12}, Lcom/android/server/am/ActivityManagerService;->dumpStackTraces(ZLjava/util/ArrayList;Lcom/android/server/ProcessStats;Landroid/util/SparseArray;)Ljava/io/File;

    move-result-object v4

    .line 442
    .local v4, stack:Ljava/io/File;
    const-wide/16 v10, 0x7d0

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V

    .line 446
    invoke-direct {p0}, Lcom/android/server/Watchdog;->dumpKernelStackTraces()Ljava/io/File;

    .line 449
    const-string v10, "-k -z -d -o /data/log/dumpstate_sys_watchdog"

    invoke-static {v10}, Landroid/os/Debug;->saveDumpstate(Ljava/lang/String;)V

    .line 452
    const-wide/16 v10, 0x2710

    :try_start_a3
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a6
    .catch Ljava/lang/InterruptedException; {:try_start_a3 .. :try_end_a6} :catch_f0

    .line 458
    :goto_a6
    new-instance v0, Lcom/android/server/Watchdog$1;

    const-string v10, "watchdogWriteToDropbox"

    invoke-direct {v0, p0, v10, v2, v4}, Lcom/android/server/Watchdog$1;-><init>(Lcom/android/server/Watchdog;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)V

    .line 464
    .local v0, dropboxThread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 466
    const-wide/16 v10, 0x7d0

    :try_start_b2
    invoke-virtual {v0, v10, v11}, Ljava/lang/Thread;->join(J)V
    :try_end_b5
    .catch Ljava/lang/InterruptedException; {:try_start_b2 .. :try_end_b5} :catch_f2

    .line 470
    :goto_b5
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v10

    if-nez v10, :cond_e8

    .line 471
    const-string v10, "Watchdog"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "*** WATCHDOG KILLING SYSTEM PROCESS: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v10

    invoke-static {v10}, Landroid/os/Process;->killProcess(I)V

    .line 473
    const/16 v10, 0xa

    invoke-static {v10}, Ljava/lang/System;->exit(I)V

    .line 478
    :goto_df
    const/4 v9, 0x0

    .line 479
    goto/16 :goto_1

    .line 428
    .end local v0           #dropboxThread:Ljava/lang/Thread;
    .end local v2           #name:Ljava/lang/String;
    .end local v3           #pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v4           #stack:Ljava/io/File;
    :cond_e2
    const-string v10, "null"

    move-object v2, v10

    goto :goto_69

    .line 437
    .restart local v2       #name:Ljava/lang/String;
    .restart local v3       #pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_e6
    const/4 v10, 0x0

    goto :goto_8e

    .line 475
    .restart local v0       #dropboxThread:Ljava/lang/Thread;
    .restart local v4       #stack:Ljava/io/File;
    :cond_e8
    const-string v10, "Watchdog"

    const-string v11, "Debugger connected: Watchdog is *not* killing the system process"

    invoke-static {v10, v11}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_df

    .line 453
    .end local v0           #dropboxThread:Ljava/lang/Thread;
    :catch_f0
    move-exception v10

    goto :goto_a6

    .line 467
    .restart local v0       #dropboxThread:Ljava/lang/Thread;
    :catch_f2
    move-exception v10

    goto :goto_b5
.end method

.method shouldWeBeBrutalLocked(J)Ljava/lang/String;
    .registers 7
    .parameter "curTime"

    .prologue
    .line 341
    iget-object v0, p0, Lcom/android/server/Watchdog;->mBattery:Lcom/android/server/BatteryService;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/Watchdog;->mBattery:Lcom/android/server/BatteryService;

    invoke-virtual {v0}, Lcom/android/server/BatteryService;->isPowered()Z

    move-result v0

    if-nez v0, :cond_f

    .line 342
    :cond_c
    const-string v0, "battery"

    .line 355
    :goto_e
    return-object v0

    .line 345
    :cond_f
    iget v0, p0, Lcom/android/server/Watchdog;->mMinScreenOff:I

    if-ltz v0, :cond_27

    iget-object v0, p0, Lcom/android/server/Watchdog;->mPower:Lcom/android/server/PowerManagerService;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/android/server/Watchdog;->mPower:Lcom/android/server/PowerManagerService;

    invoke-virtual {v0}, Lcom/android/server/PowerManagerService;->timeSinceScreenOn()J

    move-result-wide v0

    iget v2, p0, Lcom/android/server/Watchdog;->mMinScreenOff:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_27

    .line 347
    :cond_24
    const-string v0, "screen"

    goto :goto_e

    .line 350
    :cond_27
    iget v0, p0, Lcom/android/server/Watchdog;->mMinAlarm:I

    if-ltz v0, :cond_3f

    iget-object v0, p0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    invoke-virtual {v0}, Lcom/android/server/AlarmManagerService;->timeToNextAlarm()J

    move-result-wide v0

    iget v2, p0, Lcom/android/server/Watchdog;->mMinAlarm:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_3f

    .line 352
    :cond_3c
    const-string v0, "alarm"

    goto :goto_e

    .line 355
    :cond_3f
    const/4 v0, 0x0

    goto :goto_e
.end method
